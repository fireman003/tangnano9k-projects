module regbus (
    input  wire       clk,
    input  wire [7:0] rx_data,
    input  wire       rx_valid,
    output reg  [7:0] tx_data,
    output reg        tx_start,
    input  wire       tx_busy,
    output wire [7:0] reg0,    // viditelný na LED
    output wire [7:0] reg1
);

    

endmodule   