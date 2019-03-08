library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Declaring the entity of the decoder
entity g89_7_segment_decoder is
	Port (
		code 		: in 	std_logic_vector(3 downto 0);
      		segments 	: out 	std_logic_vector(6 downto 0)
	);
end g89_7_segment_decoder;

-- Declaring the architecture of the entity.
-- It transform a 4-bit binary input to a 7-bit binary output, which will be used to display on the 7-segment display.
architecture behaviour of g89_7_segment_decoder is
begin 
	process(code)
  		begin 
    		case code is 
      			when "0000" => segments <= "1000000"; -- 0
      			when "0001" => segments <= "1111001"; -- 1
      			when "0010" => segments <= "0100100"; -- 2
      			when "0011" => segments <= "0110000"; -- 3
      			when "0100" => segments <= "0011001"; -- 4
      			when "0101" => segments <= "0010010"; -- 5
      			when "0110" => segments <= "0000010"; -- 6
      			when "0111" => segments <= "1111000"; -- 7
      			when "1000" => segments <= "0000000"; -- 8
      			when "1001" => segments <= "0010000"; -- 9
			when "1010" => segments <= "0001000"; -- A
			when "1011" => segments <= "0000011"; -- B
			when "1100" => segments <= "1000110"; -- C
			when "1101" => segments <= "0100001"; -- D
			when "1110" => segments <= "0000110"; -- E
			when "1111" => segments <= "0001110"; -- F
      			when others => segments <= "1111111"; -- Otherwise
    		end case;
  	end process;
end behaviour;
