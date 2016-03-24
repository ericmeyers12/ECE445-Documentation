//******************************************************************************
//  MSP430F2274 Infantry Identification Friend or Foe Software 
//  FRIENDLY INTERROGATOR UNIT
//  Author: Eric Meyers and Noah Prince
//  Date(s): Initial Revision 3/15/2016
// 
//  Description: This piece of software is an interrupt based piece of microcontroller... 
//
//                        MSP430F22x4
//                    -----------------
//               X--|TEST/SBTCK   P1_7|--A0
//                  |                 |
//            3.3V--|DVCC         P1_6|--A1
//                  |                 |
//            SYNC--|P2_5         P1_5|--A2
//                  |                 |
//             GND--|DVSS         P1_4|--A3
//                  |                 |
//         CRYS_IN--|XOUT         P1_3|--A4
//                  |                 |
//        CRYS_OUT--|XIN          P1_2|--A5
//                  |                 |
//            3.3V--|RST          P1_1|--A6
//                  |                 |
//             LED--|P2_0         P1_0|--A7
//                  |                 |
//     V_IN_RF_LAS--|P2_1         P2_4|--X
//                  |                 |
//       LAS_TRANS--|P2_2         P2_3|--VT 
//                  |                 |
//              D0--|P3_0         P3_7|--D4
//                  |                 |
//              D1--|P3_1         P3_6|--D5
//                  |                 |
//              D2--|P3_2         P3_5|--D6
//                  |                 |
//              D3--|P3_3         P3_4|--D7
//                  |                 |
//            GND<--|AVSS         P4_7|--X
//                  |                 |
//            3.3V--|AVCC         P4_6|--X
//                  |                 |
//               X--|P4_0         P4_5|--X
//                  |                 |
//               X--|P4_1         P4_4|--X
//                  |                 |
//               X--|P4_2         P4_3|--X
//                  |                 | 
//                   -----------------
// INPUT GPIO PINS : P1.0, P1.1, P1.2, P1.3, P1.4, P1.5, P1.6, P1.7 = R.F. Address Lines
//                   P3.0, P3.1, P3.2, P3.3, P3.4, P3.5, P3.6, P3.7 = R.F. Data Lines
//                   P2.1 = Power Button for R.F. Receiver and Laser Transmitter
//                   P2.5 = Sync Button to Reset/Sync Clocks
//                   
//       
// OUTPUT GPIO PINS: P2.0 = LED Indicator (Friendly or Enemy)
//                   P2.2 = Laser Transmitter
//
//  Built with CCE Version: 3.2.2 and IAR Embedded Workbench Version: 4.11B
//******************************************************************************
#include <msp430.h>
#include "pins.h"

#define PASSPHRASE 0xB00B //HARDCODED PASSPHRASE - 16 bits

/* ==== Initialize Global Variables ==== */
int seconds = 0; //Seconds Timer 
int ten_seconds = 0; //Ten Second Timer

/*  Main Function
 *  Description: This main function performs all necessary tasks to take in the 
 *              appropriate address lines, pulse the appropriate unique I.D. to the
 *              friendly target unit and wait for an acknowledgement. This "ack" from
 *              the target unit
 */
