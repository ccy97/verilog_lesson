module D (out, a, b, c);
    input a, b, c;
    output out;

    wire w1;

    and #5 a1 (w1, a, b);
    or #4 o1 (out, w1, c);
endmodule