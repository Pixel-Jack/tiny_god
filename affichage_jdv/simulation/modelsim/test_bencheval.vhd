
LIBRARY std  ; 
LIBRARY ieee;
USE ieee.std_logic_1164.all;

Library work;
USE ieee.numeric_std.all;

USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY test_bencheval  IS 
generic( border  :  integer  :=  1  );   
END ; 
 
ARCHITECTURE test_bencheval_arch OF test_bencheval IS
  SIGNAL vga_hs   :  std_logic  ; 
  SIGNAL v_total   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL h_total   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL vga_g   :  std_logic_vector(7 downto 0)  ; 
  SIGNAL v_end   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL h_end   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL v_active_24   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL largeur_grille   :  std_logic_vector(3 downto 0)  ; 
  SIGNAL reset_n   :  std_logic  ; 
  SIGNAL v_position_du_curseur   :  std_logic_vector(3 downto 0)  ; 
  SIGNAL clk   :  std_logic  ; 
  SIGNAL v_sync   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL vecteur_map   :  std_logic_vector(9 downto 0)  ; 
  SIGNAL v_start   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL h_position_du_curseur   :  std_logic_vector(3 downto 0)  ; 
  SIGNAL hauteur_grille   :  std_logic_vector(3 downto 0)  ; 
  SIGNAL h_sync   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL h_start   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL v_active_14   :  std_logic_vector(11 downto 0)  ; 
  SIGNAL vga_de   :  std_logic  ; 
  SIGNAL vga_vs   :  std_logic  ; 
  SIGNAL vga_b   :  std_logic_vector(7 downto 0)  ; 
  SIGNAL vga_r   :  std_logic_vector(7 downto 0)  ; 
  SIGNAL v_active_34   :  std_logic_vector(11 downto 0)  ; 
component vga_generator 
    generic(
        border          : integer := 1
    );
    port(
        clk             : in    std_logic;
        reset_n         : in    std_logic;
        h_total         : in    std_logic_vector(11 downto 0);
        h_sync          : in    std_logic_vector(11 downto 0);
        h_start         : in    std_logic_vector(11 downto 0);
        h_end           : in    std_logic_vector(11 downto 0);
        v_total         : in    std_logic_vector(11 downto 0);
        v_sync          : in    std_logic_vector(11 downto 0);
        v_start         : in    std_logic_vector(11 downto 0);
        v_end           : in    std_logic_vector(11 downto 0);
        v_active_14     : in    std_logic_vector(11 downto 0);
        v_active_24     : in    std_logic_vector(11 downto 0);
        v_active_34     : in    std_logic_vector(11 downto 0);
        vecteur_map     : in    std_logic_vector(9 downto 0);
        largeur_grille  : in    std_logic_vector(3 downto 0);
        hauteur_grille  : in    std_logic_vector(3 downto 0);
        h_position_du_curseur: in    std_logic_vector(3 downto 0);
        v_position_du_curseur: in    std_logic_vector(3 downto 0);
        vga_hs          : out   std_logic;
        vga_vs          : out   std_logic;
        vga_de          : out   std_logic;
        vga_r           : out   std_logic_vector(7 downto 0);
        vga_g           : out   std_logic_vector(7 downto 0);
        vga_b           : out   std_logic_vector(7 downto 0)
    );
end component;  
BEGIN
  DUT  : vga_generator  
    GENERIC MAP ( 
      border  => border   )
    PORT MAP ( 
      vga_hs   => vga_hs  ,
      v_total   => v_total  ,
      h_total   => h_total  ,
      vga_g   => vga_g  ,
      v_end   => v_end  ,
      h_end   => h_end  ,
      v_active_24   => v_active_24  ,
      largeur_grille   => largeur_grille  ,
      reset_n   => reset_n  ,
      v_position_du_curseur   => v_position_du_curseur  ,
      clk   => clk  ,
      v_sync   => v_sync  ,
      vecteur_map   => vecteur_map  ,
      v_start   => v_start  ,
      h_position_du_curseur   => h_position_du_curseur  ,
      hauteur_grille   => hauteur_grille  ,
      h_sync   => h_sync  ,
      h_start   => h_start  ,
      v_active_14   => v_active_14  ,
      vga_de   => vga_de  ,
      vga_vs   => vga_vs  ,
      vga_b   => vga_b  ,
      vga_r   => vga_r  ,
      v_active_34   => v_active_34   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 100 ns, Period = 100 ps
  Process
	Begin
	 clk  <= '0'  ;
	wait for 50 ps ;
-- 50 ps, single loop till start period.
	for Z in 1 to 99
	loop
	    clk  <= '1'  ;
	   wait for 50 ps ;
	    clk  <= '0'  ;
	   wait for 50 ps ;
-- 9950 ps, repeat pattern in loop.
	end  loop;
	 clk  <= '1'  ;
	wait for 50 ps ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ps, End Time = 200 ps, Period = 200 ps
  Process
	Begin
	 reset_n  <= '0'  ;
	wait for 100 ps ;
-- 100 ps, single loop till start period.
	 reset_n  <= '1'  ;
	wait for 10 ns ;
	wait;
 End Process;

-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 h_total  <= std_logic_vector(to_unsigned(799,12))  ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 h_sync  <= std_logic_vector(to_unsigned(95,12))  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 h_start  <= std_logic_vector(to_unsigned(141,12))  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 h_end  <= std_logic_vector(to_unsigned(781,12))  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 v_total  <= std_logic_vector(to_unsigned(524,12)) ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 v_sync  <= std_logic_vector(to_unsigned(1,12)) ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 v_start  <= std_logic_vector(to_unsigned(34,12)) ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 v_end  <= std_logic_vector(to_unsigned(514,12)) ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 v_active_14  <= std_logic_vector(to_unsigned(154,12)) ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
 
 
-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 v_active_24  <= std_logic_vector(to_unsigned(274,12)) ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
 
 
 
-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  Process
	Begin
	 v_active_34  <= std_logic_vector(to_unsigned(394,12)) ;
	wait for 10 ns ;
-- dumped values till 1 ns
	wait;
 End Process;
 
 
-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 vecteur_map  <= "1100100001"  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 largeur_grille  <= "0100"  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 hauteur_grille  <= "0100"  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 h_position_du_curseur  <= "0001"  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ps, End Time = 1 us, Period = 0 ps
  Process
	Begin
	 v_position_du_curseur  <= "0011"  ;
	wait for 10 ns ;
-- dumped values till 10 ns
	wait;
 End Process;
END;