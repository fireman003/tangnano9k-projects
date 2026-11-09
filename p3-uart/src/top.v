module top (
    input  wire       clk,
    input  wire       uart_rx,
    output wire       uart_tx,
    output wire [5:0] led
);
    // echo: co přijde, to pošli zpátky
    // a zobraz spodních 6 bitů na LED

    reg [7:0] data;
    wire valid;
    wire busy;

    uart_rx rx (clk, uart_rx, data, valid);
    uart_tx tx (clk, valid, data, uart_tx, busy);

    assign led[5:0] = data[5:0];
    
endmodule