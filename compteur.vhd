library IEEE;
use IEEE.std_logic_1164.all;

entity diviseur is
	port (
		CLOCK_50M : in std_logic;
		CLOCK_1 : out std_logic
	);
end entity diviseur;

architecture a of diviseur is

signal compteur : integer := 0;

begin
	process(CLOCK_50M)
	begin
		if rising_edge(CLOCK_50M) then
			if compteur >= 25000000 then -- x"17d7840" x"2faf080"
				CLOCK_1 <= '1';
				compteur <= 0;
			else
				CLOCK_1 <= '0';
				compteur <= compteur + 1;
			end if;
		end if;
	end process;

end architecture a;