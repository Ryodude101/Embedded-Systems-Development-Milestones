/*
 * Ryan Colon
 * Embedded Systems Milestone 2
 * 02.15.22
 * Program takes user input from the serial monitor and encrypts the text
 * While running, if the user holds B1, the output will switch to decrypt from encrypt
 */

/*
 * Compute actual baud rate of the system:
 * 
 * From STs USART Training Manual https://www.st.com/content/ccc/resource/training/technical/product_training/group0/b1/26/c3/87/d8/7a/42/27/STM32H7-Peripheral-USART_interface_USART/files/STM32H7-Peripheral-USART_interface_USART.pdf/_jcr_content/translations/en.STM32H7-Peripheral-USART_interface_USART.pdf
 * By default, the clock for usart is using RCC_APB1, which we know is at 4 MHz. 
 * Libopencm3 docs under USART API usart_set_baudrate() tells us by default the OVER8 register is 0 therefore we're oversampling by 16.
 * 
 * 4M / 16 = 250K, 250k / 57.6k = 4.3403
 * 
 * By reading the USART2_BRR register, we can see that this is the value located in the USART_DIV
 * 
 * Therefore, the error is 0% 
 */

#include "embsysS20.h"
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include "circularBuffer.h"

#define BUFFER_SIZE 256
#define CIPHER_SIZE 13

char fn_encryptText(char c_toEncrypt);
char fn_decryptText(char c_toDecrypt);
void fn_convertToCaps(char* pc_Convert);

const char ac_CIPHER[CIPHER_SIZE] = {'T','E','N','N','E','S','S','E','E','T','E','C','H'};

//Available on the libopencm3 github example page
//Essentially makes the USART2 port the STDOUT stream
int _write(int file, char* ptr, int len){
    int i;

    if (file == STDOUT_FILENO || file == STDERR_FILENO){
	    for(i = 0; i < len; i++){
		    if(ptr[i] == '\n')
			    usart_send_blocking(USART_CONSOLE, '\r');

		    usart_send_blocking(USART_CONSOLE, ptr[i]);
	    }

	    return i;
    }

    errno = EIO;
    return -1;
}

// Below is a standard template for just about any embedded
//  system main() loop. 
int main(void)  {
   
  // setup software structures need for application
  static struct st_circBuff st_circularBuffer;
  static char buffer[BUFFER_SIZE];
  fn_circBuffInit(&st_circularBuffer, buffer, BUFFER_SIZE);

  char c_charToSend = '\0';

  // initialize the hardware
  fn_clock_setup();
  fn_usart_setup(); 
  fn_setup_tim2();

  gpio_mode_setup(LED2_GPIO_Port, GPIO_MODE_OUTPUT, GPIO_PUPD_PULLUP, LED2_Pin);
  gpio_mode_setup(BUT1_GPIO_Port, GPIO_MODE_INPUT, GPIO_PUPD_NONE, BUT1_Pin);

  LED_OFF;

  while(true){

    //First, check if we need to get data from USART and get it
    if(usart_get_flag(USART_CONSOLE, USART_ISR_RXNE))
      fn_circBuffPut(&st_circularBuffer, usart_recv_blocking(USART_CONSOLE));

    //Before doing anything else, check we have data
    if(!fn_circBuffEmpty(&st_circularBuffer)){
      fn_circBuffGet(&st_circularBuffer, &c_charToSend);
      fn_convertToCaps(&c_charToSend);

      if(IS_B1_PRESSED) //DECRYPT
        c_charToSend = fn_decryptText(c_charToSend);

      else if(IS_B1_RELEASED) //ENCRYPT
        c_charToSend = fn_encryptText(c_charToSend);
      
      else{ //ENCRYPT
        printf("Indeterminate button state!... Defaulting to Encrypt!");
        c_charToSend = fn_encryptText(c_charToSend);
      }

      //Spit it back to the console
      if(usart_get_flag(USART_CONSOLE, USART_ISR_TXE))
        usart_send_blocking(USART_CONSOLE, c_charToSend);
    }

    //Toggle Led
    if(timer_get_flag(TIM2,TIM_SR_CC1IF)){
      timer_clear_flag(TIM2, TIM_SR_CC1IF);

      if(IS_B1_PRESSED)
        timer_set_period(TIM2, 2500); //4M / (200 * 2.5k) = 8 Hz, period - 0.125 s
      else
        timer_set_period(TIM2, 10000); //4M / (200 * 10k) = 2 Hz, period = 0.5s
        
      TOGGLE_LED;
    }
  }
  return 0;    // NEVER EXECUTES
} 

//Will only convert a character to caps if it is in the alphabet and lowercase, stores in the param it received
void fn_convertToCaps(char* pc_Convert){
  if(*pc_Convert >= 'a' && *pc_Convert <= 'z')
    *pc_Convert = (*pc_Convert - 'a') + 'A';  
}

//Encrypt using the cipher and return the encrypted key
char fn_encryptText(char c_toEncrypt){
  static uint8_t u8_cipherEPosition = 0;

  c_toEncrypt = (((c_toEncrypt - 'A') + (ac_CIPHER[u8_cipherEPosition] - 'A')) % 26) + 'A';
  ++u8_cipherEPosition;

  u8_cipherEPosition = (u8_cipherEPosition == CIPHER_SIZE) ? 0 : u8_cipherEPosition;

  return c_toEncrypt;
}

//Decrypt using the cipher and return the decrypted key
char fn_decryptText(char c_toDecrypt){
  static uint8_t u8_cipherDPosition = 0;

  c_toDecrypt = ((c_toDecrypt - ac_CIPHER[u8_cipherDPosition] + 26) % 26) + 'A';

  ++u8_cipherDPosition;

  u8_cipherDPosition = (u8_cipherDPosition == CIPHER_SIZE) ? 0 : u8_cipherDPosition;
  
  return c_toDecrypt;
}