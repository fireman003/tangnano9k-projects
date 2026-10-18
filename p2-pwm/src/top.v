module top (
    input  wire       clk,
    output wire [5:0] led
);

    pwm pwm1 (.clk(clk), .duty(8'd0), .out(led[0]));
    pwm pwm2 (.clk(clk), .duty(8'd51), .out(led[1]));
    pwm pwm3 (.clk(clk), .duty(8'd102), .out(led[2]));
    pwm pwm4 (.clk(clk), .duty(8'd153), .out(led[3]));
    pwm pwm5 (.clk(clk), .duty(8'd204), .out(led[4]));
    pwm pwm6 (.clk(clk), .duty(8'd255), .out(led[5]));

endmodule