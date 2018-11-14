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

vcom -93 -work work {D:/tiny_god/affichage_jdv/simulation/modelsim/test_bencheval.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  test_bencheval

add wave *
view structure
view signals
run -all
