module stimulus;
    reg clk, rst;
    wire [3:0] q;

    RC rc (q, clk, rst);

    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end

    initial begin
        $dumpfile("RC.vcd");
        $dumpvars(0, stimulus);
        rst = 1'b1;
        #34 rst = 1'b0;
        #200 rst = 1'b1;
        #50 rst = 1'b0;
        clk = 1'b0;
    end

    initial
        #400 $finish;
endmodule