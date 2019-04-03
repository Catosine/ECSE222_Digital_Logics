library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g89_clock_divider is
   Port (
       enable	:	in  std_logic;		-- divider will only work when enable is 1
       reset   	:  	in  std_logic;		-- divider will be reset when enable is 0
       clk     	:  	in  std_logic;		-- divider will start a change everytime when clk is 1
       en_out  	:  	out std_logic		-- divided enable output
   );
end g89_clock_divider;

architecture down_counter of g89_clock_divider is
	signal temp	:	std_logic;							-- current state
	signal counter	:	std_logic_vector (18 downto 0) := "1111010000100011111";	-- output 1 every after 500,000 times of clock
begin
	process(enable, reset, clk)
	begin
   	if (reset = '0') then					-- reset divider
		temp 	<= 	'0';
		counter <= 	"1111010000100011111";
	elsif (rising_edge(clk)) then				-- activate divider
		if (counter = "0000000000000000000") then	-- output 1 as divided enable signal
			temp	<=	'1';
			counter	<=	"1111010000100011111";
		else
			if (enable = '1') then			-- divide as usual
				temp	<=	'0';
				counter <= 	std_logic_vector(unsigned(counter)-1);
			end if;
		end if;
	end if;
   	end process;
en_out <= temp;
end down_counter;
