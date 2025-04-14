`timescale 1ns/1ps

module traffic_signal_tb;

    // 輸入/輸出宣告
    reg clk, rst, x;
    wire [1:0] hwy, cntry;

    // 實例化你的模組
    traffic_signal uut (
        .hwy(hwy),
        .cntry(cntry),
        .x(x),
        .clk(clk),
        .rst(rst)
    );

    // 時脈產生器
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 一個週期
    end

    // 測試流程
    initial begin
        // 初始化
        rst = 1;
        x = 0;

        #12; // 等待一個不是整數倍的時脈週期（測試 async reset）
        rst = 0;

        // 一段時間內都沒有鄉村車來（x=0）
        #50;

        // 有車來（x=1）
        x = 1;
        #100;

        // 車走了（x=0）
        x = 0;
        #100;

        // 再次有車來
        x = 1;
        #80;

        // 結束模擬
        $finish;
    end

    // 顯示訊號變化
    initial begin
        $dumpfile("traffic_signal_tb.vcd");
        $dumpvars(0, traffic_signal_tb);
        $monitor("Time: %0t | x=%b | hwy=%b | cntry=%b | state=%b", $time, x, hwy, cntry, uut.state);
    end

endmodule
