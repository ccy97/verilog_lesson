module stimulus;

reg clk;
reg rst;
wire [3:0] q;

ripple_carry_counter r1 (q, clk, rst);

initial begin
    clk = 1'b0;
end

always begin
    #5 clk = ~clk;
end

initial
begin
    rst = 1'b1;
    #15 rst = 1'b0;
    #180 rst = 1'b1;
    #10 rst = 1'b0;
    #20 $finish;
end

initial begin
    $monitor ($time, " Output q = %d", q);
    $dumpfile("tb_RCC.vcd");
    $dumpvars(0, stimulus);
end

endmodule