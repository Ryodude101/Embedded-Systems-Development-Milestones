#ifndef STM32L4
   #define STM32L4
#endif

#include "user_app.h"

#include <errno.h>
#include <stdio.h>
#include <unistd.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/exti.h>
#include <libopencm3/stm32/flash.h>

#include <libopencm3/stm32/timer.h>
static void clock_setup(void)
{
	// USE THE HSI16
	rcc_osc_on(RCC_HSI16); //Inferred by looking at rcc.c source code
	
	flash_prefetch_enable();
	flash_set_ws(4);
	flash_dcache_enable();
	flash_icache_enable();
	/* setup for 80MHz main pll  */
	rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, 4, 40, 0, 0, RCC_PLLCFGR_PLLR_DIV2); //Retrieved from libopencm3-examples github page basics.c
	rcc_osc_on(RCC_PLL);
	/* either rcc_wait_for_osc_ready() or do other things */

	/* Enable clocks for the ports we need */
	rcc_periph_clock_enable(RCC_GPIOA);
   
	rcc_set_sysclk_source(RCC_CFGR_SW_PLL); /* careful with the param here! */
	rcc_wait_for_sysclk_status(RCC_PLL);
	
	// These three global variables must be set to contain
	// the respective frequencies of the ARM-Cortex busses.
	// The libOpenCM3 library uses these variables in a variety
	// of places to calculate register values to control chip
	// timing.  If you do not set these variables correctly,
	// you will see weird behavior, erroneous behavior, or failures.
	//
	// MAGIC NUMBERS ARE EVIL!!!
	rcc_ahb_frequency = 80e6;
	rcc_apb1_frequency = 80e6;
	rcc_apb2_frequency = 80e6;
} 
 
static void delay_loop(int32_t loops)
{
    while(loops > 0)
    {
       asm("nop");
       loops--;
    }
}
 
int main(void)
{
	clock_setup();
    rcc_periph_clock_enable(RCC_GPIOA);
    gpio_mode_setup(LED2_GPIO_Port, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, LED2_Pin);
    while(1)
    {
       gpio_toggle(LED2_GPIO_Port, LED2_Pin);
       delay_loop(400000);
    }
}
