library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Declaring the entity of adder
entity g89_adder is
	Port (
		A, B		:	in	std_logic_vector	(4 downto 0);	-- 4-bit binary inputs
		decoded_A	:	out	std_logic_vector	(13 downto 0);	-- 14-bit binary output, used for display
		decoded_B	:  	out	std_logic_vector	(13 downto 0);	-- 14-bit binary output, used for display
		decoded_AplusB	:	out 	std_logic_vector	(13 downto 0)	-- 14-bit binary output, used for display
	);
end g89_adder;

-- Declaring the architecture of the adder
architecture behaviour of g89_adder is

component g89_7_segment_decoder is
	Port (
		code		:	in	std_logic_vector	(3 downto 0);
		segments	:	out	std_logic_vector	(6 downto 0)
	);
end component g89_7_segment_decoder;

signal sum					:	std_logic_vector	(5 downto 0);
signal A1_code_temp, B1_code_temp, S1_code_temp	:	std_logic_vector	(3 downto 0);

begin
	A1_code_temp	<=	"000" 	&	A(4);

	B1_code_temp	<=	"000" 	& 	B(4);

	S1_code_temp	<=	"00"	&	sum(5 downto 4);
	
	sum		<=	std_logic_vector	(unsigned('0' & A) + unsigned('0' & B));
	
	A0		:	g89_7_segment_decoder	port	map(	
									code		=>	A(3 downto 0),
									segments	=>	decoded_A(6 downto 0)
								);
																
	A1		:	g89_7_segment_decoder	port	map(	
									code		=>	A1_code_temp,
									segments	=>	decoded_A(13 downto 7)
								);
																
	B0		:	g89_7_segment_decoder	port	map(	
									code		=>	B(3 downto 0),
									segments	=>	decoded_B(6 downto 0)
								);
																
	B1		:	g89_7_segment_decoder	port	map(	
									code		=>	B1_code_temp,
									segments	=>	decoded_B(13 downto 7)
								);
																
	sum0		:	g89_7_segment_decoder	port	map(	
									code		=>	sum(3 downto 0),
									segments	=>	decoded_AplusB(6 downto 0)
								);
	
	sum1		:	g89_7_segment_decoder	port	map(	
									code		=>	S1_code_temp,
									segments	=>	decoded_AplusB(13 downto 7)
								);
																
end behaviour; 
																																																																																																														
					
