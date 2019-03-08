-- This is a demo version2 by Pengnan

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_segments_decoder is

	Port	(
				code	:	in		std_logic_vector	(3 downto 0);
				seg	:	out	std_logic_vector	(6 downto 0)
			);

end seven_segments_decoder;

architecture behaviour of seven_segments_decoder is
begin

		process(code)
		begin

			case code is

				when "0000" => seg <= "1000000"; -- 0
				when "0001" => seg <= "1111001"; -- 1
				when "0010" => seg <= "0100100"; -- 2
				when "0011" => seg <= "0110000"; -- 3
				when "0100" => seg <= "0011001"; -- 4
				when "0101" => seg <= "0010010"; -- 5
				when "0110" => seg <= "0000010"; -- 6
				when "0111" => seg <= "1111000"; -- 7
				when "1000" => seg <= "0000000"; -- 8
				when "1001" => seg <= "0010000"; -- 9
				when others => seg <= "1010101"; -- otherwise

			end case;

		end process;

end behaviour;