int main(void)
{
  /* ==== Initialize Local Variables ==== */
  int i = 0;                       // loop variable
  int unique_id;                   // unique i.d. to pulse on laser
  int ack_passphrase;              // local ackn passphrase to verify wtih received
  int received_ack_passphrase;     // ack passphrase received from target unit
  char address;                    // address line bits (condensed into a single char)
  char start;                      // start bits (4 bits) - to signify to photo receiver on target
  char check_sum;                  // check-sum bits (4 bits) - sum of all address bits

  /* Turn off Watch-Dog Timers */
  WDTCTL = WDTPW + WDTHOLD; 

  /* ==== Set Direction of GPIO ==== */
  //PXDIR - BITWISE : 1 OUTPUT 0 INPUT : source: page 329 MSP430x2xx  */
  P1DIR |= 0xFFFF; // All pins on P1 (P1.0 - P1.7) are inputs - Address Lines
  P3DIR |= 0xFFFF; // All pins on P3 (P3.0 - P3.7) are inputs - Data Lines
  P2DIR &= (BIT0 | BIT2); //Set P2.0 & P2.2 as output - Laser Transmitter & Indicator
  P2DIR |= (BIT1 | BIT5); //Set P2.1 & P2.5 as input - Sync and Power to R.F. & Laser

  /* =======Laser Unique I.D. ==========================================
  ---------------------------------------------------------------------
  | ST_B3 | ST_B2 | ST_B1 | ST_B0 | A7 ... A0 | CS3 | CS2 | CS1 | CS0 |
  ---------------------------------------------------------------------
  with ST_B3 - ST_B0 = Start Bits (Logic Highs (1s))
       A7 - A0 = R.F. Address Lines (Depending on 8-Pin DIP Switch)
       CS3 - CS0 = CheckSum Bits (A7+A6+...+A1+A0)
  ======================================================================*/
  //Combine address into single char, set start bits to all high
  address |= (P1IN & 0xFF);
  start = 0x0F;

  //calculate check-sum bits based off of how many ones in unique i.d.
  for(; i < 8; i++) {
          check_sum += (address>>i) & BIT0;
  }

  //shift bits properly to set the unique_id upon starting
  unique_id = (start << 12) | (address << 4) | check_sum;

  /* ============ Setup Timers ===========================================*/
  //Setup Timer A1 to perform 1 Hz interrupts (for seconds counter) - 1s
  char ten_sec_timer_a_flag = 0; //Validation period flag - 10 seconds
  TA0CCR0 = 32768; // Set count limit (32.768 kHz Clock = 32,768 ticks until one interrupt is registered)
  TA0CCTL0 = 0x10; //Enable counter interrupts - bit 4
  TA0CTL = TASSEL_1 + MC_1; //Timer A0 with ACLK @ 32768Hz @ 3.0V(VERIFY), count up.

  //Setup Timer B0 to do 40 kHz interrupts (for laser) -  25us
  char laser_timer_b_flag = 0;
  TB0CCR0 = 100; // Set count limit (16 MHz Clock = 16000 ticks until one interrupt is registered)
  TB0CCTL0 = 0x10; //Enable counter interrupts - bit 4
  TB0CTL = TBSSEL_2 + ID_2 + MC_1; //Timer A0 with SMCLK @ 16 MHz/4 = 4MHz @ 3.0V(VERIFY), count up.


  /* ==== Main Loop (Perform pulsing, poll for response?) ==== */
  while (1)
  {
    /* UPDATE ACKNOWLEDGEMENT PASSPHRASE */
    if (ten_sec_timer_a_flag)
    {
      ten_sec_timer_a_flag = 0;
      ack_passphrase = PASSPHRASE | seconds; 
    }

    /* IF OPERATOR TURNED LASER/RECEIVER ON, BEGIN PULSING/CHECKING RECEIVED ACK*/
    if (P2IN & BIT1) 
    {
      /* PULSE UNIQUE ID, CHECK VALID TRANSMISSION SIGNAL*/
        for (i = 0; i < 16; i ++)
        {
          while (!laser_timer_b_flag);    //wait for 40kHz signal
          laser_timer_b_flag = 0;         //reset flag

          //Turn P2.2 ON or OFF depending on state of unique I.D.
          ((unique_id >> i) & BIT0) ? (P2OUT |= 0x02) : (P2OUT &= ~0x02);
        }

        /*CHECK R.F. RECEIVER VALID TRANSMISSION SIGNAL*/
        if (P2IN & BIT3){
          //Get data bits from receiver on P3.0 - P3.7
          received_ack_passphrase = (P3IN & 0xFF);
          //Verify with our local copy
          if (received_ack_passphrase == ack_passphrase)
            //TURN ON INDICATION LED!! (FRIENDLY TARGET IDENTIFIED)
            P2OUT |= BIT0;
        } 
      }
    } 
}
 

/*  ISR : Timer_A3
 *  Description: This timer acts as our "RTC" and increments the "seconds" variable every second,
 *  (obviously), and also depending on the value of "seconds" it sets the ten_sec_timer_a_flag.
 */
#pragma vector = TIMER0_A0_VECTOR
__interrupt void Timer0_A0 (void) 
{
  seconds++;
  ten_sec_timer_a_flag = (seconds % 10 == 0);
}


/*  ISR : Timer_B3
 *  Description: This timer triggers the laser transmitter at 40 kHz 
 */
#pragma vector = TIMER0_B0_VECTOR
__interrupt void Timer0_B0 (void) 
{
  laser_timer_b_flag = 1; //Set the laser_timer_b_flag to 
}

  