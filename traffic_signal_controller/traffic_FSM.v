module traffic_signal (hwy, cntry, x, clk, rst);
    output reg [1:0] hwy, cntry;
    input clk, rst;
    input x;

    parameter RED = 2'b00;
    parameter YELLOW = 2'b01;
    parameter GREEN = 2'b10;

    parameter S0 = 3'b000; // hwy green, cntry red
    parameter S1 = 3'b001; // hwy yellow, cntry red
    parameter S2 = 3'b010; // hwy red, cntry red
    parameter S3 = 3'b011; // hwy red, cntry green
    parameter S4 = 3'b100; // hwy red, cntry yellow

    reg [2:0] state, next_state;
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        hwy = GREEN;
        cntry = RED;
        case (state)
            S0: ;
            S1: hwy = YELLOW;
            S2: hwy = RED;
            S3: begin
                hwy = RED;
                cntry = GREEN;
            end
            S4: begin
                hwy = RED;
                cntry = YELLOW;
            end
        endcase
    end

    always @(state or x) begin
        case (state)
            S0: next_state = (x) ? S1 : S0;
            S1: next_state = S2;
            S2: next_state = (x) ? S3 : S2;
            S3: next_state = S4;
            S4: next_state = S0;
            default: next_state = S0;
        endcase
    end
endmodule