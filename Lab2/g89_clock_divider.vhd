library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g89_clock_divider is
   Port (
       enable	:	in  	std_logic;			-- divider will only work when enable is 1
       reset   	:  	in  	std_logic;			-- divider will be reset when reset is 0
       clk     	:  	in  	std_logic;			-- divider will start everytime at the rising edge of clk
       en_out  	:  		out std_logic			-- result
   );
end g89_clock_divider;

architecture down_counter of g89_clock_divider is
	signal temp		:	std_logic;								-- current state
	signal counter		:	std_logic_vector (18 downto 0) := std_logic_vector(unsigned(499999));	-- output 1 every after 500,000 times of clock
begin
   	process(enable, reset, clk)
	begin
   	if (reset = '1') then
		temp 	<=	'0';
		counter <= 	std_logic_vector(unsigned(499999));
	elsif (rising_edge(clk)) then
		if (counter = "0000000000000000000") then
			temp	<=	'1';
			counter	<=	std_logic_vector(unsigned(499999));
		else
			if (enable = '1') then
				temp 	<= 	'0';
				counter <= 	std_logic_vector(unsigned(counter)+1);
			end if;
		end if;
	end if;
   	end process;
	en_out <= temp;
end down_counter;
