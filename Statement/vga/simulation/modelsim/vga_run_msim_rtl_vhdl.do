transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Greg/Desktop/FPGA/vga.vhd}

vcom -93 -work work {C:/Users/Greg/Desktop/FPGA/testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  test_vga

add wave *
view structure
view signals
run -all