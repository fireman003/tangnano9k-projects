`timescale 1ns/1ps

module tb_uart_tx;
    reg clk = 0;
    reg start = 0;
    reg [7:0] data = 8'h41;   // 'A'
    wire tx, busy;

    always #18 clk = ~clk;    // ~27 MHz

    uart_tx dut (
        .clk(clk), .start(start), .data(data),
        .tx(tx), .busy(busy)
    );

    initial begin
        $dumpfile("tx.vcd");
        $dumpvars(0, tb_uart_tx);

        #1000;
        @(posedge clk) start = 1;
        @(posedge clk) start = 0;

        #500000;               // nech doběhnout celý rámec
        $finish;
    end
endmodule