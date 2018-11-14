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


vlog "C:/Users/ponthieu_cle/Documents/C5G_HDMI_VPG/sys_pll_sim/sys_pll.vo"                     
vlog "C:/Users/ponthieu_cle/Documents/C5G_HDMI_VPG/vpg_source/pll_sim/pll.vo"                  
vlog "C:/Users/ponthieu_cle/Documents/C5G_HDMI_VPG/vpg_source/pll_reconfig_sim/pll_reconfig.vo"

vlog -vlog01compat -work work +incdir+C:/Users/ponthieu_cle/Documents/C5G_HDMI_VPG/vpg_source {C:/Users/ponthieu_cle/Documents/C5G_HDMI_VPG/vpg_source/vga_generator.v}

