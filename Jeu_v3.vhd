-- suppression inout, suppression variable

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity jeu_v3 is
port(
	rst : in std_logic;
	largeur_grille, hauteur_grille : in std_logic_vector(31 downto 0);
	mode_jeu, action : in std_logic;-- :='0';
	type_grille, pause : in std_logic;-- :='1';
	clock, d_haut, d_bas, d_gauche, d_droite : in std_logic;
	cellules_initiales : in std_logic_vector(15 downto 0);
	position_curseur : out std_logic_vector(6 downto 1);--:="000101";--12
	cellules : out std_logic_vector(15 downto 0)--:="0000000000000000"--4096
	);
end jeu_v3;
	
architecture a of jeu_v3 is
		type cells is array (0 to 15) of integer range 0 to 8;
		signal cellules_temp : std_logic_vector(15 downto 0);
		signal cellules_vivantes_a_cote : cells;
		signal cellules_prec : std_logic_vector(15 downto 0);
		signal position_curseur_prec : std_logic_vector(6 downto 1);
		constant lgrille : integer := to_integer(unsigned(largeur_grille));
		constant hgrille : integer := to_integer(unsigned(hauteur_grille));
		signal compteur_v_map : integer := 0;
begin
	
	process(rst, pause, type_grille, action, clock, d_haut, d_bas, d_gauche, d_droite, largeur_grille, hauteur_grille, cellules_temp, position_curseur_prec, cellules_initiales)
		
	begin
		if rst = '0' then 
			cellules <= cellules_initiales;
			position_curseur <= "000000";
			cellules_temp <= cellules_initiales;
			cellules_prec <= cellules_initiales;
			position_curseur_prec <= "000000";
			for c in 0 to lgrille*hgrille-1 loop
				cellules_vivantes_a_cote(c)<=0;
			end loop;
		else
			if rising_edge(clock) then
			-- mise a 0 des variables
				for c in 0 to lgrille*hgrille-1 loop
					cellules_vivantes_a_cote(c)<=0;
				end loop;
				cellules_prec <= cellules_temp;
				if pause='0' then 
					if type_grille='0' then --grille non torique
						--on compte le nombre de cellules vivantes a cote de chaque cellule
						for c in 0 to lgrille*hgrille-1 loop
							--on fait les coins, qui sont des exceptions dans le compte
							--coin en haut à gauche -- bas droit
							if c=0 then
								if(cellules_prec(1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							--coin en haut a droite -- bas gauche
							elsif c=lgrille-1 then
								if(cellules_prec(lgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(2*lgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(2*lgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							--coin en bas a gauche -- haut droit
							elsif c=lgrille*(hgrille-1) then
								if(cellules_prec(lgrille*(hgrille-2))='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-2)+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1)+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							--coin en bas a droite -- haut gauche
							elsif c=lgrille*hgrille-1 then
								if(cellules_prec(lgrille*(hgrille-1)-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1)-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*hgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							
							--on fait les cotes de la grille
							--premiere ligne -- ligne du bas
							elsif c<lgrille-1 and c>0 then
								if(cellules_prec(c-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(lgrille+c+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							--dernière ligne -- ligne du haut
							elsif c<lgrille*hgrille-1 and c>lgrille*(hgrille-1) then
								if(cellules_prec(c-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c-lgrille+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							--première colonne -- droite
							elsif c mod lgrille=0 and c>0 then
								if(cellules_prec(c-lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c+1+lgrille*celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							--dernière colonne -- gauche
							elsif c mod lgrille=lgrille-1 and c>0 then
								if(cellules_prec(c-lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c-1+lgrille*celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							-- cas dans lesquels on n'est pas sur les bords
							else
								for celcompte in -1 to 1 loop
									if(cellules_prec(c-lgrille+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
									if(cellules_prec(lgrille+c+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
								if(cellules_prec(c-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							end if;
						end loop;
						
					else --grille torique
						--pour chaque cellule on va compter le nombre de cellules vivantes autour
						for c in 0 to lgrille*hgrille-1 loop 
							--on fait les coins, qui sont des exceptions dans le compte
							--coin en haut à gauche -- bas droite
							if c=0 then
								if(cellules_prec(1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*2-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*hgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1))='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1)+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							--coin en haut a droite -- bas gauche
							elsif c=lgrille-1 then
								if(cellules_prec(lgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(2*lgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(2*lgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(0)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1))='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*hgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*hgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							--coin en bas a gauche -- haut droite
							elsif c=lgrille*(hgrille-1) then
								if(cellules_prec(lgrille*(hgrille-2))='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-2)+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1)+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(0)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*hgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1)-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
							--coin en bas a droite -- haut gauche
							elsif c=lgrille*hgrille-1 then
								if(cellules_prec(lgrille*(hgrille-1)-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1)-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*hgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille-2)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(0)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-1))='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(lgrille*(hgrille-2))='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
	--						
							--on fait les cotes de la grille
							--premiere ligne
							elsif c<lgrille-1 and c>0 then
								if(cellules_prec(c-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c+lgrille+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
									if(cellules_prec(c+lgrille*(hgrille-1)+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							--dernière ligne
							elsif c<lgrille*hgrille-1 and c>lgrille*(hgrille-1) then
								if(cellules_prec(c-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c-lgrille+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
									if(cellules_prec(c-lgrille*(hgrille-1)+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							--première colonne
							elsif c mod lgrille=0 and c>0 then
								if(cellules_prec(c-lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c+1+lgrille*celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
									if(cellules_prec(c+lgrille-1+lgrille*celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							--dernière colonne
							elsif c mod lgrille=lgrille-1 and c>0 then
								if(cellules_prec(c-lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+lgrille)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								for celcompte in -1 to 1 loop
									if(cellules_prec(c-1+lgrille*celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
									if(cellules_prec(c-lgrille+1+lgrille*celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
							-- cas dans lesquels on n'est pas sur les bords
							else
								for celcompte in -1 to 1 loop
									if(cellules_prec(c-lgrille+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
									if(cellules_prec(lgrille+c+celcompte)='1') then
										cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
									end if;
								end loop;
								if(cellules_prec(c-1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
								if(cellules_prec(c+1)='1') then
									cellules_vivantes_a_cote(c)<=cellules_vivantes_a_cote(c)+1;
								end if;
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
							end if;
						end loop;
					else
						for c in 0 to lgrille*hgrille-1 loop
							if cellules_vivantes_a_cote(c)=2 then
								cellules_temp(c)<='1';
							elsif cellules_vivantes_a_cote(c)>2 then
								cellules_temp(c)<='0';
							end if;
						end loop;
					end if;
				else --pause
				
					-- cas où on change l'état de la cellule
					if action='1' then
						if cellules_temp(to_integer(unsigned(position_curseur_prec)))='1' then
							cellules_temp(to_integer(unsigned(position_curseur_prec)))<='0';
						else
							cellules_temp(to_integer(unsigned(position_curseur_prec)))<='1';
						end if;
					--mouvement de la position du curseur
					elsif d_droite='1' then
						if to_integer(unsigned(position_curseur_prec))=lgrille*hgrille-1 then
							position_curseur<= std_logic_vector(to_unsigned(1,6));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+1,6));
						end if;
					elsif d_gauche='1' then
						if to_integer(unsigned(position_curseur_prec))=0 then
							position_curseur<= std_logic_vector(to_unsigned(lgrille*hgrille,6));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-1,6));
						end if;
					elsif d_bas='1' then
						if to_integer(unsigned(position_curseur_prec))<=lgrille*hgrille-1 
								and to_integer(unsigned(position_curseur_prec))>lgrille*(hgrille-1) then
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec)) mod lgrille,6));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))+lgrille,6));
						end if;
					elsif d_haut='1' then
						if to_integer(unsigned(position_curseur_prec))<=lgrille then
							position_curseur<= std_logic_vector(to_unsigned(lgrille*(hgrille-1)+to_integer(unsigned(position_curseur_prec)),6));
						else
							position_curseur<= std_logic_vector(to_unsigned(to_integer(unsigned(position_curseur_prec))-lgrille,6));
						end if;
					end if;
				end if; -- pause
--				compteur_v_map <= compteur_v_map + 1;
--				cellules <= std_logic_vector(unsigned(cellules_temp) + to_unsigned(compteur_v_map,16));
				cellules_temp(3)<='1';
				cellules <= cellules_temp;
			end if; -- clock
		end if; --rst	
	end process;

	
end a;					
							