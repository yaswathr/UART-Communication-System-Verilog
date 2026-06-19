module uart_tx (
    input        clk,
    input        rst,
    input        baud_tick,
    input        tx_start,
    input  [7:0] data_in,
    output reg   tx,
    output reg   tx_done
);

localparam IDLE  = 2'b00,
           START = 2'b01,
           DATA  = 2'b10,
           STOP  = 2'b11;

reg [1:0] state;
reg [7:0] data_reg;
reg [2:0] bit_count;

always @(posedge clk) begin
    if (rst) begin
        state     <= IDLE;
        tx        <= 1'b1;
        tx_done   <= 1'b0;
        data_reg  <= 8'b0;
        bit_count <= 3'b0;
    end
    else begin
        tx_done <= 1'b0;

        case(state)

            IDLE: begin
                tx <= 1'b1;

                if(tx_start) begin
                    data_reg  <= data_in;
                    bit_count <= 3'b0;
                    state     <= START;
                end
            end

            START: begin
                if(baud_tick) begin
                    tx    <= 1'b0;
                    state <= DATA;
                end
            end

            DATA: begin
                if(baud_tick) begin
                    tx <= data_reg[bit_count];

                    if(bit_count == 3'd7)
                        state <= STOP;
                    else
                        bit_count <= bit_count + 1'b1;
                end
            end

            STOP: begin
                if(baud_tick) begin
                    tx      <= 1'b1;
                    tx_done <= 1'b1;
                    state   <= IDLE;
                end
            end

        endcase
    end
end

endmodule