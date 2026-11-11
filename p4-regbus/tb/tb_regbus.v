`timescale 1ns/1ps

module tb_regbus;
    reg clk = 0;
    reg uart_rx = 1;
    wire uart_tx;
    wire [5:0] led;

    always #18 clk = ~clk;

    top dut (
        .clk(clk),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx),
        .led(led)
    );

    task send_byte(input [7:0] b);
        integer i;
        begin
            uart_rx = 0;
            repeat (234) @(posedge clk);
            for (i = 0; i < 8; i = i + 1) begin
                uart_rx = b[i];
                repeat (234) @(posedge clk);
            end
            uart_rx = 1;
            repeat (234) @(posedge clk);
        end
    endtask

    initial begin
        $dumpfile("regbus.vcd");
        $dumpvars(0, tb_regbus);

        #10000;

        send_byte("1");
        send_byte("A");
        #10000;
        $display("memory[0] = %h", dut.bus.memory[0]);
        $display("currentAddres = %h", dut.bus.currentAddres);

        send_byte("9");
        send_byte("1");
        #100000;
        $display("tx_data = %h", dut.bus.tx_data);

        $finish;
    end
endmodule