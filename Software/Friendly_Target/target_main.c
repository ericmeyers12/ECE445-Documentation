//******************************************************************************
//  MSP-EXP432P401R Infantry Identification Friend or Foe Software
//  University of Illinois - ECE445 - Senior Design - Project #11
//  Authors: Eric Meyers and Noah Prince
//  Date(s): Initial Revision (3/15/2016)
//			 Revision 1.1 - New Microprocessor (4/2/2016)
//					- switched from MSP430F2274 to MSP-EXP432P401R - major changes
//  ----------------------------------------------------------------------------
//  FRIENDLY INTERROGATOR UNIT
//
//  Description: This piece of software is meant to control the friendly interrogator unit
//               on the Infantry I.F.F. System. Upon connecting all hardware components correctly
//               this software will generate 40kHz interrupts to send a laser transmission, and
//               then proceed to poll for an acknowledgement from the friendly target unit.
//
//                   J1		     J3			        		J4			J2
//                   --------------				   		    --------------
//            V_IN--|3V3         5V|--X	 	  LASER_TRANS--|P2.7       GND|--GND
//                  |              |               		   |              |
//           	 X--|P6.0       GND|--GND 	 		  V_T--|P2.6      P2.5|--X
//                  |              |			 		   |			  |
//              D0--|P3.2      P6.1|--X	     	   	   A7--|P2.4      P3.0|--X
//                  |              |			  		   |              |
//              D1--|P3.3      P4.0|--X		 	       A6--|P5.6      P5.7|--X
//                  |              |			   		   |              |
//         		D2--|P4.1      P4.2|--X		 	       A5--|P6.6       RST|--X
//                  |              |			  		   |              |
//       	    D3--|P4.3      P4.4|--X			       A4--|P6.7      P1.6|--X
//                  |              |			  		   |              |
//            	D4--|P1.5      P4.5|--X		 	       A3--|P2.3      P1.7|--X
//                  |              |					   |              |
//             	D5--|P4.6      P4.7|--X			       A2--|P5.1      P5.0|--X
//                  |              |		     		   |              |
//     			D6--|P6.5      P5.4|--X	    	       A1--|P3.5      P5.2|--X
//                  |              |			  		   |              |
//       		D7--|P6.4      P5.5|--X	 		       A0--|P3.7      P3.6|--X
//                   --------------							--------------
//
//						P1.0 - POWER_LAS_LED
//						P1.1 - POWER_LAS_RF_BUTTON
//						P1.4 - SYNC BUTTON
//						P2.0 - LED_INDICATOR (Friendly or Enemy)
//
// INPUT GPIO PINS : P2.4, P5.6, P6.6, P6.7, P2.3, P5.1, P3.5, P3.7 = R.F. Address Lines
//                   P3.2, P3.3, P4.1, P4.3, P1.5, P4.6, P6.5, P6.4 = R.F. Data Lines
//                   P1.1 = Power Button for R.F. Receiver and Laser Transmitter
//                   P1.4 = Sync Button to Reset/Sync Clocks
//					 P2.6 = Valid Transmission = to determine when R.F. Signal incoming
//
// OUTPUT GPIO PINS: P1.0 = Power to R.F./Laser Subsystem Indicator
//					 P2.0 = LED Indicator (Friendly or Enemy)
//                   P2.7 = Laser Transmitter Output
//
//  Built with CCE Version: 3.2.2 and IAR Embedded Workbench Version: 4.11B
//******************************************************************************
#include "msp.h"


#define PASSPHRASE 0xB00B //HARDCODED PASSPHRASE - 16 bits
#define UNIT_TEST_LASER_SIG 1
#define THRESHOLD 100
#define NUM_PHOTOS 4

/* ==== Initialize Global Variables ==== */
int seconds = 0; //Seconds Timer
int laser_timer_b_flag = 0;
int ten_sec_timer_a_flag = 0;

int valid_transmission = 0;
int valid_transmission_starting_idx = 0;

int laser_count = 0;

int photo_idx = 0;

uint32_t photo_last[4];
uint32_t photo_current[4];

uint32_t photo_binary[4][8];

