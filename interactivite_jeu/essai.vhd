library IEEE;
use IEEE.std_logic_1164.all;

entity essai is
	port (
		clk                             : in  std_logic                     := '0';             --                          clk.clk
		pause_external_connection_export    : in std_logic;                                        --    pause_external_connection.export
		action_external_connection_export   : in std_logic;                                        --   action_external_connection.export
		up_external_connection_export : in std_logic;                     -- position_external_connection.export
		down_external_connection_export : in std_logic;
		left_external_connection_export : in std_logic;
		right_external_connection_export : in std_logic;
		LEDS : out std_logic_vector(3 downto 0)
	);
end entity essai;

architecture a of essai is
begin

LEDS <= up_external_connection_export & down_external_connection_export & left_external_connection_export & right_external_connection_export;

end architecture a;