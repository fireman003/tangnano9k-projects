module top (
    input  wire       clk,   // 27 MHz
    input  wire       btn,   // button S1
    output wire [5:0] led
);
    
    reg [24:0] reduceTiming;
    always @(posedge clk) begin
        reduceTiming <= reduceTiming +1;
    end

    always @(posedge reduceTiming[24]) begin
        
    end

endmodule