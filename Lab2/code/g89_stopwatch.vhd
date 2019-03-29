library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity g89_stopwatch is
		Port ( start		:	in		std_logic;
				 stop			:  in 	std_logic;
				 reset 		:  in		std_logic;
				 clk			:	in 	std_logic;
				 HEX0			: 	out 	std_logic_vector (6 downto 0);
				 HEX1			: 	out	std_logic_vector (6 downto 0);
				 HEX2			: 	out	std_logic_vector (6 downto 0);
				 HEX3			: 	out	std_logic_vector (6 downto 0);
				 HEX4			:  out	std_logic_vector (6 downto 0);
				 HEX5			: 	out 	std_logic_vector (6 downto 0));
end g89_stopwatch;



architecture behaviour of g89_stopwatch is 

component g89_counter is

    Port    (

        enable  	:   in  std_logic;                             	-- counter will only work when enable is 1

        reset   	:   in  std_logic;                             	-- counter will be reset when reset is 0

        clk     	:   in  std_logic;                             	-- counter will start a change everytime when clk is 1

        count   	:   out std_logic_vector	(3 downto 0)			-- counting result

    );

end component g89_counter;

component g89_clock_divider is

   Port (

       enable  	:	   in  	std_logic;			-- divider will only work when enable is 1

       reset   	:  	in  	std_logic;			-- divider will be reset when reset is 0

       clk     	:  	in  	std_logic;			-- divider will start everytime at the rising edge of clk

       en_out  	:  	out 	std_logic			-- result

   );

end component g89_clock_divider;


component g89_7_segment_decoder is
	Port (
				code 			: in     std_logic_vector(3 downto 0);	-- 4-bit binary input
      		segments 	: out 	std_logic_vector(6 downto 0)	-- 7-bit binary output
				);
end component g89_7_segment_decoder;

signal clkStart, enD0, enC0, enc1, enC2, enC3, enC4, enC5, enC6		      : std_logic;
signal reset0, reset1, reset2, reset3, reset4, reset5						: std_logic;
signal count0, count1, count2, count3, count4, count5  					: std_logic;

begin 

clk_div 	: g89_clock_divider	port map( enable => clkStart,
													 reset  => reset,
													 clk 	  => clk,
													 en_out => enD0);

counter0 : g89_counter	port map( enable => enC0,
											 reset  => rest0,
											 clk    => clk,
											 count  => count0);
											 
counter1 : g89_counter	port map( enable => enC1,
											 reset  => rest1,
											 clk    => clk,
											 count  => count1);

counter2 : g89_counter	port map( enable => enC2,
											 reset  => rest2,
											 clk    => clk,
											 count  => count2);
											 
counter3 : g89_counter	port map( enable => enC3,
											 reset  => rest3,
											 clk    => clk,
											 count  => count3);	
											 
counter4 : g89_counter	port map( enable => enC4,
											 reset  => rest4,
											 clk    => clk,
											 count  => count4);
											 
counter5 : g89_counter	port map( enable => enC5,
											 reset  => rest5,
											 clk    => clk,
											 count  => count5);
											 
C5			: g89_7_segement_decoder port map( code => count5,
														  segment => HEX5);
														  
C4			: g89_7_segement_decoder port map( code => count4,
														  segment => HEX4);
														
C3			: g89_7_segement_decoder port map( code => count3,
														  segment => HEX3);
														  
C2			: g89_7_segement_decoder port map( code => count2,
														  segment => HEX2);	

C1			: g89_7_segement_decoder port map( code => count1,
														  segment => HEX1);
														  
C0			: g89_7_segement_decoder port map( code => count0,
														  segment => HEX0);													  
											 
process (start, stop, reset, clk)
Begin 
if start = '0' then
	clkStart <= '1';
elsif stop = '0' then 
	
	
				 
				 