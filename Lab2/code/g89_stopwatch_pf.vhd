library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity g89_stopwatch is
    Port(
        start       :   in  std_logic;                      	-- stopwatch will be started
        stop        :   in  std_logic;                      	-- stopwatch will be stoped
        reset       :   in  std_logic;                      	-- stopwatch will be reset
        clk         :   in  std_logic;                      	-- 50MHz clock
        
        -- centisecond
        HEX0        :   out std_logic_vector(6 downto 0);   	-- centisecond digit 1
        HEX1        :   out std_logic_vector(6 downto 0);   	-- centisecond digit 2
        
        -- second = 100 centiseconds
        HEX2        :   out std_logic_vector(6 downto 0);   	-- second digit 1
        HEX3        :   out std_logic_vector(6 downto 0);   	-- second digit 2
        
        -- minute = 60 seconds
        HEX4        :   out std_logic_vector(6 downto 0);   	-- minute digit 1
        HEX5        :   out std_logic_vector(6 downto 0)    	-- minute digit 2
    );
end g89_stopwatch;

architecture stopwatch of g89_stopwatch is

-- clock divider
component g89_clock_divider is
    Port (
        enable      :   in  std_logic;				-- divider will only work when enable is 1
        reset       :   in  std_logic;				-- divider will be reset when reset is 0
        clk         :   in  std_logic;				-- divider will start everytime at the rising edge of clk
        en_out      :   out std_logic				-- result
    );
end component g89_clock_divider;

-- counter
component g89_counter is
    Port (
        enable      :   in  std_logic;                      	-- counter will only work when enable is 1
        reset       :   in  std_logic;                      	-- counter will be reset when reset is 0
        clk         :   in  std_logic;                      	-- counter will start everytime at the rising edge of clk
        count       :   out std_logic_vector(3  downto  0)	-- counting result
    );
end component g89_counter;

-- 7 segment decoder
component g89_7_segment_decoder is
    Port (
	code 	    :   in 	std_logic_vector(3 downto 0);	-- 4-bit binary input
      	segments    :   out std_logic_vector(6 downto 0)	-- 7-bit binary output
	);
end component g89_7_segment_decoder;

-- divided clock (50MHz -> 100Hz)
signal  low_freq_clk :   std_logic;

-- enables
signal enable0, enable1, enable2, enable3, enable4, enable5 :   std_logic;

-- resets
signal reset0, reset1, reset2, reset3, reset4, reset5       :   std_logic;

-- counter result for HEX0-5
signal  counter_result0, counter_result1, counter_result2, 
        counter_result3, counter_result4, counter_result5   :   std_logic_vector(3 downto 0) := "0000";

begin

    -- clock divider
    clk_div     : g89_clock_divider     port map(enable => start, reset => reset, clk => clk, en_out => low_freq_clk);
    
    -- HEX0
    enable0     <= start * (counter_result0 < "1010"); 
    reset0      <= NOT(stop + (counter_result0 >= "1010") + reset);
    counter0    : g89_counter           port map(enable=>enable0, reset=>reset0, clk=>low_freq_clk, count=>counter_result0);
    decoder0    : g89_7_segment_decoder port map(code=>counter_result0, segments=>HEX0);
    
    -- HEX1
    enable1     <= start * (counter_result0 >= "1010");
    reset1      <= NOT(STOP + (counter_result1 >= "1010") + reset);
    counter1    : g89_counter           port map(enable=>enable1, reset=>reset1, clk=>low_freq_clk, count=>counter_result1);
    counter1    : g89_7_segment_decoder port map(code=>counter_result1, segments=>HEX1);

    -- HEX2
    enable2     <= start * (counter_result1 >= "1010");
    reset2      <= NOT(STOP + (counter_result2 >= "1010") + reset);
    counter2    : g89_counter           port map(enable=>enable2, reset=>reset2, clk=>low_freq_clk, count=>counter_result2);
    counter2    : g89_7_segment_decoder port map(code=>counter_result2, segments=>HEX2);
    
    -- HEX3
    enable3     <= start * (counter_result2 >= "1010");
    reset3      <= NOT(STOP + (counter_result3 >= "1010") + reset);
    counter3    : g89_counter           port map(enable=>enable3, reset=>reset3, clk=>low_freq_clk, count=>counter_result3);
    counter3    : g89_7_segment_decoder port map(code=>counter_result3, segments=>HEX3);
    
    -- HEX4
    enable4     <= start * (counter_result3 >= "1010");
    reset4      <= NOT(STOP + (counter_result4 >= "1010") + reset);
    counter4    : g89_counter           port map(enable=>enable4, reset=>reset4, clk=>low_freq_clk, count=>counter_result4);
    counter4    : g89_7_segment_decoder port map(code=>counter_result4, segments=>HEX4);
    
    -- HEX5
    enable5     <= start * (counter_result4 >= "1010");
    reset5      <= NOT(STOP + (counter_result5 >= "1010") + reset);
    counter5    : g89_counter           port map(enable=>enable5, reset=>reset5, clk=>low_freq_clk, count=>counter_result5);
    counter5    : g89_7_segment_decoder port map(code=>counter_result5, segments=>HEX5);

end stopwatch;