int last_packet;
int missed_packets = 0;
int start_counting = 0;
int our_count = 0;
int sixteen_count = 0;
int packet[8];

void check_for_zero(int packet_value) {
	if (packet_value == 128 && start_counting == 0) {
		  missed_packets = 0;
		  start_counting = 1;
		  our_count = 0;
		  sixteen_count = 0;
	}
}
void count_packet(int packet_value) {
    if (our_count == 1000 && start_counting == 1) {
  	  start_counting = 0;
  	  //printf("%d\n", missed_packets);
      // put a debugger here, verify missed_packets is low.
    }

    if (packet_value == 128) { // we expect it to be the next number

    } else {
      missed_packets += 1;
    }
}

int next_photo_idx(int idx) {
	return (idx+1)%8;
}

void update_indices() {
  // rollback current value
  int i;
  for (i = 0; i < NUM_PHOTOS; i++) {
    photo_last[i] = photo_current[i];
  }
  // increment photo idx
  photo_idx = next_photo_idx(photo_idx);
}

// Gets the binary value from the last cycle of a given photodiode
uint32_t get_prev_binary_value(int photo, int idx) {
  if (idx == 0) {
    return photo_binary[photo][7];
  } else {
    return photo_binary[photo][idx - 1];
  }
}

// Gets the binary value of the given photodiode at the current instance in time
//  and stores it in photo_binary
void get_binary(int photo) {
  int dif = photo_current[photo] - photo_last[photo];

  // Was a 0, is now a 1.
  if (dif > THRESHOLD) {
    photo_binary[photo][photo_idx] = 1;
  }
  // Was a 1, is now a 0
  else if (dif < -THRESHOLD) {
    photo_binary[photo][photo_idx] = 0;
  }
  // Was within THRESHOLD of 0. It is what it was before
  else {
    photo_binary[photo][photo_idx] = get_prev_binary_value(photo, photo_idx);
  }
}

// Gets all NUM_PHOTOS values at the current instance in time and stores them
//  in photo_binary
void get_photo_binaries() {
  int i;
  for (i = 0; i < NUM_PHOTOS; i++) {
    get_binary(i);
  }

  update_indices();
}

