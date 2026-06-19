`timescale 1ns/1ps

module UART_TB;

reg clk;
reg rst;
reg tx_start;
reg [7:0] data_in;

wire [7:0] data_out;
wire rx_done;

uart_top DUT (
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .data_in(data_in),
    .data_out(data_out),
    .rx_done(rx_done)
);

always #10 clk = ~clk;   // 20 ns clock period

initial begin

    clk = 0;
    rst = 1;
    tx_start = 0;
    data_in = 8'h00;

    #100;
    rst = 0;

    // Test 1
    #100;
    data_in = 8'h41;
    tx_start = 1;
    #20;
    tx_start = 0;

    wait(rx_done);
    $display("Received Data = %h", data_out);

    // Test 2
    #1000;
    data_in = 8'h55;
    tx_start = 1;
    #20;
    tx_start = 0;

    wait(rx_done);
    $display("Received Data = %h", data_out);

    // Test 3
    #1000;
    data_in = 8'hAA;
    tx_start = 1;
    #20;
    tx_start = 0;

    wait(rx_done);
    $display("Received Data = %h", data_out);

    #1000;
    $finish;

end

endmodule