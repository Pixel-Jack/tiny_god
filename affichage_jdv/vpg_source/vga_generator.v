// --------------------------------------------------------------------
// Copyright (c) 2007 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------

module vga_generator(                                    
  input              clk,                
  input              reset_n,                                                
  input       [11:0] h_total,           
  input       [11:0] h_sync,           
  input       [11:0] h_start,             
  input       [11:0] h_end,                                                    
  input       [11:0] v_total,           
  input       [11:0] v_sync,            
  input       [11:0] v_start,           
  input       [11:0] v_end, 
  input       [11:0] v_active_14, 
  input       [11:0] v_active_24, 
  input       [11:0] v_active_34, 
  
  
  
  
  output  reg		     vga_hs,             
  output  reg        vga_vs,           
  output  reg 	     vga_de,
  output  reg [7:0]  vga_r,
  output  reg [7:0]  vga_g,
  output  reg [7:0]  vga_b                                                 
);

//=======================================================
//  Signal declarations
//=======================================================
reg			  [11:0]	h_count;
reg			   [7:0]	pixel_x;
reg			  [11:0]	v_count;
reg               h_act; 
reg               h_act_d;
reg               v_act; 
reg               v_act_d; 
reg               pre_vga_de;
wire              h_max, hs_end, hr_start, hr_end;
wire              v_max, vs_end, vr_start, vr_end;
wire              v_act_14, v_act_24, v_act_34;

//=======================================================
//  Structural coding
//=======================================================
assign h_max = h_count == h_total;
assign hs_end = h_count >= h_sync;
assign hr_start = h_count == h_start; 
assign hr_end = h_count == h_end;
assign v_max = v_count == v_total;
assign vs_end = v_count >= v_sync;
assign vr_start = v_count == v_start; 
assign vr_end = v_count == v_end;
assign v_act_14 = v_count == v_active_14; 
assign v_act_24 = v_count == v_active_24; 
assign v_act_34 = v_count == v_active_34;




//=======================================================
//  Parameters
//=======================================================
parameter vecteur_map = 100'b1101111110110011101100010011110110001100101010010011011100100000000100011000000110000010101110100001;
parameter select_affichage = 1'b1;
parameter largeur_grille = 10;
parameter hauteur_grille = 10;
parameter h_position_du_curseur = 4'b1;
parameter v_position_du_curseur = 4'b1;

parameter h_wait_count = 142;
parameter v_wait_count = 35;

integer largeur_cell;
integer h_in_cell;
integer x_map;
integer color_mode_h;
parameter h_tot = 640;


integer hauteur_cell;
integer v_in_cell;
integer y_map;
integer color_mode_v;
parameter v_tot = 480;


parameter border = 3;


//horizontal control signals
always @ (posedge clk or negedge reset_n)
	if (!reset_n)
	begin
    h_act_d   <=  1'b0;
		h_count		<=	12'b0;
		pixel_x   <=  8'b11111111;
		vga_hs		<=	1'b1;
		h_act	    <=	1'b0;
		color_mode_h <=  0;
		largeur_cell <= h_tot / largeur_grille;
	end
	else
	begin
    h_act_d   <=  h_act;

    if (h_max)
		  h_count	<= 12'b0;
		else
		  h_count	<= h_count + 12'b1;

		x_map = (h_count - h_wait_count) / largeur_cell;
		h_in_cell = (h_count - h_wait_count) % largeur_cell;
		if (x_map < 0 | x_map >= largeur_grille)
			color_mode_h = 0;
		else if(h_in_cell < border | h_in_cell >= largeur_cell - border)
			color_mode_h = 2;
		else
			color_mode_h = 1;
			
			
		

		if (hs_end && !h_max)
		  vga_hs	<=	1'b1;
		else
		  vga_hs	<= 1'b0;

		if (hr_start)
		  h_act	  <=	1'b1;
		else if (hr_end)
		  h_act	  <=	1'b0;
	end

//vertical control signals
always@(posedge clk or negedge reset_n)
	if(!reset_n)
	begin
		v_act_d	  <=	1'b0;
		v_count		<=	12'b0;
		vga_vs		<=	1'b1;
		v_act	    <=	1'b0;
		color_mode_v <=  0;
		hauteur_cell <= v_tot / hauteur_grille;
	end
	else 
	begin		
		if (h_max)
		begin		  
  		v_act_d	  <=	v_act;
		  
		  if (v_max)
		    v_count	<=	12'b0;
		  else
		    v_count	<=	v_count + 12'b1;

		  if (vs_end && !v_max)
		    vga_vs	<=	1'b1;
		  else
		    vga_vs	<=	1'b0;

  		if (vr_start)
	  	  v_act <=	1'b1;
		  else if (vr_end)
		    v_act <=	1'b0;
			 
		y_map = (v_count - v_wait_count) / hauteur_cell;
		v_in_cell = (v_count - v_wait_count) % hauteur_cell;
		
		if (y_map >= hauteur_grille)
			color_mode_v = 0;
		else if (v_in_cell < border | v_in_cell >= hauteur_cell - border)
			color_mode_v = 2;
		else 
			color_mode_v = 1;
		
	end
end
//pattern generator and display enable
always @(posedge clk or negedge reset_n)
begin
	if (!reset_n)
	begin
    vga_de <= 1'b0;
    pre_vga_de <= 1'b0;
  end
	else
	begin
		 vga_de <= pre_vga_de;
		 pre_vga_de <= v_act && h_act;
			
		case (color_mode_h * color_mode_v)
		0 : {vga_r, vga_g, vga_b} <= {8'hFF,8'hFF,8'hFF}; // out
		1 : if (vecteur_map[x_map + y_map * largeur_grille] == 1)
				{vga_r, vga_g, vga_b} <= {8'hC7,8'h00,8'h39}; // active / inactive
			 else 
				{vga_r, vga_g, vga_b} <= {8'h00,8'h00,8'h00}; // active / inactive
		default : 
			if (h_position_du_curseur == x_map & v_position_du_curseur == y_map)
				{vga_r, vga_g, vga_b} <= {8'hFF,8'h57,8'h33};
			else
				{vga_r, vga_g, vga_b} <= {8'h58,8'h18,8'h45};
		endcase
	end

end	

endmodule