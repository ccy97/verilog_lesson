`timescale 1ns/1ns

module tb;

    reg clk, d;
    wire q_blocking, q_nonblocking;

    // 建立兩種模組
    blocking_ff     u1 (.clk(clk), .d(d), .q(q_blocking));
    nonblocking_ff  u2 (.clk(clk), .d(d), .q(q_nonblocking));

    // 時脈產生器
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns 週期

    // 測試刺激
    initial begin
        d = 0;
        #12 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 $finish;
    end

    // 波形與監控
    initial begin
        $dumpfile("blocking_vs_nonblocking.vcd");
        $dumpvars(0, tb);
        $monitor("Time=%0t | d=%b | blocking=%b | nonblocking=%b", 
                 $time, d, q_blocking, q_nonblocking);
    end

endmodule
