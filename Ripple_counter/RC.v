module RC (q, clk, rst);
    output [3:0] q;
    input clk, rst;

    T_FF tff0 (q[0], clk, rst);
    T_FF tff1 (q[1], q[0], rst);
    T_FF tff2 (q[2], q[1], rst);
    T_FF tff3 (q[3], q[2], rst);
endmodule

module T_FF (q, clk, rst);
    output q;
    input clk, rst;

    wire d, q_;
    
    not n1 (d, q);

    D_FF dff0 (q, q_, d, clk, rst);
endmodule

module D_FF (q, q_, d, clk, rst);
    output q, q_;
    input d, clk, rst;

    wire clk_, rst_, s, s_, r, r_;

    not n1 (rst_, rst);
    not n2 (clk_, clk);
    
    nand na1 (s_, r_, s);
    nand na2 (s, s_, rst_, clk_);
    nand na3 (r, s, r_, clk_);
    nand na4 (r_, r, rst_, d);

    nand na5 (q, s, q_);
    nand na6 (q_, q, r, rst_);
endmodule