module top (
    input  wire       clk,   // 27 MHz
    input  wire       btn,   // button S1
    output reg [5:0] led
);

    reg btn1;
    reg btn2;
    
    reg [20:0] Counter;
    reg Stable;
    reg StablePrev;

    always @(posedge clk) begin
        btn1 <= btn;
        btn2 <= btn1;

        if (btn2 != Stable) begin
            Counter <= 0;
        end else begin
            Counter <= Counter + 1;
        end

        if(Counter[20]) begin
            Stable <= btn2;
        end

        if (Stable == 0 && StablePrev == 1) begin
            led <= led + 1;
        end

        StablePrev <= Stable;
    end

endmodule