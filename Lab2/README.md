# [ECSE222 Lab2 - Sequential Circuits](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/Lab%20assignment%202.pdf)  
This is the folder for codes of sequential circuits lab. In this lab, a 4-bit counter and a clock divider is described using VHDL. And they are used to describe a stopwatch that measures time every 10 milliseconds.  

## List of Contents  
1) [__g89_stopwatch.vhd__](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab2/code/g89_stopwatch.vhd)  
> This VHDL file describes a stopwatch that can measure time every 10 milliseconds and diplays the result to the 7-segment LEDs on the DE1-SoC board. __It is tested by using a timer.__  

2) [__g89_counter.vhd__](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/g89_counter.vhd)  
> This VHDL file describes a 4-bit up-counter with a negative-triggered reset and a positive-triggered enable.  
> Correctness checked. [Testing codes](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/g89_counter.vht)  

3) [__g89_clock_divider.vhd__](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/g89_clock_divider.vhd)  
> This VHDL file describes a clock divider with a negative-triggered reset and a positive-triggered enable which adjusts the clock speed from 50MHz to 10Hz.  
> Partial correctness checked. [Testing codes](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/g89_clock_divider.vht)  

4) [__g89_7_segment_decoder.vhd__](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab2/code/g89_7_segment_decoder.vhd)  
> This is the VHDL file describing 7 segments decoder, which transforms a 4-bit binary signal to a 7-bit binary output. The output signal may be used for 7-segment LEDs on Altera DE1-SoC. __It is exactly the same as the one used in lab1.__  
> Correctness checked in lab1. [Testing codes](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab1/code/g89_7_segment_decoder.vht)  
