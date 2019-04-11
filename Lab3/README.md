# [ECSE222 Lab3 - Finite State Machine](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/Lab%20Assignment3.pdf)
This is the folder for finite state machine lab. In this lab, a finite state machine is described using VHDL.  

## List of Contents
1. [**__g89_FSM.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_FSM.vhd)  
> This is the VHDL file that describes a Moore-style FSM.  
> Correctness checked. [Testing codes](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_FSM.vht)  
> **NOTICE: The implementation of this entity may NOT be a finite state machine.** According to the [instruction](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/Lab%20Assignment3.pdf), the following codes:  
 ~~~~
...
if (reset = '0') then 					-- Reset FSM when reset is 0
		-- State initialization: direction is 0
		present_state <= A;
		
		-- State initialization: direction is 1
		-- Notice: adding this part of codes below will make this entity NOT a FSM.
		
				  -- This is the start of the tricky codes --
	        if (direction = '1') then
			        present_state <= O;
		      end if;
				  -- This is the end of the tricky codes --
...
~~~~
may make the entity not a FSM, which could be identified by inspecting the RTL diagram.  

2. [**__g89_multi_mode_counter.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_multi_mode_counter.vhd)  
> This VHDL file describes a 2 directional counter that allows both up and down counting. It is used to test the FSM.  

3. [**__g89_clock_divider.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_clock_divider.vhd)  
> This VHDL file describes a clock divider with a negative-triggered reset and a positive-triggered enable which adjusts the clock speed from 50MHz to 1Hz. __It is basically the same as the one used in lab2 but the output frequency is 1Hz.__  
> Partial correctness checked. [Testing codes](https://github.com/Catosine/ECSE222---VHDL/blob/master/Lab2/g89_clock_divider.vht)  

4. [**__g89_7_segment_decoder.vhd__**](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab3/code/g89_7_segment_decoder.vhd)  
> This is the VHDL file describing 7 segments decoder, which transforms a 4-bit binary signal to a 7-bit binary output. The output signal may be used for 7-segment LEDs on Altera DE1-SoC. __It is basically the same as the one in lab1 but the cases A-F are blocked.__  
> Correctness checked in lab1. [Testing codes](https://github.com/Catosine/ECSE222_Digital_Logics/blob/master/Lab1/code/g89_7_segment_decoder.vht)  
