library IEEE;
use IEEE.std_logic_1164.all;

entity prov is
	port (
		position : in std_logic_vector(6 downto 1);
		cellules : in std_logic_vector(1 to 16);
		pause_nios : in std_logic
	);
end entity prov;

architecture a of prov is
begin

end architecture a;