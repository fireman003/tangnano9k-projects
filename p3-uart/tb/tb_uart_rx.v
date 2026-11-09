`timescale 1ns/1ps

module tb_uart_rx;
    reg clk = 0;
    reg rx = 1;              // klidová úroveň
    wire [7:0] data;
    wire valid;

    always #18 clk = ~clk;

    uart_rx dut (
        .clk(clk), .rx(rx),
        .data(data), .valid(valid)
    );

    task send_byte(input [7:0] b);
        integer i;
        begin
            rx = 0;
            repeat (234) @(posedge clk);
            for (i = 0; i < 8; i = i + 1) begin
                rx = b[i];
                repeat (234) @(posedge clk);
            end
            rx = 1;
            repeat (234) @(posedge clk);
        end
    endtask

    initial begin
        $dumpfile("rx.vcd");
        $dumpvars(0, tb_uart_rx);

        #10000;
        send_byte(8'h34);        // '4'
        #10000;
        $display("prijato: %h", data);
        $finish;
    end
endmodule