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
//              D7--|P3.2      P6.1|--X	     	   	   A7--|P2.4      P3.0|--X
//                  |              |			  		   |              |
//              D6--|P3.3      P4.0|--X		 	       A6--|P5.6      P5.7|--X
//                  |              |			   		   |              |
//         		D5--|P4.1      P4.2|--X		 	       A5--|P6.6       RST|--X
//                  |              |			  		   |              |
//       	    D4--|P4.3      P4.4|--X			       A4--|P6.7      P1.6|--X
//                  |              |			  		   |              |
//            	D3--|P1.5      P4.5|--X		 	       A3--|P2.3      P1.7|--X
//                  |              |					   |              |
//             	D2--|P4.6      P4.7|--X			       A2--|P5.1      P5.0|--X
//                  |              |		     		   |              |
//     			D1--|P6.5      P5.4|--X	    	       A1--|P3.5      P5.2|--X
//                  |              |			  		   |              |
//       		D0--|P6.4      P5.5|--X	 		       A0--|P3.7      P3.6|--X
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


#define PASSPHRASE 0x0000 //HARDCODED PASSPHRASE - 16 bits
#define UNIT_TESTING 1
#define THRESHOLD 200
#define NUM_PHOTOS 4

#define A0 (P3IN & BIT7 == 0)
#define A1 (P3IN & BIT5 == 0)
#define A2 (P5IN & BIT1 == 0)
#define A3 (P2IN & BIT3 == 0)
#define A4 (P6IN & BIT7 == 0)
#define A5 (P6IN & BIT6 == 0)
#define A6 (P5IN & BIT6 == 0)
#define A7 (P2IN & BIT4 == 0)

#define D0 (P6IN & BIT4 == 0)
#define D1 (P6IN & BIT5 == 0)
#define D2 (P4IN & BIT6 == 0)
#define D3 (P1IN & BIT5 == 0)
#define D4 (P4IN & BIT3 == 0)
#define D5 (P4IN & BIT1 == 0)
#define D6 (P3IN & BIT3 == 0)
#define D7 (P3IN & BIT2 == 0)

/* ==== Initialize Global Variables ==== */
int seconds = 0; //Seconds Timer
int laser_timer_b_flag = 0;
int ten_sec_timer_a_flag = 0;
int test_second_flag = 0; //TESTING

int laser_count = 0;

int on_count = 0;
int on_flag = 0;

