library verilog;
use verilog.vl_types.all;
entity pll is
    port(
        locked          : out    vl_logic;
        outclk_0        : out    vl_logic;
        reconfig_from_pll: out    vl_logic_vector(63 downto 0);
        reconfig_to_pll : in     vl_logic_vector(63 downto 0);
        refclk          : in     vl_logic;
        rst             : in     vl_logic
    );
end pll;