int main(void) {
	/* ==== Initialize Local Variables ==== */
	int i = 0;                       // loop variable
	int unique_id;                   // unique i.d. to pulse on laser
	int ack_passphrase;              // local ackn passphrase to verify wtih received
	int received_ack_passphrase;     // ack passphrase received from target unit
	char address = 0;                // address line bits (condensed into a single char)
	char start;                      // start bits (4 bits) - to signify to photo receiver on target
	char check_sum;                  // check-sum bits (4 bits) - sum of all address bits

	/* Turn off Watch-Dog Timers */
    WDTCTL = WDTPW | WDTHOLD;


    /* ==== Set Direction of GPIO ==== */
    // PXDIR - BITWISE : 1 OUTPUT 0 INPUT
//    P1DIR &= ~(BIT1 | BIT4 |BIT5); 	//Clear Bits 1, 4, and 5 on P1DIR to set P1.1, P1.4 and P1.5 to input
    P1DIR |= (BIT0|BIT5);  //Set Bit 0 on P1DIR to set P1.0 to output
    P2DIR | (BIT0);
    //P2DIR |= (BIT0  | BIT6); //Set Bit 0 and 6 on P2DIR to set P2.0 and P2.6 to output
    //P2DIR &= ~(BIT3 | BIT4 | BIT7); //Clear Bit 3, 4, and 7 on P2DIR to set P2.3, P2.4, and P2.7 to intput
//    P3DIR &= ~(BIT2 | BIT3 | BIT5 | BIT7); //Clear Bits 2, 3, 5 and 7 on P3DIR to set P3.2, P3.3, P3.5, and P3.7 to input
//    P4DIR &= ~(BIT1 | BIT3 | BIT6); //Clear Bits 1, 3 and 6 on P4DIR to set P4.1, P4.3, and P4.6 to input
//    P5DIR &= ~(BIT1 | BIT6); //Clear Bits 1 and 6 on P5DIR to set P5.1 and P5.6 to input
//    P6DIR &= ~(BIT4 | BIT5 | BIT6 | BIT7); //Clear Bits 4, 5, 6, and 7 on P6DIR to set P6.4, P6.5, P6.6, and P6.7 to input

    P5->SEL1 |= BIT4;                           // Configure P5.4 for ADC
      P5->SEL0 |= BIT4;


    /* =======Laser Unique I.D. ==========================================
	---------------------------------------------------------------------
	| ST_B3 | ST_B2 | ST_B1 | ST_B0 | A7 ... A0 | CS3 | CS2 | CS1 | CS0 |
	---------------------------------------------------------------------
	with ST_B3 - ST_B0 = Start Bits (Logic Highs (1s))
	   	 A7 - A0 = R.F. Address Lines (Depending on 8-Pin DIP Switch)
	     CS3 - CS0 = CheckSum Bits (A7+A6+...+A1+A0)
	======================================================================*/
	//Combine address into single char, set start bits to all high - P2.4, P5.6, P6.6, P6.7, P2.3, P5.1, P3.5, P3.7
	address |= ((P2IN & (BIT3 | BIT4)) | (P3IN & (BIT5 | BIT7)) | (P5IN & (BIT1 | BIT6)) | (P6IN & (BIT6 | BIT7)));
	start = 0x0F; //Start signifier (1111)

	//calculate check-sum bits based off of how many ones in unique i.d.
	for(; i < 8; i++)
		  check_sum += (address>>i) & BIT0;

	//shift bits properly to set the unique_id upon starting
	unique_id = (start << 12) | (address << 4) | check_sum;


	/* ============ Setup Timers ===========================================*/
	//Setup Timer A1 to perform 1 Hz interrupts (for seconds counter) - 1s
    //TIMER_A0->CCTL[0] = CCIE;	// TACCR0 interrupt enabled
//    TIMER_A0->CCR[0] = 32768;	// Set count limit (32.768kHz Clock 32,768/32,768 = 1 tick/second)
//    TIMER_A0->CTL = TIMER_A_CTL_SSEL__ACLK | TIMER_A_CTL_MC__UP;	// ACLK, continuous mode (VERIFY SPEED)
//

    TIMER_A1->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG;
    TIMER_A1->CCTL[0] = TIMER_A_CCTLN_CCIE;                          // TACCR0 interrupt enabled
    TIMER_A1->CCR[0] = 3;
    TIMER_A1->CTL |= TIMER_A_CTL_TASSEL_1 | TIMER_A_CTL_MC_2;                // ACLK, continues mode
    //TIMER_A0->CTL |= TIMER_A_CTL_TASSEL_1 | TIMER_A_CTL_MC_2;                // ACLK, continues mode

    //Setup Timer A1 to perform 5 kHz interrupts (for laser) -  25us
//    TIMER_A1->CCTL[0] = TIMER_A_CCTLN_CCIE; // TACCR0 interrupt enabled
//    TIMER_A1->CCR[0] = 10000; // Set count limit (3 MHz Clock = 3,000,000/600 = 5,000 ticks until one interrupt is registered)
//    TIMER_A1->CTL = TIMER_A_CTL_SSEL__SMCLK | TIMER_A_CTL_MC__CONTINUOUS; //Timer A0 with SMCLK @ 40kHz @ 3.0V(VERIFY), count up.


    /*===SAMPLING INITIALIZATION Sampling time, S&H=16, ADC14 on ====*/
	ADC14->CTL0 = ADC14_CTL0_SHT0_2 | ADC14_CTL0_SHP | ADC14_CTL0_ON; //| ADC14_CTL0_SSEL_3;
	ADC14->CTL1 = ADC14_CTL1_RES_2;         // Use sampling timer, 12-bit conversion results
	ADC14->MCTL[0] |= ADC14_MCTLN_INCH_1;   // A1 ADC input select; Vref=AVCC
	ADC14->IER0 |= ADC14_IER0_IE0;          // Enable ADC conv complete interrupt

	/*==============================================================*/

    __enable_interrupt();
    NVIC->ISER[0] = 1 << ((TA1_0_IRQn) & 31);
    NVIC->ISER[0] = 1 << ((ADC14_IRQn) & 30);
   // NVIC->ISER[0] = 1 << ((TA0_0_IRQn) & 30);

	/*===== DEBUGGING - UNIT TEST FOR LASER SIGNAL - must be 40kHz */
	#if UNIT_TEST_LASER_SIG
	while(1) {
		ADC14->CTL0 |= ADC14_CTL0_ENC | ADC14_CTL0_SC;

		while (!/*ten_sec_timer_a_flag*/laser_timer_b_flag);    //wait for 5kHz signal
		/*ten_sec_timer_a_flag*/laser_timer_b_flag = 0;         //reset flag
//		printf("ADC 14: %d", ADC14->MEM[0]);
//		 for (i = 200; i > 0; i--);          // Delay
		  // Start sampling/conversion

		get_photo_binaries();

		if (photo_idx == 0) {
			int lol = 0;

		}

		int found_10 = 1;
		int found_01 = 1;

		// When in valid transmission receiving mode
		if (valid_transmission) {
			P1OUT |= BIT5; // Toggle that sumbitch

			if (photo_idx == valid_transmission_starting_idx) {
				int x;
				int y = valid_transmission_starting_idx; // The starting index
				// valid may have started recording with ending index 1. That means the packet starts with
				//   index 2-7, then 1. So [2,3,4,5,6,7,1]. This loop just handles that wrapping
				for (x = 0; x < 8; x++) {
					packet[x] = photo_binary[0][(y + x) % 8];
				}

				  int packet_value = 0;
				  int i;
				  for (i = 0; i < 8; i++) {
				    packet_value = packet_value | (packet[i] << (7-i));
				  }

				  check_for_zero(packet_value);

				//for (x = 0; x < 8; x++) {
					//printf("%d ", packet[x]);
				//}
				//printf("\n");

				valid_transmission = 0; // reset valid_transmission flag
			}

		}
		// When not in valid transmission receiving mode, check if we received the preamble packet
		else {
			int j;
			for (j = 0; j < 8; j++) {
				int idx = (photo_idx + j) % 8; // current photo index is 1 + last received photo idx. Then we go back 8 from there.
				if (photo_binary[0][idx] != (j+1)%2){ // should be 10101010
					found_10 = 0;
				}
				if (photo_binary[0][idx] != (j)%2){ // should be 01010101
					found_01 = 0;
				}
			}

			if (found_10 == 1) {
				valid_transmission = 1; // Start listening for the packet
				valid_transmission_starting_idx = photo_idx; // This marks the end idx in the photo_binary array of the transmission
			}
		}

		// Enable lightup
		if (found_01 == 1 || found_10 == 1 || valid_transmission) {
			P1OUT |= BIT0;
		} else {
			P1OUT &= ~BIT0;
			P1OUT &= ~BIT5;
		}

		sixteen_count = (sixteen_count + 1) % 16;

		if (sixteen_count == 0 && start_counting == 1) {

			  int packet_value = 0;
			  int i;
			  for (i = 0; i < 8; i++) {
			    packet_value = packet_value | (packet[i] << (7-i));
			  }

			// Do something with packet
			  count_packet(packet_value);

				our_count++;

		}

	}
	#endif
	/*============================================================*/
}


/*  ISR : Timer_A0
 *  Description: This timer acts as our "RTC" and increments the "seconds" variable every second,
 *  and also depending on the value of "seconds" it sets the ten_sec_timer_a_flag.
 */
void TA0_0_IRQHandler(void) {
	TIMER_A0->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG;
	TA0CCR0 += 32768;
    seconds++;
    ten_sec_timer_a_flag = (seconds % 10 == 0);
    //laser_timer_b_flag = 1;
}

/*  ISR : Timer_A1
 *  Description: This timer is for the laser transmitter to send the friendly target its unique I.D.
 *  at a rate of 40kHz (25us).
 */
void TA1_0_IRQHandler(void) {
	TIMER_A1->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG;
	laser_timer_b_flag = 1; //Set the laser_timer_b_flag to 1
    TIMER_A1->CCR[0] += 3;
}


void ADC14_IRQHandler(void) {
	//P1OUT ^= BIT5; //toggle P1.5 on MSP

  photo_current[0] = ADC14->MEM[0];
  //P1OUT^=BIT5;
}

