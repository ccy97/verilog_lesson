# Verilog_lesson

How to compile verilog(.v) file and show wave graph

xxx.v
tb_xxx.v

iverilog -o xxx xxx.v tb_xxx.v
	create xxx file

vvp xxx
	create xxx.vcd

gtkwave tb_xxx.vcd
	show wave graph

tb_xxx.v should include
    $dumpfile("tb_xxx.vcd");
    $dumpvars(0, testbench);
    $monitor("At time %t: var=%b", $time, var);

# Note
## value level
0: logic 0, false.
1: logic 1, true.
x: unknown value.
z: high impedence, floating state.

# 20250413
practice
1. 4 bit ripple carry counter.
2. SR latch.
3. 4 to 1 mux.
4. 4 bit full adder.
5. delay.
6. ripple carry counter.
