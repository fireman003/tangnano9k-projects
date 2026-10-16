module pwm #(
    parameter WIDTH = 8
)(
    input  wire             clk,
    input  wire [WIDTH-1:0] duty,
    output wire             out
);

    // čítač šířky WIDTH, jede pořád dokola
    // out = 1 když je čítač menší než duty

endmodule