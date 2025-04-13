module stimulus;
    reg [3:0] a, b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;

    full_adder4 fa4 (sum, c_out, a, b, c_in);

    initial begin
        // Test case 1
        a = 4'b0001; b = 4'b0010; c_in = 1'b0;
        #10; // Wait for 10 time units

        // Test case 2
        a = 4'b1111; b = 4'b0001; c_in = 1'b0;
        #10;

        // Test case 3
        a = 4'b1010; b = 4'b0101; c_in = 1'b1;
        #10;

        // Test case 4
        a = 4'b1100; b = 4'b0011; c_in = 1'b1;
        #10;

        // Finish simulation
        $finish;
    end
    initial begin
        // Monitor the outputs
        $monitor("Time: %0t | a: %b | b: %b | c_in: %b | sum: %b | c_out: %b", 
                 $time, a, b, c_in, sum, c_out);
        $dumpfile("full_adder.vcd");
        $dumpvars(0, stimulus);
    end
endmodule