library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

USE IEEE.NUMERIC_STD.ALL;

entity g89_multi_mode_counter is 
	Port (start			: in		std_logic;
			stop			: in		std_logic;
			direction	: in		std_logic;
			reset			: in		std_logic;
			clk			: in		std_logic;
			HEX0			: out		std_logic_vector (6 downto 0);
			HEX1			: out		std_logic_vector (6 downto 0));
end g89_multi_mode_counter;


architecture behaviour of g89_multi_mode_counter is

component g89_clock_divider is
  	Port (enable  	 	: in  	std_logic;								-- divider will only work when enable is 1
			reset   		: in  	std_logic;								-- divider will be reset when reset is 0
	      clk     		: in  	std_logic;								-- divider will start everytime at the rising edge of clk	      
       	en_out  		: out 	std_logic);   							-- result
end component g89_clock_divider;

component g89_FSM is 
	Port (enable		: in		std_logic;
			direction 	: in		std_logic;
			reset			: in  	std_logic;
			clk			: in 		std_logic;
			count			: out 	std_logic_vector (3 downto 0));
end component g89_FSM;

component g89_7_segment_decoder is
	Port (code 			: in    	std_logic_vector(3 downto 0);	   -- 4-bit binary input
      	segments 	: out 	std_logic_vector(6 downto 0));	-- 7-bit binary output
end component g89_7_segment_decoder;


signal enD_in, enD_out	: std_logic;
signal count0, count1	: std_logic_vector(3 downto 0);
signal h0, h1	         : std_logic_vector(3 downto 0);
signal ten 					: std_logic_vector(3 downto 0) := "1010";

begin 

clk_div	: g89_clock_divider		port map(enable 	 => enD_in,
														reset  	 => reset,
														clk    	 => clk,
														en_out 	 => enD_out);

fsm      : g89_FSM					port map(enable 	 => enD_out,
														direction => direction,
														reset 	 => reset,
														clk 		 => clk,
														count 	 => count0);
														
C0			: g89_7_segment_decoder port map(code		 => h0,
														segments  => HEX0);
											
C1			: g89_7_segment_decoder port map(code		 => h1,
														segments	 => HEX1);
		
		
process (start, stop, direction, reset, clk)

begin


if (rising_edge(clk)) then
	
	if (start = '0') then
		enD_in <= '1';
		
	elsif (stop = '0') then
		enD_in <= '0';
	end if;
	
	if (count0 >= "1010") then
		h1 <= "0001";
		h0 <= std_logic_vector(unsigned(count0(3 downto 0))-unsigned(ten(3 downto 0)));
	else 
		h1 <= "1111"; 
		h0 <= count0; 
	end if;
	
	if (reset = '0') then
		enD_in <= '0';
	end if;

end if;

end process;

end behaviour;
	
	

















