module uart_rx #(
    parameter CLK_HZ    = 27_000_000,
    parameter BAUD      = 115200
)(
    input  wire       clk,
    input  wire       rx,         // z pinu
    output reg  [7:0] data,       // přijatý bajt
    output reg        valid       // puls na 1 takt když je data platné
);

endmodule