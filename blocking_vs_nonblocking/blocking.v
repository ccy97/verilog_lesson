module blocking_ff(input clk, input d, output reg q);
    reg temp;

    always @(posedge clk) begin
        temp = d;
        q = temp;  // 先更新 temp，再給 q
    end
endmodule
