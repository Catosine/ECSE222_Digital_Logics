library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Declaring the entity of adder
entity g89_adder is
	Port (
		A, B		:	in	std_logic_vector	(4 downto 0);	-- 5-bit binary inputs
		decoded_A	:	out	std_logic_vector	(13 downto 0);	-- 14-bit binary output, used for display
		decoded_B	:  	out	std_logic_vector	(13 downto 0);	-- 14-bit binary output, used for display
		decoded_AplusB	:	out 	std_logic_vector	(13 downto 0)	-- 14-bit binary output, used for display
	);
end g89_adder;

-- Declaring the architecture of the adder
architecture behaviour of g89_adder is

-- Declaring the previously defined design entity, g89_7_segment_decoder, as a component
-- Note: it must match the corresponding entity declaration 
component g89_7_segment_decoder is
	Port (
		code		:	in	std_logic_vector	(3 downto 0);
		segments	:	out	std_logic_vector	(6 downto 0)
	);
end component g89_7_segment_decoder;

-- Declaring sum as a 6-bit binary number to store the result of A + B
-- Note: Add one extra digit to deal with potential arthmetic overflow
signal sum							:	std_logic_vector	(5 downto 0);

-- Declaring 3 of 4-digit binary number for the second digit of A, B
-- Declaring S1 as a 4-digit binary number for the last two digits from the sum of A + B
signal A1_second_digit, B1_second_digit, S1_second_digit	:	std_logic_vector	(3 downto 0);

begin
	A1_second_digit	<=	"000" 	&	A(4);

	B1_second_digit	<=	"000" 	& 	B(4);

	S1_second_digit	<=	"00"	&	sum(5 downto 4);
	
	-- Calculating the sum of A and B
	sum		<=	std_logic_vector	(unsigned('0' & A) + unsigned('0' & B));
	
	-- Instantiating 6 instances of the component, g89_7_segment_decoder
	-- Decoding the result for each display digit
	A0		:	g89_7_segment_decoder	port	map(	
									code		=>	A(3 downto 0),
									segments	=>	decoded_A(6 downto 0)
								);
																
	A1		:	g89_7_segment_decoder	port	map(	
									code		=>	A1_second_digit,
									segments	=>	decoded_A(13 downto 7)
								);
																
	B0		:	g89_7_segment_decoder	port	map(	
									code		=>	B(3 downto 0),
									segments	=>	decoded_B(6 downto 0)
								);
																
	B1		:	g89_7_segment_decoder	port	map(	
									code		=>	B1_second_digit,
									segments	=>	decoded_B(13 downto 7)
								);
																
	sum0		:	g89_7_segment_decoder	port	map(	
									code		=>	sum(3 downto 0),
									segments	=>	decoded_AplusB(6 downto 0)
								);
	
	sum1		:	g89_7_segment_decoder	port	map(	
									code		=>	S1_second_digit,
									segments	=>	decoded_AplusB(13 downto 7)
								);
																
end behaviour; 
																																																																																																														
					
