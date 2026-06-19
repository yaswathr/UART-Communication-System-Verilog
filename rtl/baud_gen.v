module baud_gen
#(
    parameter CLK_FREQ = 50000000,
    parameter BAUD_RATE = 9600
)
(
    input clk,
    input rst,
    output reg baud_tick
);

localparam DIVISOR = CLK_FREQ / BAUD_RATE;

integer count;

always @(posedge clk)
begin
    if(rst)
    begin
        count <= 0;
        baud_tick <= 0;
    end
    else
    begin
        if(count == DIVISOR-1)
        begin
            count <= 0;
            baud_tick <= 1;
        end
        else
        begin
            count <= count + 1;
            baud_tick <= 0;
        end
    end
end

endmodule