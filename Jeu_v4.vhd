-- suppression inout, suppression variable

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity jeu_v4 is
port(
	rst : in std_logic;
	largeur_grille, hauteur_grille : in std_logic_vector(31 downto 0);
	mode_jeu, action : in std_logic;-- :='0';
	type_grille, pause : in std_logic;-- :='1';
	clock, d_haut, d_bas, d_gauche, d_droite : in std_logic;
	cellules_initiales : in std_logic_vector(1405 downto 0);
	cellules : out std_logic_vector(1405 downto 0);--:="0000000000000000"--4096
	h_position : out std_logic_vector(31 downto 0);
	v_position : out std_logic_vector(31 downto 0);
	position_curseur : out std_logic_vector(10 downto 1);--:="000101";--12
	clk_50 : in std_logic
	);
end jeu_v4;
	
architecture a of jeu_v4 is
		type cells is array (0 to 1405) of integer range 0 to 8;
		signal cellules_temp : std_logic_vector(1405 downto 0);
		signal cellules_vivantes_a_cote : cells;
		signal cellules_prec : std_logic_vector(1405 downto 0);
		signal position_curseur_prec : std_logic_vector(10 downto 1);
		signal position_curseur_next : std_logic_vector(10 downto 1);
		constant lgrille : integer := 38;
		constant hgrille : integer := 37;
		signal compteur_v_map : integer := 0;
