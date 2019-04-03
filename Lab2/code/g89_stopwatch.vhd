library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity g89_stopwatch is
	Port ( 	
		start	:	in	std_logic;
		stop	:  	in	std_logic;
		reset 	:  	in	std_logic;
		clk	:	in 	std_logic;
		HEX0	: 	out 	std_logic_vector (6 downto 0);
		HEX1	: 	out	std_logic_vector (6 downto 0);
		HEX2	: 	out	std_logic_vector (6 downto 0);
		HEX3	: 	out	std_logic_vector (6 downto 0);
		HEX4	:	out	std_logic_vector (6 downto 0);
		HEX5	: 	out 	std_logic_vector (6 downto 0)
	);
end g89_stopwatch;



architecture behaviour of g89_stopwatch is 

component g89_counter is

	Port (
		enable  :   	in  std_logic;                             	-- counter will only work when enable is 1

        	reset   :   	in  std_logic;                             	-- counter will be reset when reset is 0

        	clk     :   	in  std_logic;                             	-- counter will start a change everytime when clk is 1

        	count   :   	out std_logic_vector(3 downto 0)		-- counting result

	);

end component g89_counter;

component g89_clock_divider is
	Port (

       		enable 	:	in  	std_logic;			-- divider will only work when enable is 1

       		reset   :  	in  	std_logic;			-- divider will be reset when reset is 0

       		clk     :  	in  	std_logic;			-- divider will start everytime at the rising edge of clk

       		en_out  :  	out 	std_logic			-- result

	);

end component g89_clock_divider;


component g89_7_segment_decoder is
	Port (
		code 		: in	std_logic_vector(3 downto 0);	-- 4-bit binary input
		
      		segments	: out 	std_logic_vector(6 downto 0)	-- 7-bit binary output
		
	);
end component g89_7_segment_decoder;

signal enD_in, enD_out						: std_logic := '0';
signal enC0, enc1, enC2, enC3, enC4, enC5, enC6			: std_logic := '0';
signal reset0, reset1, reset2, reset3, reset4, reset5		: std_logic := '1';
signal count0, count1, count2, count3, count4, count5  		: std_logic_vector (3 downto 0) := "0000";

begin 

clk_div : g89_clock_divider	port map( 
					enable 	=> enD_in,
					reset  	=> reset,
					clk 	=> clk,
					en_out 	=> enD_out);

counter0 : g89_counter		port map( 
					enable => enD_out,
					reset  => reset0,
					clk    => clk,
					count  => count0);
											 
counter1 : g89_counter		port map( 
					enable => enC1,
					reset  => reset1,
					clk    => clk,
					count  => count1);

counter2 : g89_counter		port map( 
					enable => enC2,
					reset  => reset2,
					clk    => clk,
					count  => count2);
											 
counter3 : g89_counter		port map( 
					enable => enC3,
					reset  => reset3,
					clk    => clk,
					count  => count3);	
											 
counter4 : g89_counter		port map( 
					enable => enC4,
					reset  => reset4,
					clk    => clk,
					count  => count4);
											 
counter5 : g89_counter		port map( 
					enable => enC5,
					reset  => reset5,
					clk    => clk,
					count  => count5);
											 
C5	: g89_7_segment_decoder port map( code => count5,
					  segments => HEX5);
														  
C4	: g89_7_segment_decoder port map( code => count4,
					  segments => HEX4);
													
C3	: g89_7_segment_decoder port map( code => count3,
					  segments => HEX3);
														  
C2	: g89_7_segment_decoder port map( code => count2,
					  segments => HEX2);	

C1	: g89_7_segment_decoder port map( code => count1,
					  segments => HEX1);
														  
C0	: g89_7_segment_decoder port map( code => count0,
					  segments => HEX0);													  

														  
process (start, stop, reset, clk)
Begin 

if (rising_edge(clk)) then 

	if (start = '0') then
		enD_in <= '1';	
	end if;

	if (stop = '0') then 
		enD_in <= '0';
		enC0 <= '0';
		enC1 <= '0';
		enC2 <= '0';
		enC3 <= '0';
		enC4 <= '0';
		enC5 <= '0';
	end if;
	
--	if (enD_out = '1') then
--		enC0 <= '1';
--	end if;
	
	if (count0 = "1010") then
		enC1 <= '1';
		reset0 <= '0';
	else 
		enC1 <= '0';
		reset0 <= '1';
	end if;
			
   	if (count1 = "1010") then
		enC2 <= '1';
		reset1 <= '0';
	else 
		enC2 <= '0';
		reset1 <= '1';
	end if;
	
	
	if (count2 = "1010") then 
		enC3 <= '1'; 
		reset2 <= '0';
	else 
		enC3 <= '0';
		reset2 <= '1';
	end if;
		
	if (count3 = "0110") then 
		enC4 <= '1';
		reset3 <= '0';
	else 
		enC4 <= '0';
		reset3 <= '1';
	end if;
	
	if (count4 = "1010") then 
		enC5 <= '1';
		reset4 <= '0';
	else 
		enC5 <= '0';
		reset4 <= '1';
	end if;
	
	if (count5 = "0110") then 
		reset5 <= '0';
	else 
		reset5 <= '1';
	end if;
end if;

if (reset = '0') then
	reset0 <= '0';
	reset1 <= '0';
   	reset2 <= '0';
   	reset3 <= '0';
   	reset4 <= '0';
	reset5 <= '0';
end if;


end process;

end behaviour;	
	
				 
				 
