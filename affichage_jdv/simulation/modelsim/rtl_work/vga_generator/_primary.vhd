library verilog;
use verilog.vl_types.all;
entity vga_generator is
    generic(
        vecteur_map     : vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        select_affichage: vl_logic := Hi1;
        largeur_grille  : integer := 4;
        hauteur_grille  : integer := 4;
        h_position_du_curseur: vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        v_position_du_curseur: vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        border          : integer := 10
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        h_total         : in     vl_logic_vector(11 downto 0);
        h_sync          : in     vl_logic_vector(11 downto 0);
        h_start         : in     vl_logic_vector(11 downto 0);
        h_end           : in     vl_logic_vector(11 downto 0);
        v_total         : in     vl_logic_vector(11 downto 0);
        v_sync          : in     vl_logic_vector(11 downto 0);
        v_start         : in     vl_logic_vector(11 downto 0);
        v_end           : in     vl_logic_vector(11 downto 0);
        v_active_14     : in     vl_logic_vector(11 downto 0);
        v_active_24     : in     vl_logic_vector(11 downto 0);
        v_active_34     : in     vl_logic_vector(11 downto 0);
        vga_hs          : out    vl_logic;
        vga_vs          : out    vl_logic;
        vga_de          : out    vl_logic;
        vga_r           : out    vl_logic_vector(7 downto 0);
        vga_g           : out    vl_logic_vector(7 downto 0);
        vga_b           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of vecteur_map : constant is 1;
    attribute mti_svvh_generic_type of select_affichage : constant is 1;
    attribute mti_svvh_generic_type of largeur_grille : constant is 1;
    attribute mti_svvh_generic_type of hauteur_grille : constant is 1;
    attribute mti_svvh_generic_type of h_position_du_curseur : constant is 1;
    attribute mti_svvh_generic_type of v_position_du_curseur : constant is 1;
    attribute mti_svvh_generic_type of border : constant is 1;
end vga_generator;
