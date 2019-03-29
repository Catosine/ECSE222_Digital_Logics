-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/14/2019 16:30:30"
                                                            
-- Vhdl Test Bench template for design  :  g89_7_segment_decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;
USE ieee.numeric_std.all;                                              
USE ieee.std_logic_1164.all;                                

ENTITY g89_7_segment_decoder_vhd_tst IS
END g89_7_segment_decoder_vhd_tst;
ARCHITECTURE g89_7_segment_decoder_arch OF g89_7_segment_decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL segments : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT g89_7_segment_decoder
	PORT (
	code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g89_7_segment_decoder
	PORT MAP (
-- list connections between master ports and signals
	code => code,
	segments => segments
	);
                                        
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;

generate_test : PROCESS
BEGIN

	FOR i IN 0 to 15 LOOP
		code <= std_logic_vector(to_unsigned(i,4));
		WAIT FOR 10 ns;
	END LOOP;
	WAIT;

END PROCESS generate_test;
                                          
END g89_7_segment_decoder_arch;
