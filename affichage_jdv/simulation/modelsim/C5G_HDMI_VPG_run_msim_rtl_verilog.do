transcript on
if ![file isdirectory C5G_HDMI_VPG_iputf_libs] {
	file mkdir C5G_HDMI_VPG_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "D:/tiny_god/affichage_jdv/sys_pll_sim/sys_pll.vo"                     
vlog "D:/tiny_god/affichage_jdv/vpg_source/pll_sim/pll.vo"                  
vlog "D:/tiny_god/affichage_jdv/vpg_source/pll_reconfig_sim/pll_reconfig.vo"

vlog -vlog01compat -work work +incdir+D:/tiny_god/affichage_jdv/vpg_source {D:/tiny_god/affichage_jdv/vpg_source/vga_generator.v}

