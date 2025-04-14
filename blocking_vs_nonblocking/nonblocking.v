module nonblocking_ff(input clk, input d, output reg q);
    reg temp;

    always @(posedge clk) begin
        temp <= d;
        q <= temp;  // temp 與 q 都是同步更新
    end
endmodule
