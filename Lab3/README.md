# [ECSE222 Lab3 - Finite State Machine](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/Lab%20Assignment3.pdf)
This is the folder for finite state machine lab. In this lab, a finite state machine is described using VHDL.  

## List of Contents
1. [**__g89_FSM.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_FSM.vhd)  
> This is the VHDL file that describes a Moore-style FSM.  

2. [**__g89_multi_mode_counter.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_multi_mode_counter.vhd)  
3. [**__g89_clock_divider.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_clock_divider.vhd)  
> This VHDL file describes a clock divider with a negative-triggered reset and a positive-triggered enable which adjusts the clock speed from 50MHz to 10Hz. __It is exactly the same as the one used in lab2.__  
> Partial correctness checked. [Testing codes](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/g89_clock_divider.vht)  

4. [**__g89_7_segment_decoder.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_7_segment_decoder.vhd)  
> This is the VHDL file describing 7 segments decoder, which transforms a 4-bit binary signal to a 7-bit binary output. The output signal may be used for 7-segment LEDs on Altera DE1-SoC. __It is exactly the same as the one used in lab1.__  
> Correctness checked in lab1. [Testing codes](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab1/code/g89_7_segment_decoder.vht) 
