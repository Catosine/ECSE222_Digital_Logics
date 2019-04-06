library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity g89_FSM is 
	
	Port (
		enable		: in	std_logic;			-- FSM will only work if enable is 1
		direction 	: in	std_logic;			-- FSM will go with 2 directions 
									-- {'0': A -> B, '1': B -> A}
		reset		: in  	std_logic;			-- FSM will be reset if reset is 0
		clk		: in 	std_logic;			-- FSM will only be active when at the rising edge of the clk
		count		: out 	std_logic_vector (3 downto 0)	-- This represents the current state of the FSM
	);
	
end g89_FSM;

architecture behaviour of g89_FSM is

	type State_type 	is	(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O);		-- All possible states
	-- {
	--	A	:	1,
	--	B	: 	2,
	--	C	: 	4,
	--	D	: 	8,
	--	E	: 	3,
	--	F	: 	6,
	--	G	: 	12,
	--	H	: 	11,
	--	I	:	5,
	--	J	: 	10,
	--	K	: 	7,
	--	L	: 	14,
	--	M	:	15,
	--	N	: 	13,
	--	O	:	9
	-- }
	signal present_state	: 	State_type;						-- Current state
	signal temp		:	std_logic_vector (3 downto 0);				-- Used for 7-segment LEDs

begin 
	process(enable, direction, reset, clk)
	begin 
	
	if (reset = '0') then 					-- Reset FSM when reset is 0
		present_state <= A;
			
	elsif (rising_edge(clk) and enable = '1') then		-- FSM opreates at the rising edge of clk and when enable is 1
		case present_state is 
			when A => 				-- Current state A
				if direction = '0' then		-- Direction 0: A -> B
					present_state <= B;
				else 				-- Direction 1: A -> O
					present_state <= O;
				end if;
						
			when B => 				-- Current state B
				if direction = '0' then 	-- Direction 0: B -> C
					present_state <= C;
				else 				-- Direction 1: B -> A
					present_state <= A;
				end if;
						
			when C => 				-- Current state C
				if direction = '0' then		-- Direction 0: C -> D
					present_state <= D;
				else 				-- Direction 1: C -> B
					present_state <= B;
				end if;
						
			when D => 				-- Current state D
				if direction = '0' then		-- Direction 0: D -> E
					present_state <= E;
				else 				-- Direction 1: D -> C
					present_state <= C;
				end if;
						
			when E => 				-- Current state E
				if direction = '0' then		-- Direction 0: E -> F
					present_state <= F;
				else 				-- Direction 1: E -> D
					present_state <= D;
				end if;
						
			when F => 				-- Current state F
				if direction = '0' then		-- Direction 0: F -> G
					present_state <= G;
				else 				-- Direction 1: F -> E
					present_state <= E;
				end if;
					
			when G => 				-- Currnet state G
				if direction = '0' then		-- Direction 0: G -> H
					present_state <= H;
				else 				-- Direction 1: G -> F
					present_state <= F;
				end if;
						
			when H => 				-- Current state H
				if direction = '0' then		-- Direction 0: H -> I
					present_state <= I;
				else 				-- Direction 1: H -> G 
					present_state <= G;
				end if;
					
			when I => 				-- Current state I
				if direction = '0' then		-- Direction 0: I -> J
					present_state <= J;
				else 				-- Direction 1: I -> H
					present_state <= H;
				end if;
						
			when J => 				-- Current state J
				if direction = '0' then		-- Direction 0: J -> K
					present_state <= K;
				else 				-- Direction 1: J -> I
					present_state <= I;
				end if;
					
			when K => 				-- Current state K
				if direction = '0' then		-- Direction 0: K -> L
					present_state <= L;
				else 				-- Direction 1: K -> J
					present_state <= J;
				end if;
						
			when L => 				-- Current state L
				if direction = '0' then		-- Direction 0: L -> M
					present_state <= M;
				else 				-- Direction 1: L -> K
					present_state <= K;
				end if;
					
			when M => 				-- Current state M
				if direction = '0' then		-- Direction 0: M -> N
					present_state <= N;
				else 				-- Direction 1: M -> L
					present_state <= L;
				end if;
						
			when N => 				-- Current state N
				if direction = '0' then		-- Direction 0: N -> O
					present_state <= O;
				else 				-- Direction 1: N -> M
					present_state <= M;
				end if;
						
			when O => 				-- Current state O
				if direction = '0' then		-- Direction 0: O -> A
					present_state <= A;
				else 				-- Direction 1: O -> N
					present_state <= N;
				end if;
			end case;
			
	end if;
	
	-- Translate the state to binary number. i.e. A -> "0001"
	case present_state is 
		when A => temp <= "0001";
		when B => temp <= "0010";
		when C => temp <= "0100";
		when D => temp <= "1000";
		when E => temp <= "0011";
		when F => temp <= "0110";
		when G => temp <= "1100";
		when H => temp <= "1011";
		when I => temp <= "0101";
		when J => temp <= "1010";
		when K => temp <= "0111";
		when L => temp <= "1110";
		when M => temp <= "1111";
		when N => temp <= "1101";
		when O => temp <= "1001";
		when others => temp <= "0000";
	end case;
			
	end process;
	count <= temp;
end behaviour;
