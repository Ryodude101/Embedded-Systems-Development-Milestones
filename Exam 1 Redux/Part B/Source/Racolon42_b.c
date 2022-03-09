/* Problem 1E.6 Redux File B
 * Ryan Colon
 * 02.27.22
 * Syntactically correct implementation of the code in Racolon42_a with an added
 * LED2 heartbeat so the user knows the code is executing. This program will compile and run.
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
    //I have decided to let PLLN be the free variable for the most fine control. I have let PLLM = 8 and PLLR = 8, this means the
    //max frequency is 86 MHz and the min is 8 MHz

    //Start by making sure the input is valid
    if(u32_freqKhz >= 8000 && u32_freqKhz <= 86000){
        uint32_t u32_N = floor((u32_freqKhz*(8^2))/64000); //8^2 = PLLM*PLLR
                                                  //64000 = HSI Freq
        rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, 8, u32_N, 7, 2, 8);
        return;
    }
    else{
        rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, 8, 16, 7, 2, 8);
        return;
    }
}

//This implements the above algorithm to set the clock freq. The only thing I've added is an LED heartbeat so the user could know the program was running.
int main(void)  {
  ttu_set_main_pll(40000);

  rcc_periph_clock_enable(RCC_GPIOA);

  gpio_mode_setup(LED2_GPIO_Port, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, LED2_Pin);

  while(true){
    for(uint32_t u32_i = 0; u32_i < 400000; u32_i++)
      asm("nop");

    TOGGLE_LED;
  }
  return 0;    // NEVER EXECUTES
} 