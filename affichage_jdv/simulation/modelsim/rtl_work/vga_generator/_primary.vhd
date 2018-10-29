library verilog;
use verilog.vl_types.all;
entity vga_generator is
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
end vga_generator;
