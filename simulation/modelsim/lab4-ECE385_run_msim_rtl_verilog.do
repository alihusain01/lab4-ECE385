transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/nineBitAdder.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/negate.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/multiplexer.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/reg_8.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/reg_1.sv}
vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/control.sv}

vlog -sv -work work +incdir+C:/Users/alijh/Documents/ECE\ 385/lab4-ECE385 {C:/Users/alijh/Documents/ECE 385/lab4-ECE385/testbench_1.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_1

add wave *
view structure
view signals
run 800 ns
