library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity g89_counter is
    Port    (
        enable  	:   in  std_logic;                             			-- counter will only work when enable is 1
        reset   	:   in  std_logic;                             			-- counter will be reset when reset is 0
        clk     	:   in  std_logic;                             			-- counter will start a change everytime when clk is 1
        count   	:   out std_logic_vector	(3 downto 0)			-- counting result
    );
end g89_counter;

architecture up_counter of g89_counter is
	signal c		 :		std_logic_vector	  (3	downto	0);
begin
   process(enable, reset, clk)
   begin																			
	if (reset = '1') then 								-- reset counter
		c <= (others => '0');
		else
			if (rising_edge(clk)) then					-- activate counter
				if (enable = '1') then					-- enable counter
					if (c = "1111") then 				-- restart
						c <= (others => '0');							
					else
						c <= std_logic_vector(unsigned(c)+1);	-- count as usual
					end if;
				end if;
			end if;
		end if;
   end process;
	count <= c;
end up_counter;
