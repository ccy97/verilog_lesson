module Top;
    wire q;
    wire q_;
    reg set;
    reg rst;

    SR m1 (q, q_, set, rst);

    initial begin
        $dumpfile("SR.vcd");
        $dumpvars(0, Top);
        set = 0;
        rst = 0;
        #5 set = 1;
        #5 rst = 1;
        #5 set = 0;
        #5 rst = 0;
        #5 set = 1;
        #5 rst = 1;
        #5 set = 0;
        #5 rst = 0;
        #5 $finish;
    end
endmodule
