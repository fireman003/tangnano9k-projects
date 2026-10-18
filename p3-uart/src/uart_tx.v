module uart_tx #(
    parameter CLK_HZ    = 27_000_000,
    parameter BAUD      = 115200
)(
    input  wire       clk,
    input  wire       start,      // puls na 1 takt = pošli
    input  wire [7:0] data,       // co poslat
    output reg        tx,         // na pin
    output reg        busy        // 1 když se vysílá
);

endmodule