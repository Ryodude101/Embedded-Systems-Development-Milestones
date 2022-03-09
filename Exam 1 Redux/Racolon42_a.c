/* Problem 1E.6 Redux File A
 * 02.27.22
 * Ryan Colon
 * Contained in the file below is the exact code as written on my Exam 1 for problem 6
 * 
 * On my exam was written the letter 'X' for this problem, I believe this letter represents a 24/30. I beleive the grade for this program is high but not perfect
 * because the algorithm as written on the exam would work conditionally, however there were some issues. I had incorrect numbers in the code because I thought 
 * the HSI16 was a 64 MHz clock when it is actually a 16 MHz clock, and this also made me incorrectly calculate the range of input frequencies. 
 * Because of the limitations of frequency on VCO and PLLCLK, the actual input range is 8-80 MHz. I also made some simple mistakes in the C code: I wrote 8^2 as 
 * a way to calculate 8 to the power of 2, which is incorrect in C because you need to use the 'pow()' function; ^ is the bitwise XOR operator in C; I also forgot 
 * to write the uint32_t initialization statement when I created the u32_N variable; and I also didn't type cast floor to an int because I wasn't aware it returned
 * a double instead of an int.
 */

// void rcc_set_main_pll(uint32_t source,
//        int32_t pllm, uint32_t plln,
//       uint32_t pllp, uint32_t pllq,
//      uint32_t pllr)
// rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, foo, bar, baz, spam, ni );
// EXAMPLE:     ttu_set_main_pll( 12345 ); //clock this baby at 12.345 MHz
void ttu_set_main_pll( uint32_t u32_freqKhz){
    //I have decided to let PLLN be the free variable for the most fine control. I have let PLLM = 8 and PLLR = 8, this means the
    //max frequency is 86 MHz and the min is 8 MHz

    //Start by making sure the input is valid
    if(u32_freqKhz >= 8000 && u32_freqKhz <= 86000){
        u32_N = floor((u32_freqKhz*(8^2))/64000); //8^2 = PLLM*PLLR
                                                  //64000 = HSI Freq
        rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, 8, u32_N, 7, 2, 8);
        return;
    }
    else{
        rcc_set_main_pll(RCC_PLLCFGR_PLLSRC_HSI16, 8, 16, 7, 2, 8);
        return;
    }
}