library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g89_clock_divider is
   Port (
       enable	:	in  std_logic;
       reset   :  in  std_logic;
       clk     :  in  std_logic;
       en_out  :  out std_logic
   );
end g89_clock_divider;

architecture down_counter of g89_clock_divider is
	signal temp		:	std_logic;									-- record current state
	signal counter	:	integer range 0 to 2499 := 2499;		-- 
begin
   process(enable, reset, clk)
	begin
   if (reset = '1') then
		temp 		<= 	'0';
		counter 	<= 	2499;
	elsif (rising_edge(clk)) then
		if (counter = 0) then
			temp		<=		NOT(temp);
			counter	<=		2499;
		else
			counter <= counter + 1;
		end if;
	end if;
   end process;
	en_out <= temp;
end down_counter;
