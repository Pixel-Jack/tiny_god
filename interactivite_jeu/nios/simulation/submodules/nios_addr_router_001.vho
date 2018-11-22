--IP Functional Simulation Model
--VERSION_BEGIN 13.0 cbx_mgl 2013:04:24:18:11:10:SJ cbx_simgen 2013:04:24:18:08:47:SJ  VERSION_END


-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Altera disclaims all warranties of any kind).


--synopsys translate_off

--synthesis_resources = mux21 103 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  nios_addr_router_001 IS 
	 PORT 
	 ( 
		 clk	:	IN  STD_LOGIC;
		 reset	:	IN  STD_LOGIC;
		 sink_data	:	IN  STD_LOGIC_VECTOR (94 DOWNTO 0);
		 sink_endofpacket	:	IN  STD_LOGIC;
		 sink_ready	:	OUT  STD_LOGIC;
		 sink_startofpacket	:	IN  STD_LOGIC;
		 sink_valid	:	IN  STD_LOGIC;
		 src_channel	:	OUT  STD_LOGIC_VECTOR (11 DOWNTO 0);
		 src_data	:	OUT  STD_LOGIC_VECTOR (94 DOWNTO 0);
		 src_endofpacket	:	OUT  STD_LOGIC;
		 src_ready	:	IN  STD_LOGIC;
		 src_startofpacket	:	OUT  STD_LOGIC;
		 src_valid	:	OUT  STD_LOGIC
	 ); 
 END nios_addr_router_001;

 ARCHITECTURE RTL OF nios_addr_router_001 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	wire_nios_addr_router_001_src_channel_106m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_107m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_108m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_110m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_115m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_116m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_123m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_124m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_125m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_127m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_128m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_132m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_133m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_140m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_141m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_142m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_144m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_145m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_146m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_149m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_150m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_157m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_158m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_159m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_161m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_162m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_163m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_164m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_166m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_167m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_174m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_175m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_176m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_178m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_179m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_180m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_181m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_182m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_183m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_184m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_190m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_191m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_192m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_193m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_195m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_196m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_197m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_198m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_199m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_200m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_201m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_47m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_48m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_55m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_64m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_65m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_72m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_73m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_81m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_82m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_89m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_90m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_91m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_98m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_channel_99m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_100m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_101m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_102m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_103m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_117m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_118m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_119m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_120m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_134m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_135m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_136m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_137m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_151m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_152m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_153m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_154m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_168m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_169m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_170m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_171m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_185m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_186m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_187m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_188m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_202m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_203m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_204m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_205m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_51m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_52m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_66m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_67m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_68m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_69m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_83m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_84m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_85m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nios_addr_router_001_src_data_86m_dataout	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_sink_data_range120w448w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range123w330w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range144w293w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w2w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range123w307w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range126w308w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range147w292w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_10_664_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_11_685_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_1_475_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_2_496_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_3_517_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_4_538_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_5_559_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_6_580_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_7_601_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_8_622_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_nios_addr_router_001_src_channel_9_643_dataout :	STD_LOGIC;
	 SIGNAL  wire_w_sink_data_range120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_w_lg_w_sink_data_range120w448w(0) <= wire_w_sink_data_range120w(0) AND wire_w_lg_w_sink_data_range123w307w(0);
	wire_w_lg_w_sink_data_range123w330w(0) <= wire_w_sink_data_range123w(0) AND wire_w_lg_w_sink_data_range126w308w(0);
	wire_w_lg_w_sink_data_range144w293w(0) <= wire_w_sink_data_range144w(0) AND wire_w_lg_w_sink_data_range147w292w(0);
	wire_w1w(0) <= NOT s_wire_nios_addr_router_001_src_channel_1_475_dataout;
	wire_w2w(0) <= NOT s_wire_nios_addr_router_001_src_channel_2_496_dataout;
	wire_w_lg_w_sink_data_range123w307w(0) <= NOT wire_w_sink_data_range123w(0);
	wire_w_lg_w_sink_data_range126w308w(0) <= NOT wire_w_sink_data_range126w(0);
	wire_w_lg_w_sink_data_range147w292w(0) <= NOT wire_w_sink_data_range147w(0);
	s_wire_nios_addr_router_001_src_channel_10_664_dataout <= (((((((((((((((((NOT sink_data(39)) AND wire_w_lg_w_sink_data_range123w307w(0)) AND wire_w_lg_w_sink_data_range126w308w(0)) AND (NOT sink_data(42))) AND sink_data(43)) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_11_685_dataout <= (((((((((((((((wire_w_lg_w_sink_data_range120w448w(0) AND wire_w_lg_w_sink_data_range126w308w(0)) AND (NOT sink_data(42))) AND sink_data(43)) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_1_475_dataout <= (((((((wire_w_lg_w_sink_data_range144w293w(0) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_2_496_dataout <= (((((((((((((((wire_w_lg_w_sink_data_range123w307w(0) AND wire_w_lg_w_sink_data_range126w308w(0)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_3_517_dataout <= ((((((((((((((wire_w_lg_w_sink_data_range123w330w(0) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_4_538_dataout <= (((((((((((((((wire_w_lg_w_sink_data_range123w307w(0) AND sink_data(41)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_5_559_dataout <= (((((((((((((((sink_data(40) AND sink_data(41)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_6_580_dataout <= (((((((((((((((wire_w_lg_w_sink_data_range123w307w(0) AND wire_w_lg_w_sink_data_range126w308w(0)) AND sink_data(42)) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_7_601_dataout <= ((((((((((((((wire_w_lg_w_sink_data_range123w330w(0) AND sink_data(42)) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_8_622_dataout <= (((((((((((((((wire_w_lg_w_sink_data_range123w307w(0) AND sink_data(41)) AND sink_data(42)) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	s_wire_nios_addr_router_001_src_channel_9_643_dataout <= (((((((((((((((sink_data(40) AND sink_data(41)) AND sink_data(42)) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND (NOT sink_data(51))) AND (NOT sink_data(52))) AND (NOT sink_data(53))) AND (NOT sink_data(54))) AND sink_data(55));
	sink_ready <= src_ready;
	src_channel <= ( wire_nios_addr_router_001_src_channel_190m_dataout & wire_nios_addr_router_001_src_channel_191m_dataout & wire_nios_addr_router_001_src_channel_192m_dataout & wire_nios_addr_router_001_src_channel_193m_dataout & s_wire_nios_addr_router_001_src_channel_11_685_dataout & wire_nios_addr_router_001_src_channel_195m_dataout & wire_nios_addr_router_001_src_channel_196m_dataout & wire_nios_addr_router_001_src_channel_197m_dataout & wire_nios_addr_router_001_src_channel_198m_dataout & wire_nios_addr_router_001_src_channel_199m_dataout & wire_nios_addr_router_001_src_channel_200m_dataout & wire_nios_addr_router_001_src_channel_201m_dataout);
	src_data <= ( sink_data(94 DOWNTO 85) & wire_nios_addr_router_001_src_data_202m_dataout & wire_nios_addr_router_001_src_data_203m_dataout & wire_nios_addr_router_001_src_data_204m_dataout & wire_nios_addr_router_001_src_data_205m_dataout & sink_data(80 DOWNTO 0));
	src_endofpacket <= sink_endofpacket;
	src_startofpacket <= sink_startofpacket;
	src_valid <= sink_valid;
	wire_w_sink_data_range120w(0) <= sink_data(39);
	wire_w_sink_data_range123w(0) <= sink_data(40);
	wire_w_sink_data_range126w(0) <= sink_data(41);
	wire_w_sink_data_range144w(0) <= sink_data(47);
	wire_w_sink_data_range147w(0) <= sink_data(48);
	wire_nios_addr_router_001_src_channel_106m_dataout <= wire_nios_addr_router_001_src_channel_89m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_channel_107m_dataout <= wire_nios_addr_router_001_src_channel_90m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_channel_108m_dataout <= wire_nios_addr_router_001_src_channel_91m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_channel_110m_dataout <= s_wire_nios_addr_router_001_src_channel_5_559_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_channel_115m_dataout <= wire_nios_addr_router_001_src_channel_98m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_channel_116m_dataout <= wire_nios_addr_router_001_src_channel_99m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_channel_123m_dataout <= wire_nios_addr_router_001_src_channel_106m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_124m_dataout <= wire_nios_addr_router_001_src_channel_107m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_125m_dataout <= wire_nios_addr_router_001_src_channel_108m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_127m_dataout <= wire_nios_addr_router_001_src_channel_110m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_128m_dataout <= s_wire_nios_addr_router_001_src_channel_6_580_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_132m_dataout <= wire_nios_addr_router_001_src_channel_115m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_133m_dataout <= wire_nios_addr_router_001_src_channel_116m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_channel_140m_dataout <= wire_nios_addr_router_001_src_channel_123m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_141m_dataout <= wire_nios_addr_router_001_src_channel_124m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_142m_dataout <= wire_nios_addr_router_001_src_channel_125m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_144m_dataout <= wire_nios_addr_router_001_src_channel_127m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_145m_dataout <= wire_nios_addr_router_001_src_channel_128m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_146m_dataout <= s_wire_nios_addr_router_001_src_channel_7_601_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_149m_dataout <= wire_nios_addr_router_001_src_channel_132m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_150m_dataout <= wire_nios_addr_router_001_src_channel_133m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_channel_157m_dataout <= wire_nios_addr_router_001_src_channel_140m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_158m_dataout <= wire_nios_addr_router_001_src_channel_141m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_159m_dataout <= wire_nios_addr_router_001_src_channel_142m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_161m_dataout <= wire_nios_addr_router_001_src_channel_144m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_162m_dataout <= wire_nios_addr_router_001_src_channel_145m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_163m_dataout <= wire_nios_addr_router_001_src_channel_146m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_164m_dataout <= s_wire_nios_addr_router_001_src_channel_8_622_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_166m_dataout <= wire_nios_addr_router_001_src_channel_149m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_167m_dataout <= wire_nios_addr_router_001_src_channel_150m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_channel_174m_dataout <= wire_nios_addr_router_001_src_channel_157m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_175m_dataout <= wire_nios_addr_router_001_src_channel_158m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_176m_dataout <= wire_nios_addr_router_001_src_channel_159m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_178m_dataout <= wire_nios_addr_router_001_src_channel_161m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_179m_dataout <= wire_nios_addr_router_001_src_channel_162m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_180m_dataout <= wire_nios_addr_router_001_src_channel_163m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_181m_dataout <= wire_nios_addr_router_001_src_channel_164m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_182m_dataout <= s_wire_nios_addr_router_001_src_channel_9_643_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_183m_dataout <= wire_nios_addr_router_001_src_channel_166m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_184m_dataout <= wire_nios_addr_router_001_src_channel_167m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_channel_190m_dataout <= s_wire_nios_addr_router_001_src_channel_10_664_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_191m_dataout <= wire_nios_addr_router_001_src_channel_174m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_192m_dataout <= wire_nios_addr_router_001_src_channel_175m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_193m_dataout <= wire_nios_addr_router_001_src_channel_176m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_195m_dataout <= wire_nios_addr_router_001_src_channel_178m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_196m_dataout <= wire_nios_addr_router_001_src_channel_179m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_197m_dataout <= wire_nios_addr_router_001_src_channel_180m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_198m_dataout <= wire_nios_addr_router_001_src_channel_181m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_199m_dataout <= wire_nios_addr_router_001_src_channel_182m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_200m_dataout <= wire_nios_addr_router_001_src_channel_183m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_201m_dataout <= wire_nios_addr_router_001_src_channel_184m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_channel_47m_dataout <= wire_w1w(0) AND NOT(s_wire_nios_addr_router_001_src_channel_2_496_dataout);
	wire_nios_addr_router_001_src_channel_48m_dataout <= s_wire_nios_addr_router_001_src_channel_1_475_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_2_496_dataout);
	wire_nios_addr_router_001_src_channel_55m_dataout <= s_wire_nios_addr_router_001_src_channel_2_496_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_3_517_dataout);
	wire_nios_addr_router_001_src_channel_64m_dataout <= wire_nios_addr_router_001_src_channel_47m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_3_517_dataout);
	wire_nios_addr_router_001_src_channel_65m_dataout <= wire_nios_addr_router_001_src_channel_48m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_3_517_dataout);
	wire_nios_addr_router_001_src_channel_72m_dataout <= wire_nios_addr_router_001_src_channel_55m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);
	wire_nios_addr_router_001_src_channel_73m_dataout <= s_wire_nios_addr_router_001_src_channel_3_517_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);
	wire_nios_addr_router_001_src_channel_81m_dataout <= wire_nios_addr_router_001_src_channel_64m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);
	wire_nios_addr_router_001_src_channel_82m_dataout <= wire_nios_addr_router_001_src_channel_65m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);
	wire_nios_addr_router_001_src_channel_89m_dataout <= wire_nios_addr_router_001_src_channel_72m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_5_559_dataout);
	wire_nios_addr_router_001_src_channel_90m_dataout <= wire_nios_addr_router_001_src_channel_73m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_5_559_dataout);
	wire_nios_addr_router_001_src_channel_91m_dataout <= s_wire_nios_addr_router_001_src_channel_4_538_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_5_559_dataout);
	wire_nios_addr_router_001_src_channel_98m_dataout <= wire_nios_addr_router_001_src_channel_81m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_5_559_dataout);
	wire_nios_addr_router_001_src_channel_99m_dataout <= wire_nios_addr_router_001_src_channel_82m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_5_559_dataout);
	wire_nios_addr_router_001_src_data_100m_dataout <= wire_nios_addr_router_001_src_data_83m_dataout OR s_wire_nios_addr_router_001_src_channel_5_559_dataout;
	wire_nios_addr_router_001_src_data_101m_dataout <= wire_nios_addr_router_001_src_data_84m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_5_559_dataout);
	wire_nios_addr_router_001_src_data_102m_dataout <= wire_nios_addr_router_001_src_data_85m_dataout OR s_wire_nios_addr_router_001_src_channel_5_559_dataout;
	wire_nios_addr_router_001_src_data_103m_dataout <= wire_nios_addr_router_001_src_data_86m_dataout OR s_wire_nios_addr_router_001_src_channel_5_559_dataout;
	wire_nios_addr_router_001_src_data_117m_dataout <= wire_nios_addr_router_001_src_data_100m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_data_118m_dataout <= wire_nios_addr_router_001_src_data_101m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_data_119m_dataout <= wire_nios_addr_router_001_src_data_102m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_data_120m_dataout <= wire_nios_addr_router_001_src_data_103m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_6_580_dataout);
	wire_nios_addr_router_001_src_data_134m_dataout <= wire_nios_addr_router_001_src_data_117m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_7_601_dataout);
	wire_nios_addr_router_001_src_data_135m_dataout <= wire_nios_addr_router_001_src_data_118m_dataout OR s_wire_nios_addr_router_001_src_channel_7_601_dataout;
	wire_nios_addr_router_001_src_data_136m_dataout <= wire_nios_addr_router_001_src_data_119m_dataout OR s_wire_nios_addr_router_001_src_channel_7_601_dataout;
	wire_nios_addr_router_001_src_data_137m_dataout <= wire_nios_addr_router_001_src_data_120m_dataout OR s_wire_nios_addr_router_001_src_channel_7_601_dataout;
	wire_nios_addr_router_001_src_data_151m_dataout <= wire_nios_addr_router_001_src_data_134m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_data_152m_dataout <= wire_nios_addr_router_001_src_data_135m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_data_153m_dataout <= wire_nios_addr_router_001_src_data_136m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_8_622_dataout);
	wire_nios_addr_router_001_src_data_154m_dataout <= wire_nios_addr_router_001_src_data_137m_dataout OR s_wire_nios_addr_router_001_src_channel_8_622_dataout;
	wire_nios_addr_router_001_src_data_168m_dataout <= wire_nios_addr_router_001_src_data_151m_dataout OR s_wire_nios_addr_router_001_src_channel_9_643_dataout;
	wire_nios_addr_router_001_src_data_169m_dataout <= wire_nios_addr_router_001_src_data_152m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_data_170m_dataout <= wire_nios_addr_router_001_src_data_153m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_9_643_dataout);
	wire_nios_addr_router_001_src_data_171m_dataout <= wire_nios_addr_router_001_src_data_154m_dataout OR s_wire_nios_addr_router_001_src_channel_9_643_dataout;
	wire_nios_addr_router_001_src_data_185m_dataout <= wire_nios_addr_router_001_src_data_168m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_data_186m_dataout <= wire_nios_addr_router_001_src_data_169m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_10_664_dataout);
	wire_nios_addr_router_001_src_data_187m_dataout <= wire_nios_addr_router_001_src_data_170m_dataout OR s_wire_nios_addr_router_001_src_channel_10_664_dataout;
	wire_nios_addr_router_001_src_data_188m_dataout <= wire_nios_addr_router_001_src_data_171m_dataout OR s_wire_nios_addr_router_001_src_channel_10_664_dataout;
	wire_nios_addr_router_001_src_data_202m_dataout <= wire_nios_addr_router_001_src_data_185m_dataout OR s_wire_nios_addr_router_001_src_channel_11_685_dataout;
	wire_nios_addr_router_001_src_data_203m_dataout <= wire_nios_addr_router_001_src_data_186m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_data_204m_dataout <= wire_nios_addr_router_001_src_data_187m_dataout OR s_wire_nios_addr_router_001_src_channel_11_685_dataout;
	wire_nios_addr_router_001_src_data_205m_dataout <= wire_nios_addr_router_001_src_data_188m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_11_685_dataout);
	wire_nios_addr_router_001_src_data_51m_dataout <= wire_w1w(0) AND NOT(s_wire_nios_addr_router_001_src_channel_2_496_dataout);
	wire_nios_addr_router_001_src_data_52m_dataout <= s_wire_nios_addr_router_001_src_channel_1_475_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_2_496_dataout);
	wire_nios_addr_router_001_src_data_66m_dataout <= s_wire_nios_addr_router_001_src_channel_2_496_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_3_517_dataout);
	wire_nios_addr_router_001_src_data_67m_dataout <= wire_w2w(0) OR s_wire_nios_addr_router_001_src_channel_3_517_dataout;
	wire_nios_addr_router_001_src_data_68m_dataout <= wire_nios_addr_router_001_src_data_51m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_3_517_dataout);
	wire_nios_addr_router_001_src_data_69m_dataout <= wire_nios_addr_router_001_src_data_52m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_3_517_dataout);
	wire_nios_addr_router_001_src_data_83m_dataout <= wire_nios_addr_router_001_src_data_66m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);
	wire_nios_addr_router_001_src_data_84m_dataout <= wire_nios_addr_router_001_src_data_67m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);
	wire_nios_addr_router_001_src_data_85m_dataout <= wire_nios_addr_router_001_src_data_68m_dataout OR s_wire_nios_addr_router_001_src_channel_4_538_dataout;
	wire_nios_addr_router_001_src_data_86m_dataout <= wire_nios_addr_router_001_src_data_69m_dataout AND NOT(s_wire_nios_addr_router_001_src_channel_4_538_dataout);

 END RTL; --nios_addr_router_001
--synopsys translate_on
--VALID FILE
