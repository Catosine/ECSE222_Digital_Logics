-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/28/2019 10:44:08"
                                                            
-- Vhdl Test Bench template for design  :  g89_counter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g89_counter_vhd_tst IS
END g89_counter_vhd_tst;
ARCHITECTURE g89_counter_arch OF g89_counter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL enable : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT g89_counter
	PORT (
	clk : IN STD_LOGIC;
	count : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	enable : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g89_counter
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	enable => enable,
	reset => reset
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
	-- reset counter
	reset <= '0';
	
	WAIT FOR 10 ns;
	
	-- initialize
	clk <= '0';
	enable <= '1';
	reset <= '1';
	
	-- enable = '1', reset = '1' 
	-- it will counter upward.
	FOR i IN 0 to 31 LOOP
		clk <= '0';
		WAIT FOR 10 ns;
		clk <= '1';
		WAIT FOR 10 ns;
	END LOOP;
	
	WAIT FOR 100 ns;
	
	-- reset = '0'
	-- there will be no counting.
	reset <= '0';
	FOR i IN 0 to 25 LOOP
		clk <= '0';
		WAIT FOR 10 ns;
		clk <= '1';
		WAIT FOR 10 ns;
	END LOOP;
	
	WAIT FOR 100 ns;
	
	-- reset = '1', enable = '0'
	-- there will be no counting.
	reset <= '1';
	enable <= '0';
	FOR i IN 0 to 31 LOOP
		clk <= '0';
		WAIT FOR 10 ns;
		clk <= '1';
		WAIT FOR 10 ns;
	END LOOP;
	WAIT;

END PROCESS generate_test;

END g89_counter_arch;
