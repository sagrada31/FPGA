transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Greg/GitHub/FPGA/Codes/submarines/db {C:/Users/Greg/GitHub/FPGA/Codes/submarines/db/spipll_altpll.v}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/vga.vhd}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/reset_delay.vhd}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/spipll.vhd}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/spi_ee_config.vhd}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/spi_controller.vhd}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/ram1_submarine.vhd}
vcom -93 -work work {C:/Users/Greg/GitHub/FPGA/Codes/submarines/gsensor.vhd}

