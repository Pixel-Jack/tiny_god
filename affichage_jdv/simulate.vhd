LIBRARY ieee;
USE ieee.std_logic_1164.all;

Library work;
USE ieee.numeric_std.all;

entity simulate is
	
port(
	vecteur_map: out std_logic_vector (999 downto 0);
	select_affichage: out std_logic;
   largeur_grille: out std_logic_vector (31 downto 0);
   hauteur_grille: out std_logic_vector (31 downto 0);
   h_position_du_curseur: out std_logic_vector (31 downto 0);
   v_position_du_curseur: out std_logic_vector (31 downto 0)
);

end entity;


architecture a of simulate is
begin
		vecteur_map <= X"0123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328";
		select_affichage <= '1';
		largeur_grille <= std_logic_vector(to_unsigned(20,32));
		hauteur_grille <= std_logic_vector(to_unsigned(20,32));
		h_position_du_curseur <= std_logic_vector(to_unsigned(0,32));
		v_position_du_curseur <= std_logic_vector(to_unsigned(10,32));
end a;
