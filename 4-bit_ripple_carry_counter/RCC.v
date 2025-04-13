module ripple_carry_counter (q, clk, rst);
    output [3:0] q;
    input clk;
    input rst;

    T_FF tff0 (q[0], clk, rst);
    T_FF tff1 (q[1], q[0], rst);
    T_FF tff2 (q[2], q[1], rst);
    T_FF tff3 (q[3], q[2], rst);

endmodule

module T_FF (q, clk ,rst);
    output q;
    input clk;
    input rst;
    wire d;

    D_FF dff0 (q, d, clk, rst);

    not n1(d, q);

endmodule

module D_FF (q, d, clk, rst);
    output q;
    input d;
    input clk;
    input rst;
    reg q;

    always @(posedge rst or negedge clk) begin
        if (rst)
            q = 1'b0;
        else
            q = d;
    end
endmodule

