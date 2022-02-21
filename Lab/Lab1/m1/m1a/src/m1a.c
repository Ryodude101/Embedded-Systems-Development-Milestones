/*

What is the period of the blinking light?

800.005 ms

How I calculated:
If we look into the assembly code, we can count the clock cycles it takes to complete a single loop. Clock cycles are not given for the instructions in the datasheet
so it is assumed each instruction takes 1 clock cycle. We can get the list of instructions from the resultant m1a.s file.

It looks like delay loop decompiles to...

""""
delayLoop:
   b .L2
.L3:   
   nop
   subs loops,loops,1
.L2:
   cmp loops, 0
   bgt .L3
   bx returnAddress
""""

counting instruction cycles:
   for the case where loops <= 0: 4
   for the case where loops > 0: 3 + 4 * (loops) + 1 = 4 + 4 * loops

we have now derived a formula for calculating the number of clock cycles it takes for delayLoop to run based upon the input loops. But we still need to consider the
instructions run in the main loop. 

It looks like the while(1) loop decompiles to...

""""
.L5:
   movs (pin number)
   mov  (port base address)
   bl gpio_toggle
   ldr (port base address), .L7
   bl delayLoop
   b .L5
.L7:
""""

counting instruction cycles: 1 + 1 + 1 [actually unknown] + 1 + (1 + numOfDelayLoopInstructions) + 1 = 6 + 4 + 4 * loops = 10 + 4 * loops

We now have a (mostly complete equation) for the number of cycles for each loop to occur before the light toggles: N = 10 + 4 * loops

Since 2 loops occur for a full period of a blink then we multiply by 2: N = 20 + 8 * loops

In this case, loops is 400e3, plugging into our equation results in 3,200,020 cycles

But now in order to convert cycles to time we need to figure out the speed of the system clock. Referencing the STM32L452RE datasheet lets us know that after a
system reset the 4 MHz MSI Oscillator is selected as the system clock by default. Given the frequency of the system clock we can now calculate the period of the loop
and thus the period of the LED's blink:

divide the number of cycles by the frequency of the clock to get the period: 3200020 / 4000000 = 800.005 ms

which if we time the LED using a stopwatch we can see is pretty accurate



The skeleton code didn't do much to configure the MCU main system clock. What is the frequency of the main system clock? How do you know? How could you physically
verify that?

The clock frequency is 4 MHz. If we look at the datasheet it tells us that: on a system reset, if the clock is unconfigured, the MSI Oscillator is selected as the 
system clock. To verify, one could write a program where they blink an LED for the duration of a set of instructions and then time the duration of the LED.



Explain how by observing m1a.lst the exact period of the blink could be found without even having to run the program?

See my explanation on how to solve the first problem.



Explain how to change the value in delay loop to get an led blink period of exactly 1/7 second? Make the change to test that it works.

71427

How I calculated:
Take my formulas that I derived from problem 1.    N = 10 + 4 * loops      period = N / sysFreq

Solve period for N and plug in original equation:     period * sysFreq = 10 + 4 * loops

Solve for loops:     loops = (period*sysFreq - 10) / 4

Calculate:     loops = ceil(  (1/7) * 4e6 - 20] / 8   ) = 71427     *We take ceil() to make sure the value is always an integer, this will introduce error

*/
#ifndef STM32L4
   #define STM32L4
#endif

#include <errno.h>
#include <stdio.h>
#include <unistd.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include "user_app.h"
 
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
    rcc_periph_clock_enable(RCC_GPIOA);
    gpio_mode_setup(LED2_GPIO_Port, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, LED2_Pin);
    while(1)
    {
       gpio_toggle(LED2_GPIO_Port, LED2_Pin);
       delay_loop(71427);
    }
}