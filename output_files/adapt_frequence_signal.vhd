library IEEE;
use IEEE.std_logic_1164.all;

entity adapt_frequence_signal is
	port (
		CLOCK_FAST: in std_logic;
		CLOCK_SLOW : in std_logic;
		signal_FAST  : in std_logic;
		signal_adapted : out std_logic
	);
end entity adapt_frequence_signal;

architecture a of adapt_frequence_signal is
	signal triggered : std_logic := '0';
	signal sending_signal : std_logic := '0';
begin
	
	process(CLOCK_SLOW)
	begin
		if rising_edge(CLOCK_SLOW) then
			if(triggered = '1') then
				sending_signal <= '1';
			else
				sending_signal <= '0';
			end if;
		end if;
	end process;
	
	process(CLOCK_FAST)
	begin
		if rising_edge(CLOCK_FAST) then
			if (signal_FAST = '1') then
				if (sending_signal = '0') then
					triggered <= '1';
				end if;
			elsif (sending_signal = '1') then
				triggered <= '0';
			end if;
		end if;
	end process;

signal_adapted <= sending_signal;

end architecture a;