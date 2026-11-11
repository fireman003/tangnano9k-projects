module top (
    input  wire       clk,
    input  wire       uart_rx,
    output wire       uart_tx,
    output wire [5:0] led
);

    wire [7:0] rx_data;
    wire [7:0] tx_data;
    wire [7:0] reg0, reg1;

    uart_rx rx (
        .clk(clk), .rx(uart_rx),
        .data(rx_data), .valid(rx_valid)
    );

    uart_tx tx (
        .clk(clk), .start(tx_start), .data(tx_data),
        .tx(uart_tx), .busy(tx_busy)
    );

    regbus bus (
        .clk(clk),
        .rx_data(rx_data), .rx_valid(rx_valid),
        .tx_data(tx_data), .tx_start(tx_start), .tx_busy(tx_busy),
        .reg0(reg0), .reg1(reg1)
    );

    assign led = ~reg0[5:0];

endmodule