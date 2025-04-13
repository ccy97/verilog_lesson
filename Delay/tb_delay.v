module stimulus;

    reg a, b, c;
    wire out;

    D d1 (out, a, b, c);

    initial begin
        $dumpfile("delay.vcd");
        $dumpvars(0, stimulus);
        a = 0; b = 0; c = 0;
        #10 a = 1;
        #10 b = 1;
        #10 c = 1;
        #10 a = 0;
        #10 b = 0;
        #10 c = 0;
        #10 $finish;
    end
endmodule