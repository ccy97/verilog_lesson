module SR (q, q_, set, rst);
    output q;
    output q_;
    input set;
    input rst;

    nand n1 (q, set, q_);
    nand n2 (q_, rst, q);
endmodule