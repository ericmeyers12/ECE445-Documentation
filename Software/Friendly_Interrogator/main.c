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
//                   J1		     J3			        J4			J2
//                   --------------				    --------------
//            V_IN--|3V3         5V|--X	    	X--|P2.7       GND|--GND
//                  |              |               |              |
//           	 X--|P6.0       GND|--GND  	 	 --|P2.6      P2.5|--V_T
//                  |              |			   |			  |
//              D0--|P3.2      P6.1|--A0	     --|P2.4      P3.0|--
//                  |              |			   |              |
//              D1--|P3.3      P4.0|--A1		 --|P5.6      P5.7|--
//                  |              |			   |              |
//         		D2--|P4.1      P4.2|--A2		 --|P6.6       RST|--
//                  |              |			   |              |
//       	    D3--|P4.3      P4.4|--A3		 --|P6.7      P1.6|--
//                  |              |			   |              |
//            	D4--|P1.5      P4.5|--A4		 --|P2.3      P1.7|--
//                  |              |			   |              |
//             	D5--|P4.6      P4.7|--A5		 --|P5.1      P5.0|--
//                  |              |		       |              |
//     			D6--|P6.5      P5.4|--A6	     --|P3.5      P5.2|--
//                  |              |			   |              |
//       		D7--|P6.4      P5.5|--A7		 --|P3.7      P3.6|--LAS_TRANSMIT
//                   --------------					--------------
//
//						P1.0 - POWER_LAS_LED
//						P1.1 - POWER_LAS_RF_BUTTON
//						P1.4 - SYNC BUTTON
//						P2.0 - LED_INDICATOR (Friendly or Enemy)
//
// INPUT GPIO PINS : P6.1, P4.0, P4.2, P4.4, P4.5, P4.7, P5.4, P5.5 = R.F. Address Lines
//                   P3.2, P3.3, P4.1, P4.3, P1.5, P4.6, P6.5, P6.4 = R.F. Data Lines
//                   P1.1 = Power Button for R.F. Receiver and Laser Transmitter
//                   P1.4 = Sync Button to Reset/Sync Clocks
//					 P2.5 = Valid Transmission = to determine when R.F. Signal incoming
//
// OUTPUT GPIO PINS: P1.0 = Power to R.F./Laser Subsystem Indicator
//					 P2.0 = LED Indicator (Friendly or Enemy)
//                   P2.2 = Laser Transmitter Output
//
//  Built with CCE Version: 3.2.2 and IAR Embedded Workbench Version: 4.11B
//******************************************************************************
#include "msp.h"


#define PASSPHRASE 0xB00B //HARDCODED PASSPHRASE - 16 bits
#define UNIT_TEST_LASER_SIG 1

/* ==== Initialize Global Variables ==== */
int seconds = 0; //Seconds Timer
int laser_timer_b_flag = 0;
int ten_sec_timer_a_flag = 0;


int main(void) {
	/* ==== Initialize Local Variables ==== */
	int i = 0;                       // loop variable
	int unique_id;                   // unique i.d. to pulse on laser
	int ack_passphrase;              // local ackn passphrase to verify wtih received
	int received_ack_passphrase;     // ack passphrase received from target unit
	char address;                    // address line bits (condensed into a single char)
	char start;                      // start bits (4 bits) - to signify to photo receiver on target
	char check_sum;                  // check-sum bits (4 bits) - sum of all address bits

	/* Turn off Watch-Dog Timers */
    WDTCTL = WDTPW | WDTHOLD;

    /* ==== Set Direction of GPIO ==== */
    // PXDIR - BITWISE : 1 OUTPUT 0 INPUT
    P1DIR &= ~(BIT1 | BIT4 |BIT5); 	//Clear Bits 1, 4, and 5 on P1DIR to set P1.1, P1.4 and P1.5 to input
    P1DIR |= BIT0; 					//Set Bit 0 on P1DIR to set P1.0 to output
    P2DIR |= (BIT0 | BIT2); 		//Set Bit 0 on P2DIR to set P2.0 and P2.2 to output
    P2DIR &= ~(BIT5);				//Clear Bit 5 on P2DIR to set P2.5 as input
    P3DIR &= ~(BIT2 | BIT3); 		//Clear Bits 2 and 3 on P3DIR to set P3.2 and P3.3 to input
    P4DIR &= ~(0xFFFF); 			//Clear all bits on P4DIR to set as input
    P5DIR &= ~(BIT4 | BIT5); 		//Clear Bits 4 and 5 on P5DIR to set P5.4 and P5.5 to input
    P6DIR &= ~(BIT1 | BIT4 | BIT5); //Clear Bits 1, 4, and 5 on P6DIR to set P6.1, P6.4 and P6.5 to input


    TA0CCTL0 = CCIE;                          // TACCR0 interrupt enabled
    TA0CCR0 = 50000;
    TA0CTL = TASSEL__SMCLK | MC__CONTINUOUS;   // SMCLK, continuous mode





    SCB->SCR |= SCB_SCR_SLEEPONEXIT_Msk;              // Enable sleep on exit from ISR
    __enable_interrupt();
    NVIC->ISER[0] = 1 << ((TA0_0_IRQn) & 31);
    while (1){
        __sleep();
        __no_operation();
    }
}


/*  ISR : Timer_A0
 *  Description: This timer acts as our "RTC" and increments the "seconds" variable every second,
 *  and also depending on the value of "seconds" it sets the ten_sec_timer_a_flag.
 */
void TA0_0_IRQHandler(void) {
    /*TA0CCTL0 &= ~CCIFG;
    P1OUT ^= BIT0;
    TA0CCR0 += 50000;                       // Add Offset to TACCR0
    */
    seconds++;
    ten_sec_timer_a_flag = (seconds % 10 == 0);
}

/*  ISR : Timer_A1
 *  Description: This timer is for the laser transmitter to send the friendly target its unique I.D.
 *  at a rate of 40kHz (25us).
 */
void TA1_0_IRQHandler(void) {
	laser_timer_b_flag = 1; //Set the laser_timer_b_flag to 1

}