int main(void) {
	/* ==== Initialize Local Variables ==== */
	int i = 0;                       // loop variable
	int unique_id;                   // unique i.d. to pulse on laser
	int ack_passphrase;              // local ackn passphrase to verify wtih received
	int received_ack_passphrase;     // ack passphrase received from target unit
	char address = 0;                // address line bits (condensed into a single char)
	char start;                      // start bits (4 bits) - to signify to photo receiver on target
	char check_sum = 0;                  // check-sum bits (4 bits) - sum of all address bits

	/* Turn off Watch-Dog Timers */
    WDTCTL = WDTPW | WDTHOLD;


    /* ==== Set Direction of GPIO ==== */
    // PXDIR - BITWISE : 1 OUTPUT 0 INPUT
//    P1DIR |= (BIT0|BIT1|BIT4);  			//Port 1 OUTPUT Bits- 0, 1, 4
//    P1DIR &= ~(BIT5);						//Port 1 INPUT Bits - 5
//    P2DIR |= (BIT0  | BIT7); 				//Port 2 OUTPUT Bits- 0,6
//    P2DIR &= ~(BIT3 | BIT4 | BIT6); 				//Port 2 INPUT Bits - 3, 4, 7, 6
//    P3DIR &= ~(BIT2 | BIT3 | BIT5 | BIT7); 	//Port 3 INPUT Bits - 2, 3, 5, 7
//    P4DIR &= ~(BIT1 | BIT3 | BIT6); 		//Port 4 INPUT Bits - 1, 3, 6
//    P5DIR &= ~(BIT1 | BIT6);				//Port 5 INPUT Bits - 1, 6
//    P6DIR &= ~(BIT4 | BIT5 | BIT6 | BIT7); 	//Port 6 INPUT Bits - 4, 5, 6, 7

	#if UNIT_TESTING
		P5->SEL1 |= BIT4; // Configure P5.4 for ADC
		P5->SEL0 |= BIT4;

		//Set all appropriate I/O
		P3->DIR |= BIT0;	//OUTPUT - D0 Transmitter
		P4->DIR &= ~BIT0;	//INPUT - Valid Transmission on Receiver
		P6->DIR &= ~BIT0; //INPUT - D0 on Receiver

		P1->DIR |= BIT0; //OUTPUT - LED
		P2->DIR |= BIT7;

		//Enabling Valid Transmission Interrupt Line
		P2->DIR &= ~BIT6; //INPUT - VALID TRANSMISSION
		P2->IE = BIT6; //Interrupt Enable on P2.6
		P2->IES &=~BIT6; //Interrupt Edge Select on P2.6
	#endif


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

	//unique_id = 43690; //1010101010110100
  unique_id = 0;
  int preamble = 170;
  int preamble_flag = 1; // 1 means send preamble. 0 means send unique id
	/* ============ Setup Timers ===========================================*/
	//Setup Timer A1 to perform 1 Hz interrupts (for seconds counter) - 1s
    TIMER_A0->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG; //Clear interrupt flag to begin
    TIMER_A0->CCTL[0] = CCIE;	// TACCR0 interrupt enabled
    TIMER_A0->CCR[0] = 32768;	// Set count limit (32.768kHz Clock 32,768/32,768 = 1 tick/second)
    TIMER_A0->CTL = TIMER_A_CTL_SSEL__ACLK | TIMER_A_CTL_MC__CONTINUOUS;	// ACLK, continuous mode (VERIFY SPEED)


    //Setup Timer A1 to perform 5.47 kHz interrupts (for laser) -  25us
    TIMER_A1->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG; //Clear interrupt flag to begin
    TIMER_A1->CCTL[0] = TIMER_A_CCTLN_CCIE; // TACCR0 interrupt enabled
    TIMER_A1->CCR[0] = 3; // Set count limit (32.768kHz Clock 32,768/3 = 5,427 tick/second)
    TIMER_A1->CTL |= TIMER_A_CTL_SSEL__ACLK | TIMER_A_CTL_MC__CONTINUOUS;// ACLK, continuous mode

    NVIC->ISER[0] = 1 << ((TA0_0_IRQn) & 31);
    NVIC->ISER[0] = 1 << ((TA1_0_IRQn) & 30);
    NVIC->ISER[0] = 1 << ((PORT2_IRQn) & 29);

    __enable_interrupt();


    i=0;
	/*===== DEBUGGING - UNIT TEST FOR LASER SIGNAL - must be 40kHz */
	#if UNIT_TESTING
	while(1) {
		//while (!laser_timer_b_flag);    //wait for 3kHz signal
		//laser_timer_b_flag = 0;         //reset flag
		/*P1OUT ^= BIT5; //toggle P1.5 on MSP*/
//		printf("ADC 14: %d", ADC14->MEM[0]);
//		 for (i = 200; i > 0; i--);          // Delay
		  // Start sampling/conversion

		//R.F. TESTS: P6.0 = D0 on Receiver, P4.0 = Valid Transmission on Receiver
		//			  P3.0 = D0 on Transmitter
		while (!laser_timer_b_flag);
		laser_timer_b_flag = 0;

		int packet_to_send = preamble_flag == 1 ? preamble : unique_id;
    
		((packet_to_send >> (7-i)) & BIT0) ? (P1->OUT &= ~(BIT0)) : (P1->OUT |= BIT0);
		i++;
		if (i == 8) {
			i = 0;
			if (preamble_flag == 0) {
				unique_id = 128; // just sent a packet, up the packet number
			}
			preamble_flag ^= 1; // toggle preamble flag
		}

		if (on_flag && on_count < 16) {
			on_count++;
		} else {
			on_flag = 0;
		}

//		if (P4IN & BIT0 != 0){
//			if (P6IN & BIT0 != 0)
//				P1OUT ^= BIT0;
//		}

	}
	#endif
	/*============================================================*/

	/* ==== Main Loop (Perform pulsing, poll for response?) ==== */
	while(1){
		/* UPDATE ACKNOWLEDGEMENT PASSPHRASE */
		if (ten_sec_timer_a_flag) {
			ten_sec_timer_a_flag = 0;
			ack_passphrase = PASSPHRASE | seconds; //NO ENCRYPTION YET - simply 0xXXXX or'd w/ seconds count
		}

		/* IF OPERATOR TURNED LASER/RECEIVER ON, BEGIN PULSING/CHECKING RECEIVED ACK*/
		while (P1IN & BIT1)  {
			/* PULSE UNIQUE ID, CHECK VALID TRANSMISSION SIGNAL*/
			for (i = 0; i < 16; i ++) {
				while (!laser_timer_b_flag);    //wait for 40kHz signal
				laser_timer_b_flag = 0;         //reset flag

				//Turn P2.2 ON or OFF depending on state of unique I.D.
				((unique_id >> i) & BIT0) ? (P2OUT |= BIT6) : (P2OUT &= ~(BIT6));
			}

			/*CHECK R.F. RECEIVER VALID TRANSMISSION (V_T) SIGNAL*/
			if (P2IN & BIT7) {
				//Get 1st set of data bits from receiver on  - MSB
				received_ack_passphrase = 0;// |= ((BIT0/*CHANGE TO NEW BITS*/) << 8);

				for (i=0; i < 10000; i++); //DELAY - this probably will not work, need to figure out anohter way

				//Get 2nd set of data bits from receiver on  - LSB
				received_ack_passphrase = 0; //|=((BIT0/*CHANGE TO NEW BITS*/));

				//Verify with our local copy
				if (received_ack_passphrase == ack_passphrase){
					//TURN ON INDICATION LED!! (FRIENDLY TARGET IDENTIFIED)
					P2OUT |= BIT0;
				}
			}
		}
	}
}


/*  ISR : Timer_A0
 *  Description: This timer acts as our "RTC" and increments the "seconds" variable every second,
 *  and also depending on the value of "seconds" it sets the ten_sec_timer_a_flag.
 */
void TA0_0_IRQHandler(void) {
	TIMER_A0->CCTL[0] &= ~TIMER_A_CCTLN_CCIFG;
	TIMER_A0->CCR[0] += 32768;
    seconds++;
    ten_sec_timer_a_flag = (seconds % 10 == 0);
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


/*  ISR : VT_IRQHandler
 *  Description: This timer is for the laser transmitter to send the friendly target its unique I.D.
 *  at a rate of 40kHz (25us).
 */
void VT_IRQHandler(void) {
	P2->IFG &= ~BIT6; //Clear interrupt flag
	on_flag = 1;
}

