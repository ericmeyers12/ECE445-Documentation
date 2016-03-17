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
//               X--|P2_5         P1_5|--A2
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
//               X--|P2_2         P2_3|--VT 
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
//       LAS_TRANS--|P4_0         P4_5|--X
//                  |                 |
//            SYNC--|P4_1         P4_4|--X
//                  |                 |
//             GND--|P4_2         P4_3|--X
//                  |                 | 
//                   -----------------
//
//  Built with CCE Version: 3.2.2 and IAR Embedded Workbench Version: 4.11B
//******************************************************************************
#include <msp430.h>
#include "pins.h"

int main(void)
{
  char address = 0;

  address |= (P1_0 | P1_1 | P1_2 | P1_3 | P1_4 | P1_5 | P1_6 | P1_7);

  //Setup preamble bits, address bits (from receiver) and checksum to be in global integer

  //Laser Pulse Word =
  //StB3 StB2 StB1 StB0 A7 ... A0 CS3 CS2 CS1 CS0

  //Setup Timer A to do 0.1 Hz interrupts (for seconds counter) - 10s
  char rtc_timer_a_flag = 0;

  //Setup Timer B to do 40 kHz interrupts (for laser) -  25us
  char laser_timer_b_flag = 0;


  while (P2_0 == 1) // While V_IN_RF_LAS Switch is high then pulse the laser and check R.F. Signal
  {
    //PULSE LASER USING INT 
    //If Valid Transmission Flag is high then gather datalines from R.F. Receiver
  }
  // If V_IN_RF_LAS switch != high then enter LPM3 w/ interrupts enabled
  __bis_SR_register(LPM3_bits + GIE);
}  



  