module top (
    input  wire       clk,   // 27 MHz
    output wire [5:0] led
);
    reg [24:0]count;

    always @(posedge clk) begin
        count <= count + 1;
    end

    //assign led[5:0] = ~{count[28], count[27], count[26], count[25], count[24], count[23]};
    assign led[5:0] = ~count[24:19];
endmodule