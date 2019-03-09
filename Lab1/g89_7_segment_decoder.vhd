library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Declaring the entity of the decoder
entity g89_7_segment_decoder is
	Port (
		code 		: in 	std_logic_vector(3 downto 0);	-- 4-bit binary input
      		segments 	: out 	std_logic_vector(6 downto 0)	-- 7-bit binary output
	);
end g89_7_segment_decoder;

-- Declaring the architecture of the entity.
-- It transform a 4-bit binary input to a 7-bit binary output, which will be used to display on the 7-segment display.
architecture behaviour of g89_7_segment_decoder is
begin 
	process(code)
  		begin 
    		case code is 
      			when "0000" => segments <= "1000000"; 	-- 0 for 7-segment display
      			when "0001" => segments <= "1111001";	-- 1 for 7-segment display
      			when "0010" => segments <= "0100100"; 	-- 2 for 7-segment display
      			when "0011" => segments <= "0110000"; 	-- 3 for 7-segment display
      			when "0100" => segments <= "0011001"; 	-- 4 for 7-segment display
      			when "0101" => segments <= "0010010"; 	-- 5 for 7-segment display
      			when "0110" => segments <= "0000010"; 	-- 6 for 7-segment display
      			when "0111" => segments <= "1111000"; 	-- 7 for 7-segment display
      			when "1000" => segments <= "0000000"; 	-- 8 for 7-segment display
      			when "1001" => segments <= "0010000"; 	-- 9 for 7-segment display
			when "1010" => segments <= "0001000"; 	-- A for 7-segment display
			when "1011" => segments <= "0000011"; 	-- B for 7-segment display
			when "1100" => segments <= "1000110"; 	-- C for 7-segment display
			when "1101" => segments <= "0100001"; 	-- D for 7-segment display
			when "1110" => segments <= "0000110"; 	-- E for 7-segment display
			when "1111" => segments <= "0001110"; 	-- F for 7-segment display
      			when others => segments <= "1111111"; 	-- Otherwise
    		end case;
  	end process;
end behaviour;
