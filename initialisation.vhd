library IEEE;
use IEEE.std_logic_1164.all;

entity initialisation is
	port (
		largeur_grille, hauteur_grille : out std_logic_vector(31 downto 0);
		h_position_du_curseur, v_position_du_curseur : out std_logic_vector(31 downto 0);
		mode_jeu : out std_logic;
		type_grille : out std_logic;
		select_affichage : out std_logic
	);
end entity initialisation;

architecture a of initialisation is
begin

largeur_grille <= x"00000004";
hauteur_grille <= x"00000004";
h_position_du_curseur <= x"00000001";
v_position_du_curseur <= x"00000001";
mode_jeu <= '0';
type_grille <= '0';
select_affichage <= '1';

end architecture a;