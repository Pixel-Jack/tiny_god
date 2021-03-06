
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module C5G_HDMI_VPG(

	//////////// CLOCK //////////
	CLOCK_125_p,
	CLOCK_50_B5B,
	CLOCK_50_B6A,
	CLOCK_50_B7A,
	CLOCK_50_B8A,

	//////////// KEY //////////
	CPU_RESET_n,

	//////////// SW //////////
	SW,

	//////////// HDMI-TX //////////
	HDMI_TX_CLK,
	HDMI_TX_D,
	HDMI_TX_DE,
	HDMI_TX_HS,
	HDMI_TX_INT,
	HDMI_TX_VS,
	
	vecteur_map,
	select_affichage,
	largeur_grille,
	hauteur_grille,
	h_position_du_curseur,
	v_position_du_curseur
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_125_p;
input 		          		CLOCK_50_B5B;
input 		          		CLOCK_50_B6A;
input 		          		CLOCK_50_B7A;
input 		          		CLOCK_50_B8A;


//////////// KEY //////////
input 		          		CPU_RESET_n;

//////////// SW //////////
input 		    				SW;


//////////// HDMI-TX //////////
output		          		HDMI_TX_CLK;
output		    [23:0]		HDMI_TX_D;
output		          		HDMI_TX_DE;
output		          		HDMI_TX_HS;
input 		          		HDMI_TX_INT;
output		          		HDMI_TX_VS;



input [1405:0]	vecteur_map;
input 			select_affichage;
input	[31:0]	largeur_grille;
input	[31:0]	hauteur_grille;
input [31:0]		h_position_du_curseur;
input [31:0]		v_position_du_curseur;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire        reset_n;
wire        pll_1200k;
reg  [12:0] counter_1200k;
reg         en_150;
//Video Pattern Generator
wire [3:0]	vpg_disp_mode;
wire        vpg_pclk;
wire        vpg_de, vpg_hs, vpg_vs;
wire [23:0]	vpg_data;

//=======================================================
//  Sub-module
//=======================================================
//system clock
sys_pll u_sys_pll (
  .refclk(CLOCK_50_B7A),
	.rst(!CPU_RESET_n),
	.outclk_0(pll_1200k), // 1200K
	.locked(reset_n) );


//video pattern resolution select
wire        vpg_mode_change;
wire [3:0]	vpg_mode;
//
vpg_mode u_vpg_mode (
	.reset_n(reset_n),
	.clk(pll_1200k),
	.clk_en(en_150),
	.mode_button(SW),
	.vpg_mode_change(vpg_mode_change),
	.vpg_mode(vpg_mode) );

//pattern generator

vpg	u_vpg (
	.clk_50(CLOCK_50_B7A),
	.reset_n(reset_n),
	.mode(vpg_mode),
	.mode_change(vpg_mode_change),
	.disp_color(`COLOR_RGB444),       
	.vpg_pclk(vpg_pclk),
	.vecteur_map(vecteur_map),
	.select_affichage(select_affichage),
	.largeur_grille(largeur_grille),
	.hauteur_grille(hauteur_grille),
	.h_position_du_curseur(h_position_du_curseur),
	.v_position_du_curseur(v_position_du_curseur),
	.vpg_de(vpg_de),
	.vpg_hs(vpg_hs),
	.vpg_vs(vpg_vs),
	.vpg_r(vpg_data[23:16]),
	.vpg_g(vpg_data[15:8]),
	.vpg_b(vpg_data[7:0]) );
	
	
	
assign HDMI_TX_CLK = vpg_pclk;
assign HDMI_TX_D   = vpg_data;
assign HDMI_TX_DE  = vpg_de;
assign HDMI_TX_HS  = vpg_hs;
assign HDMI_TX_VS  = vpg_vs;





//=======================================================
//  Structural coding
//=======================================================


always@(posedge pll_1200k or negedge reset_n)
begin
	if (!reset_n)
	begin
	  counter_1200k <= 13'b0;
		en_150 <= 1'b0; //frequency divider
	end
  else
  begin
    counter_1200k <= counter_1200k + 13'b1;
    en_150 <= &counter_1200k;
  end	
end


endmodule
