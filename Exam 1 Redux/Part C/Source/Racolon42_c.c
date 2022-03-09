/* Problem 1E.6 Redux File C
 * Ryan Colon
 * 02.27.22
 * This program is my best possible implementation of the ttu_set_main_pll function
 */

#ifndef STM32L4
  #define STM32L4
#endif

#include <math.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

#define LED2_Pin GPIO5  //Pin number for PA5, the LED2 pin, can be found in nucleo board 64 user manual
#define LED2_GPIO_Port GPIOA  //PORTA address, can be found in libopencm3 docs

#define TOGGLE_LED gpio_toggle(LED2_GPIO_Port,LED2_Pin)

void ttu_set_main_pll( uint32_t u32_freqKhz){
    /* My goal for this function is to be as accurate as possible to the input frequency. My design philosophy is described below.
     * How I interperet the values PLLR, PLLM, and PLLN. 
     * PLLR: This is a limiter to make sure the value from VCO is within the Sysclock's range
     * PLLM: I think of this variable as a resolution knob. The value of this will determine how much frequency a 'step' in N is.
     * PLLN: This value has the most discrete steps (78), so use it as the "free variable" for this system
     * The HSI16 frequency is 16 MHz. VCO allowable frequency range is 64-344 MHz. But sysclock range maxes at 80 MHz.
     * This means the input range for this function is 8-80 MHz
     */

    //The equation to calculate the system clock: SYSCLK = ((16e6 / PLLM) * PLLN) / PLLR   [derived from datasheet]

    uint32_t u32_R = 4; 
    uint32_t u32_M = 4; 
    uint32_t u32_N = 16;

    if(u32_freqKhz < 8000 || u32_freqKhz > 80000)
      asm("nop");
    else{
      //Think about the above equation backwards, and lets use that to determine our parameter precedence
      u32_R = 8;
      u32_M = 8;

      //Determine PLLR based on the max frequency of VCO
      uint32_t u32_vcoUpper = u32_freqKhz * u32_R;
      while(u32_vcoUpper > 344000)
        u32_vcoUpper = u32_freqKhz * (--u32_R);

      //Determine N and M simultaneously, Higher values of M give values of N greater frequency resolution
      bool b_NTooLarge = true;
      while(b_NTooLarge){
        u32_N = 8;

        while((u32_N * (16000/u32_M)) < u32_vcoUpper)
          ++u32_N;

        if(u32_N > 86){
          b_NTooLarge = true;
          --u32_M;
        }
        else
          b_NTooLarge = false;
      }
    }

    //Set the clock and return
    rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, u32_M, u32_N, 7, 2, u32_R);
    return;
}

//This implements the above algorithm to set the clock freq. The only thing I've added is an LED heartbeat so the user could know the program was running.
int main(void)  {
  ttu_set_main_pll(10000);

  rcc_periph_clock_enable(RCC_GPIOA);

  gpio_mode_setup(LED2_GPIO_Port, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, LED2_Pin);

  while(true){
    for(uint32_t u32_i = 0; u32_i < 500000; u32_i++)
      asm("nop");

    TOGGLE_LED;
  }
  return 0;    // NEVER EXECUTES
} 