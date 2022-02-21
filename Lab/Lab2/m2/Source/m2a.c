/*
 * Ryan Colon
 * Embedded Systems Milestone 2
 * 02.15.22
 * Program takes user input from the serial monitor and encrypts the text
 * While running, if the user holds B1, the output will switch to decrypt from encrypt
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
void setup_tim3();

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
  clock_setup();
  usart_setup(); 
  setup_tim3();

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
    if(timer_get_flag(TIM3,TIM_SR_CC1IF)){
      timer_clear_flag(TIM3, TIM_SR_CC1IF);

      if(IS_B1_PRESSED)
        timer_set_period(TIM3, 2500);
      else
        timer_set_period(TIM3, 10000);
        
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

void setup_tim3(){
  rcc_periph_reset_pulse(RST_TIM3);
	timer_set_prescaler(TIM3, 200);
  //printf("%d\n", rcc_apb1_frequency);
  timer_set_period(TIM3, 10000);
	timer_enable_counter(TIM3);
	timer_enable_irq(TIM3, TIM_DIER_CC1IE);
}