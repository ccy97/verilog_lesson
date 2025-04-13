module full_adder (sum, c_out, a, b, c_in);
    output sum;
    output c_out;
    input a;
    input b;
    input c_in;

    wire w1, w2, w3;

    xor xo1 (sum, w1, c_in);
    xor xo2 (c_out, w2, w3);
    and a1 (w3, w1, c_in);
    xor xo3 (w1, a, b);
    and a2 (w2, a, b);
endmodule

module full_adder4 (sum, c_out, a, b, c_in);
    output [3:0] sum;
    output c_out;
    input [3:0] a;
    input [3:0] b;
    input c_in;

    wire c1, c2, c3;

    full_adder fa1 (sum[0], c1, a[0], b[0], c_in);
    full_adder fa2 (sum[1], c2, a[1], b[1], c1);
    full_adder fa3 (sum[2], c3, a[2], b[2], c2);
    full_adder fa4 (sum[3], c_out, a[3], b[3], c3);
endmodule
