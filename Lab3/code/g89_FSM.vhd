library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

USE IEEE.NUMERIC_STD.ALL;

entity g89_FSM is 
	Port (enable		: in	std_logic;
			direction 	: in	std_logic;
			reset			: in  std_logic;
			clk			: in 	std_logic;
			count			: out std_logic_vector (3 downto 0));
end g89_FSM;

architecture behaviour of g89_FSM is

	type State_type is (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O);
	signal present_state: State_type;
	signal temp	:	std_logic_vector (3 downto 0);
	
begin 
	process(enable, direction, reset, clk)
	begin 
	
	if (reset = '0') then 
			temp <= (others => '0');
--			if (direction = '0') then 
--					present_state <= A;
--			else
--					present_state <= O;
--			end if;
			
	elsif (rising_edge(clk) and enable = '1') then
			case present_state is 
					when A => 
						if direction = '0' then             -- upward direction of the counter when slide switch is off
							present_state <= B;
						else 
							present_state <= O;              -- downward direction of the counter when slide switch is on
						end if;
						
					when B => 
						if direction = '0' then 
							present_state <= C;
						else 
							present_state <= A;
						end if;
						
					when C => 
						if direction = '0' then
							present_state <= D;
						else 
							present_state <= B;
						end if;
						
					when D => 
						if direction = '0' then
							present_state <= E;
						else 
							present_state <= C;
						end if;
						
					when E => 
						if direction = '0' then
							present_state <= F;
						else 
							present_state <= D;
						end if;
						
					when F => 
						if direction = '0' then
							present_state <= G;
						else 
							present_state <= E;
						end if;
					
					when G => 
						if direction = '0' then
							present_state <= H;
						else 
							present_state <= F;
						end if;
						
					when H => 
						if direction = '0' then
							present_state <= I;
						else 
							present_state <= G;
						end if;
					
					when I => 
						if direction = '0' then
							present_state <= J;
						else 
							present_state <= H;
						end if;
						
					when J => 
						if direction = '0' then
							present_state <= K;
						else 
							present_state <= I;
						end if;
					
					when K => 
						if direction = '0' then
							present_state <= L;
						else 
							present_state <= J;
						end if;
						
					when L => 
						if direction = '0' then
							present_state <= M;
						else 
							present_state <= K;
						end if;
					
					when M => 
						if direction = '0' then
							present_state <= N;
						else 
							present_state <= L;
						end if;
						
					when N => 
						if direction = '0' then
							present_state <= O;
						else 
							present_state <= M;
						end if;
						
					when O => 
						if direction = '0' then
							present_state <= A;
						else 
							present_state <= N;
						end if;
			end case;
				
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
			
			if temp = "0000" then 
				if direction = '0' then 
					present_state <= A;
					temp <= "0001";
				else 
					present_state <= O;
					temp <= "1001";
				end if; 
			end if;
			
	end if;
	end process;
	count <= temp;
end behaviour;
		
			
			
			
			
			
			
			
			
							
