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
-- Generated on "04/07/2019 17:47:03"
                                                            
-- Vhdl Test Bench template for design  :  g89_FSM
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;                                

ENTITY g89_FSM_vhd_tst IS
END g89_FSM_vhd_tst;

ARCHITECTURE g89_FSM_arch OF g89_FSM_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL direction : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL reset : STD_LOGIC;

COMPONENT g89_FSM
	PORT (
	clk : IN STD_LOGIC;
	count : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	direction : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;

BEGIN
	i1 : g89_FSM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	direction => direction,
	enable => enable,
	reset => reset
	);
	
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;   
                                        
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
		 
WAIT;                                                        
END PROCESS always; 

clk_process : PROCESS
BEGIN
	clk <= '0';
   wait for 1 sec;
   clk <= '1';
	wait for 1 sec;
END PROCESS clk_process;


stim_process : PROCESS
BEGIN 

  reset <= '0';
  enable <= '0';
  wait for 1 sec;

-- initialize the fsm with upward direction starting from 1
-- stay in upward direction for 20 seconds
  enable <= '1';
  reset <= '1';
  direction <= '0';
  wait for 20 sec;
 
-- change into downward direction and stay for another 20 seconds
  direction <= '1';
  wait for 20 sec;

-- reset the fsm and then start again 
  reset <= '0';
  WAIT FOR 1 sec;
  
  reset <= '1';
  WAIT FOR 20 sec;

-- stop the fsm and change into upward direction
  enable <= '0';
  direction <= '0';
  WAIT FOR 1 sec;
  enable <= '1';
  WAIT FOR 20 sec;
  
  WAIT;
END PROCESS stim_process;
  
END g89_FSM_arch;
