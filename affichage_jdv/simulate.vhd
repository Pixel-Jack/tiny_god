LIBRARY ieee;
USE ieee.std_logic_1164.all;

Library work;
USE ieee.numeric_std.all;

entity simulate is
	
port(
	vecteur_map: out std_logic_vector (99 downto 0);
	select_affichage: out std_logic;
   largeur_grille: out std_logic_vector (31 downto 0);
   hauteur_grille: out std_logic_vector (31 downto 0);
   h_position_du_curseur: out std_logic_vector (3 downto 0);
   v_position_du_curseur: out std_logic_vector (3 downto 0)
);

end entity;


architecture a of simulate is
begin
		vecteur_map <= X"0123456789000000876543328";
		select_affichage <= '1';
		largeur_grille <= std_logic_vector(to_unsigned(4,32));
		hauteur_grille <= std_logic_vector(to_unsigned(12,32));
		h_position_du_curseur <= std_logic_vector(to_unsigned(0,4));
		v_position_du_curseur <= std_logic_vector(to_unsigned(1,4));
end a;
