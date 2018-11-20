LIBRARY ieee;
USE ieee.std_logic_1164.all;

Library work;
USE ieee.numeric_std.all;

entity simulate is
	
port(
	CLOCK_50M : in std_logic;
	SW : in std_logic;
	rst: in std_logic;
	vecteur_map: out std_logic_vector (15 downto 0);
	select_affichage: out std_logic;
   largeur_grille: out std_logic_vector (31 downto 0);
   hauteur_grille: out std_logic_vector (31 downto 0);
   h_position_du_curseur: out std_logic_vector (31 downto 0);
   v_position_du_curseur: out std_logic_vector (31 downto 0)
);

end entity;



architecture a of simulate is
signal compteur : integer := 0;
--signal v_map_init : std_logic_vector (999 downto 0) := X"0123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328";
--signal v_map_init : std_logic_vector (999 downto 0) := X"0123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328012345678900000087654332801234567890000008765433280123456789000000876543328012345678900000087654332801234567890000000000000000000000000000000000000000";
signal v_map_init : std_logic_vector (15 downto 0) := X"4321";
signal compteur_v_map : integer := 0;

begin
	process(CLOCK_50M)
	begin
		select_affichage <= SW;
		if rst = '0' then
			vecteur_map <= v_map_init;
			largeur_grille <= std_logic_vector(to_unsigned(4,32));
			hauteur_grille <= std_logic_vector(to_unsigned(4,32));
			h_position_du_curseur <= std_logic_vector(to_unsigned(0,32));
			v_position_du_curseur <= std_logic_vector(to_unsigned(1,32));
		elsif (rising_edge(CLOCK_50M)) then
				if compteur >= 25000000 then -- x"17d7840" x"2faf080"
					compteur_v_map <= compteur_v_map + 1;
					vecteur_map <= std_logic_vector(unsigned(v_map_init) + to_unsigned(compteur_v_map,16));
					compteur <= 0;
				else
					compteur <= compteur + 1;
				end if;
		end if;
	end process;

		
end a;
