// HINT for TASK #2 -- FALL 2022


//************** I N C L U D E S *****************

       //PUT YOUR INCLUDES HERE


//************** G L O B A L S *****************

      // PUT YOUR GLOBAL VARIABLES HERE

//********* S U P P O R T     F U N C T I O N S *****************

      // any functions created to help out the bigger fcns below


//********* I N I T I A L I Z A T I O N *****************
static void clock_setup(void)
{

    //  setup the RCC and clocks for any needed peripherals
}


// YOU NEED TO FINISH EACH STATEMENT BELOW, AND POSSIBLY
// ADD ADDITIIONAL STATEMENTS.
//
// YOU MUST PROVIDE ADEQUATE COMMENTS FOR EACH STATEMENT AND
// USE THE LIBOPENCM3 HAL DEFINES FOR ANY MAGIC NUMBERS
// TO MAKE THE CODE MORE READABLE
static void usart_setup(void)
{
   /* Enable the USART interrupt. */
   nvic_enable_irq();

   /* Setup GPIO pins for USART */
	gpio_mode_setup();
   	gpio_mode_setup();
   	gpio_set_output_options();
	
   /* Setup USART pins as alternate function. */
	gpio_set_af();   // you did set any peripherals using
   	gpio_set_af();   // an external pin to be AF, right?

	/* Setup UART parameters. */
	usart_set_baudrate();
	usart_set_databits();  // check the effect of parity on this fcn.
	usart_set_stopbits();
	usart_set_mode();
	usart_set_parity();
	usart_set_flow_control();

    /* everything is setup, so turn UART on */  
	usart_enable();
}

void usartX_isr(void)
{
	 /* If this function is called, one of the UART interrupt flags
	 * has been fired. We will need to determine which one it is
	 * and handle it appropriately.
	 */

}

// Below is a standard template for just about any embedded
//  system main() loop. 
int main(void)  {
   // setup software structures to manage hardware
   
   // setup software structures need for application
   
   // initialize the hardware
   clock_setup();
   usart_setup(); 

   // turn on everything (IRQs, etc.)

  while(TRUE) {
    // see if TIMER has expired. If so, toggle LED.

    // see if UART needs us to do anything
	/* check RXNE. */
	if (?) 
	{
		// DO THE MINIMUM WORK TO MAKE THE UART HAPPY
	}

	/* Check TXE */
	if (?) 
	{
		// DO THE MINIMUM WORK TO MAKE THE UART HAPPY
	}
    
    // read and main() hardware and update hardware data structures
    
    // based on the newly updated hardware structures,
    //    "clock" any application FSMs and
    //    update application data structures
    
    // apply new states from data structures to hardware.
        
    // tidy up and prepare whatever possible for next iteration
    //    through while() loop
    
    // OPTIONAL:  setup any time delay mechanism to have while()
    //    loop iterations run at specified times.
    
  }
  return 0;    // NEVER EXECUTES
} 
