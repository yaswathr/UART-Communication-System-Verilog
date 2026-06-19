module uart_top(
    input clk,
    input rst,
    input tx_start,
    input [7:0] data_in,
    output [7:0] data_out,
    output rx_done
);

wire baud_tick;
wire tx_wire;

baud_gen U1 (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick)
);

uart_tx U2 (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx_wire),
    .tx_done()
);

uart_rx U3 (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .rx(tx_wire),
    .data_out(data_out),
    .rx_done(rx_done)
);

endmodule