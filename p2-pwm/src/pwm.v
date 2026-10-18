module pwm #(
    parameter WIDTH = 8
)(
    input  wire             clk,
    input  wire [WIDTH-1:0] duty,
    output reg             out
);

    reg [WIDTH-1:0] counter;

    always @(posedge clk) begin
        if (counter < duty) begin
            out <= 1;
        end else begin
            out <= 0;
        end

        counter <= counter + 1;
    end

endmodule