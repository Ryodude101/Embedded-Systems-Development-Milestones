#ifndef embsysS20_H
    #define embsysS20_H

    #ifndef STM32L4
        #define STM32L4
    #endif

    #include <libopencm3/stm32/rcc.h>
    #include <libopencm3/stm32/gpio.h>
    #include <libopencm3/stm32/usart.h>
    #include <libopencm3/cm3/nvic.h>
    #include <libopencm3/stm32/timer.h>

    #define LED2_Pin GPIO5  //Pin number for PA5, the LED2 pin, can be found in nucleo board 64 user manual
    #define LED2_GPIO_Port GPIOA  //PORTA address, can be found in libopencm3 docs
    #define BUT1_GPIO_Port GPIOC  //PORTC address, can be found in libopencm3 docs
    #define BUT1_Pin GPIO13  //Pin number for PC13, the B1 pin, can be found in the nucleo board 64 user manual

    #define USART_CONSOLE USART2 //PA2 (tx) and PA3 (rx), STM32-L452RE Reference Manual
    #define USART_GPIO_Port GPIOA
    #define USART_GPIO_TXPin GPIO2
    #define USART_GPIO_RXPin GPIO3

    #define TOGGLE_LED gpio_toggle(LED2_GPIO_Port,LED2_Pin)
    #define LED_ON gpio_set(LED2_GPIO_Port,LED2_Pin)
    #define LED_OFF gpio_clear(LED2_GPIO_Port,LED2_Pin)
    #define IS_LD2_SET  (gpio_get(LED2_GPIO_Port,LED2_Pin))
    #define IS_LD2_RESET  ((IS_LD2_SET)^LED2_Pin)
    #define IS_B1_RELEASED (gpio_get(BUT1_GPIO_Port,BUT1_Pin))
    #define IS_B1_PRESSED ((IS_B1_RELEASED)^BUT1_Pin)
    
    void fn_clock_setup(void){
        rcc_osc_on(RCC_HSI16);

        //16 MHz / 4 => 4 * 20 = 80 MHz / 2 = 40 MHz
        rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, 4, 20, 0, 0, RCC_PLLCFGR_PLLR_DIV2);

        rcc_osc_on(RCC_PLL);

        rcc_periph_clock_enable(RCC_TIM2);
        rcc_periph_clock_enable(RCC_GPIOA);
	    rcc_periph_clock_enable(RCC_GPIOC);
	    rcc_periph_clock_enable(RCC_USART2);
	    return;
    }

    void fn_usart_setup(void){
        /* Setup GPIO pins for USART */
         gpio_mode_setup(USART_GPIO_Port, GPIO_MODE_AF, GPIO_PUPD_NONE, USART_GPIO_TXPin | USART_GPIO_RXPin);
        
         /* Setup USART pins as alternate function. */
         gpio_set_af(USART_GPIO_Port, GPIO_AF7, USART_GPIO_TXPin | USART_GPIO_RXPin); //AF7 = USART2, STM32L54RE Family Datasheet Table

         /* Setup UART parameters. */
         usart_set_baudrate(USART_CONSOLE, 57600);
         usart_set_databits(USART_CONSOLE, 9);  // check the effect of parity on this fcn.
         usart_set_stopbits(USART_CONSOLE, USART_STOPBITS_1);
         usart_set_mode(USART_CONSOLE, USART_MODE_TX_RX);
         usart_set_parity(USART_CONSOLE, USART_PARITY_ODD);
         usart_set_flow_control(USART_CONSOLE, USART_FLOWCONTROL_NONE);

         /* everything is setup, so turn UART on */  
         usart_enable(USART_CONSOLE);
    }

    void fn_setup_tim2(){
        rcc_periph_reset_pulse(RST_TIM2);

        //rcc_APB1 is 4 MHz in this case, this can be verified by running the below print statement
        //printf("%d\n", rcc_apb1_frequency);

        //4M / (200 * 10k) = 2 Hz, period = 0.5s
        timer_set_prescaler(TIM2, 200);
        timer_set_period(TIM2, 10000);

        timer_enable_counter(TIM2);
        timer_enable_irq(TIM2, TIM_DIER_CC1IE);
    }
#endif
