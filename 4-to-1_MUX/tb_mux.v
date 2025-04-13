module stimulus;
    reg i0, i1, i2, i3, s0, s1;
    wire out;

    mux m1 (out, i0, i1, i2, i3, s0, s1);

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, stimulus);
        $monitor($time, " i0=%b i1=%b i2=%b i3=%b s0=%b s1=%b out=%b", i0, i1, i2, i3, s0, s1, out);
        i0 = 0; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
        #5 i0 = 1; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
        #5 i0 = 0; i1 = 1; i2 = 0; i3 = 0; s0 = 0; s1 = 1;
        #5 i0 = 0; i1 = 0; i2 = 1; i3 = 0; s0 = 1; s1 = 0;
        #5 i0 = 0; i1 = 0; i2 = 0; i3 = 1; s0 = 1; s1 = 1;
        #5 i0 = 1; i1 = 1; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
        #5 i0 = 0; i1 = 1; i2 = 1; i3 = 0; s0 = 0; s1 = 1;
        #5 i0 = 0; i1 = 0; i2 = 1; i3 = 1; s0 = 1; s1 = 0;
        #5 $finish;
    end

endmodule