-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/06/2019 15:31:24"
                                                            
-- Vhdl Test Bench template for design  :  g89_FSM
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

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
	count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
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


stim_process : PROCESS
BEGIN 
  
  reset <= '0';
  wait for 5 ns;
  
  clk <= '0';
  enable <= '1';
  reset <= '1';
  direction <= '0';
  
  FOR i IN 0 TO 15 LOOP
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
  END LOOP;
  
--  WAIT FOR 10 ns;
  
  
  direction <= '1';
  FOR i IN 0 TO 20 LOOP
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
  END LOOP;
  
  
--  WAIT FOR 10 ns;
  clk <= '1';
  reset <= '0';
  WAIT FOR 10 ns;
  
  reset <= '1';
  FOR i IN 0 TO 15 LOOP
     clk <= '0';
     wait for 10 ns;
     clk <= '1';
     wait for 10 ns;
  END LOOP;
  WAIT;
  
END PROCESS stim_process;
                                         
END g89_FSM_arch;
