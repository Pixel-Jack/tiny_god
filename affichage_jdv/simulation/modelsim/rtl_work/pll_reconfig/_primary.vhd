library verilog;
use verilog.vl_types.all;
entity pll_reconfig is
    port(
        mgmt_address    : in     vl_logic_vector(5 downto 0);
        mgmt_clk        : in     vl_logic;
        mgmt_read       : in     vl_logic;
        mgmt_readdata   : out    vl_logic_vector(31 downto 0);
        mgmt_reset      : in     vl_logic;
        mgmt_waitrequest: out    vl_logic;
        mgmt_write      : in     vl_logic;
        mgmt_writedata  : in     vl_logic_vector(31 downto 0);
        reconfig_from_pll: in     vl_logic_vector(63 downto 0);
        reconfig_to_pll : out    vl_logic_vector(63 downto 0)
    );
end pll_reconfig;
