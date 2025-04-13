module mux (out, i0, i1, i2, i3, s0, s1);
    output out;
    input i0, i1, i2, i3;
    input s0, s1;

    wire s0n, s1n;
    wire w0, w1, w2, w3;

    or o1 (out, w0, w1, w2, w3);

    and a0 (w0, i0, s0n, s1n);
    and a1 (w1, i1, s0, s1n);
    and a2 (w2, i2, s0n, s1);
    and a3 (w3, i3, s0, s1);

    not n0 (s0n, s0);
    not n1 (s1n, s1);

endmodule