begin
	
	process(rst, pause, type_grille, action, clock, clk_50, d_haut, d_bas, d_gauche, d_droite, largeur_grille, hauteur_grille, cellules_temp, position_curseur_prec, cellules_initiales,cellules_prec,cellules_vivantes_a_cote)
	begin
	-- on test si on vient de reset le jeu, si c'est le cas on met tout à 0
	if rst = '0' then
		cellules <=  (others => '0');
		--position_curseur <= "000001";
		cellules_temp <= cellules_initiales;
		cellules_prec <= (others => '0');
		--position_curseur_prec <= "000001";
		for c in 0 to lgrille*hgrille-1 loop
			cellules_vivantes_a_cote(c)<=0;
		end loop;
		
	else -- on n'a pas reset donc on continue le calcul
		if rising_edge(clock) then
			-- mise a 0 des variables
			for c in 0 to lgrille*hgrille-1 loop
				cellules_vivantes_a_cote(c)<=0;
			end loop;
			cellules_prec <= cellules_temp;
			
			--calcul si on n'est pas en pause
			if pause='0' then 
				if type_grille='0' then --grille non torique
					--on compte le nombre de cellules vivantes a cote de chaque cellule
					for c in 0 to lgrille*hgrille-1 loop
						--on fait les coins, qui sont des exceptions dans le compte
						--coin en haut à gauche -- bas droit
						if c=0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(1)))+to_integer(unsigned'('0' & cellules_prec(lgrille)))+to_integer(unsigned'('0' & cellules_prec(lgrille+1)));
						--coin en haut a droite -- bas gauche
						elsif c=lgrille-1 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(lgrille-2)))+to_integer(unsigned'('0' & cellules_prec(2*lgrille-2)))+to_integer(unsigned'('0' & cellules_prec(2*lgrille-1)));
						--coin en bas a gauche -- haut droit
						elsif c=lgrille*(hgrille-1) then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-2))))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-2)+1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)+1)));
						--coin en bas a droite -- haut gauche
						elsif c=lgrille*hgrille-1 then
								cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)-2)))+to_integer(unsigned'('0' & cellules_prec(lgrille*hgrille-2)));
						
						--on fait les cotes de la grille
						--premiere ligne -- ligne du bas
						elsif c<lgrille-1 and c>0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(lgrille+c-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille+c)))+to_integer(unsigned'('0' & cellules_prec(lgrille+c+1)));
						--dernière ligne -- ligne du haut
						elsif c<lgrille*hgrille-1 and c>lgrille*(hgrille-1) then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(-lgrille+c-1)))+to_integer(unsigned'('0' & cellules_prec(-lgrille+c)))+to_integer(unsigned'('0' & cellules_prec(-lgrille+c+1)));
						--première colonne -- droite
						elsif c mod lgrille=0 and c>0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+1-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(c+1+lgrille)));
						--dernière colonne -- gauche
						elsif c mod lgrille=lgrille-1 and c>0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-1-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c-1+lgrille)));

						-- cas dans lesquels on n'est pas sur les bords
						else
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c+1)));
						end if;
					end loop;
					
				else --grille torique
					--pour chaque cellule on va compter le nombre de cellules vivantes autour
					for c in 0 to lgrille*hgrille-1 loop 
						--on fait les coins, qui sont des exceptions dans le compte
						--coin en haut à gauche -- bas droite
						if c=0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(1)))+to_integer(unsigned'('0' & cellules_prec(lgrille)))+to_integer(unsigned'('0' & cellules_prec(lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*2-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*hgrille-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1))))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)+1)));
						--coin en haut a droite -- bas gauche
						elsif c=lgrille-1 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(lgrille-2)))+to_integer(unsigned'('0' & cellules_prec(2*lgrille-2)))+to_integer(unsigned'('0' & cellules_prec(2*lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille)))+to_integer(unsigned'('0' & cellules_prec(0)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1))))+to_integer(unsigned'('0' & cellules_prec(lgrille*hgrille-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*hgrille-2)));
						--coin en bas a gauche -- haut droite
						elsif c=lgrille*(hgrille-1) then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-2))))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-2)+1)))+to_integer(unsigned'('0' & cellules_prec(1)))+to_integer(unsigned'('0' & cellules_prec(0)))+to_integer(unsigned'('0' & cellules_prec(lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*hgrille-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)+1)));
						--coin en bas a droite -- haut gauche
						elsif c=lgrille*hgrille-1 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)-2)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1)-1)))+to_integer(unsigned'('0' & cellules_prec(lgrille*hgrille-2)))+to_integer(unsigned'('0' & cellules_prec(lgrille-2)))+to_integer(unsigned'('0' & cellules_prec(lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(0)))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-1))))+to_integer(unsigned'('0' & cellules_prec(lgrille*(hgrille-2))));
							
						--on fait les cotes de la grille
						--premiere ligne
						elsif c<lgrille-1 and c>0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille*(hgrille-1)-1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille*(hgrille-1))))+to_integer(unsigned'('0' & cellules_prec(c+lgrille*(hgrille-1)+1)));
						--dernière ligne
						elsif c<lgrille*hgrille-1 and c>lgrille*(hgrille-1) then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille*(hgrille-1)-1)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille*(hgrille-1))))+to_integer(unsigned'('0' & cellules_prec(c-lgrille*(hgrille-1)+1)));
						--première colonne
						elsif c mod lgrille=0 and c>0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+1-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(c+1+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c-1+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-1+lgrille*2)));
						--dernière colonne
						elsif c mod lgrille=lgrille-1 and c>0 then
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-1-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c-1+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+1)))+to_integer(unsigned'('0' & cellules_prec(c+1-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+1-lgrille*2)));
						
						-- cas dans lesquels on n'est pas sur les bords
						else
							cellules_vivantes_a_cote(c)<=to_integer(unsigned'('0' & cellules_prec(c-lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille)))+to_integer(unsigned'('0' & cellules_prec(c-lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille-1)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille)))+to_integer(unsigned'('0' & cellules_prec(c+lgrille+1)))+to_integer(unsigned'('0' & cellules_prec(c-1)))+to_integer(unsigned'('0' & cellules_prec(c+1)));
						end if;
					end loop;
				end if;

				--changement cellules vivantes/mortes cas en fonction du mode de jeu
				if mode_jeu='0' then
					for c in 0 to lgrille*hgrille-1 loop
						if cellules_vivantes_a_cote(c)=3 then
							cellules_temp(c)<='1';
						elsif cellules_vivantes_a_cote(c)>3 then
							cellules_temp(c)<='0';
						--elsif cellules_vivantes_a_cote(c)=1 then
							--cellules_temp(c)<='0';
						--elsif cellules_vivantes_a_cote(c)=0 then
							--cellules_temp(c)<='0';
						end if;
					end loop;
				else
					for c in 0 to lgrille*hgrille-1 loop
						if cellules_vivantes_a_cote(c)=2 then
							cellules_temp(c)<='1';
						elsif cellules_vivantes_a_cote(c)>2 then
							cellules_temp(c)<='0';
						--elsif cellules_vivantes_a_cote(c)<1 then
						--	cellules_temp(c)<='0';
						end if;
					end loop;
				end if;
			
			else -- on est en mode pause
				-- cas où on change l'état de la cellule
				if action='1' then
					if cellules_temp(to_integer(unsigned(position_curseur_prec)))='1' then
						cellules_temp(to_integer(unsigned(position_curseur_prec)))<='0';
					else
						cellules_temp(to_integer(unsigned(position_curseur_prec)))<='1';
					end if;
				end if; -- action
				--mouvement de la position du curseur
--				elsif d_droite='1' then
--					if to_integer(unsigned(position_curseur_prec))=lgrille*hgrille-1 then
--						position_curseur<= std_logic_vector(to_unsigned(1,6));
--					else
--						position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+1,6));
--					end if;
--				elsif d_gauche='1' then
--					if to_integer(unsigned(position_curseur_prec))=0 then
--						position_curseur<= std_logic_vector(to_unsigned(lgrille*hgrille,6));
--					else
--						position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-1,6));
--					end if;
--				elsif d_bas='1' then
--					if to_integer(unsigned(position_curseur_prec))<=lgrille*hgrille-1 
--							and to_integer(unsigned(position_curseur_prec))>lgrille*(hgrille-1) then
--						position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec)) mod lgrille,6));
--					else
--						position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+lgrille,6));
--					end if;
--				elsif d_haut='1' then
--					if to_integer(unsigned(position_curseur_prec))<=lgrille then
--						position_curseur<= std_logic_vector(to_unsigned(lgrille*(hgrille-1)+to_integer(unsigned(position_curseur_prec)),6));
--					else
--						position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-lgrille,6));
--					end if;
--				end if;
--				h_position <= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec)) mod lgrille,32));
--				v_position <= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))/lgrille,32));
			end if; -- pause
		end if; --clock
		cellules <= cellules_temp;
	end if; -- rst
	end process;
	
	process(clk_50, rst, d_haut, d_bas, d_gauche, d_droite, pause, action, position_curseur_prec)
	begin
	if rst = '0' then
		h_position <= (others => '0');
		v_position <= (others => '0');
		position_curseur <= (others => '0');
		position_curseur_prec <= (others => '0');
	else 
		if rising_edge(clk_50) then
			if pause = '1' then
				if action='0' then	
				--mouvement de la position du curseur
					if d_droite='1' then
						if to_integer(unsigned(position_curseur_prec))=lgrille*hgrille-1 then
							position_curseur<= std_logic_vector(to_unsigned(1,10));
							position_curseur_next<= std_logic_vector(to_unsigned(1,10));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+1,10));
							position_curseur_next<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+1,10));
						end if;
					elsif d_gauche='1' then
						if to_integer(unsigned(position_curseur_prec))=0 then
							position_curseur<= std_logic_vector(to_unsigned(lgrille*hgrille,10));
							position_curseur_next<= std_logic_vector(to_unsigned(lgrille*hgrille,10));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-1,10));
							position_curseur_next<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-1,10));
						end if;
					elsif d_bas='1' then
						if to_integer(unsigned(position_curseur_prec))<=lgrille*hgrille-1 
								and to_integer(unsigned(position_curseur_prec))>lgrille*(hgrille-1) then
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec)) mod lgrille,10));
							position_curseur_next<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec)) mod lgrille,10));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+lgrille,10));
							position_curseur_next<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+lgrille,10));
						end if;
					elsif d_haut='1' then
						if to_integer(unsigned(position_curseur_prec))<=lgrille then
							position_curseur<= std_logic_vector(to_unsigned(lgrille*(hgrille-1)+to_integer(unsigned(position_curseur_prec)),10));
							position_curseur_next<= std_logic_vector(to_unsigned(lgrille*(hgrille-1)+to_integer(unsigned(position_curseur_prec)),10));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-lgrille,10));
							position_curseur_next<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-lgrille,10));
						end if;
					end if; -- d
				end if; --action
				h_position <= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec)) mod lgrille,32));
				v_position <= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))/lgrille,32));
				position_curseur_prec <= position_curseur_next;
			end if; -- pause
		end if; -- clk_50
	end if; --rst
	end process;
end a;					
							