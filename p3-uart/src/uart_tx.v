module uart_tx #(
    parameter CLK_HZ    = 27_000_000,
    parameter BAUD      = 115200
)(
    input  wire       clk,
    input  wire       start,      // puls na 1 takt = pošli
    input  wire [7:0] data,       // co poslat
    output reg        tx = 1'b1,         // na pin
    output reg        busy = 1'b0     // 1 když se vysílá
);


reg [7:0] counter = 0;
reg [4:0] bit_id = 0; // 7 - 111

always @(posedge clk) begin

    if (start == 1) begin
        busy <= 1;
        tx <= 0;
        bit_id <= 0;
        counter <= 1;
    end else if(busy == 1 ) begin
        counter <= counter +1;
        if (counter[7:0] == 233) begin
            counter <= 0;
            if(bit_id <= 7) begin
                tx <= data[bit_id];
                bit_id <= bit_id + 1;
            end else if(bit_id == 8) begin 
                tx <= 1;
                bit_id <= bit_id + 1;
            end else begin
                busy <= 0;
            end
        end
    end 
end

endmodule