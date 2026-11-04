    module uart_rx #(
        parameter CLK_HZ    = 27_000_000,
        parameter BAUD      = 115200
    )(
        input  wire       clk,
        input  wire       rx,         // z pinu
        output reg  [7:0] data,       // přijatý bajt
        output reg        valid       // puls na 1 takt když je data platné
    );

        reg [7:0] counter = 0;
        reg [4:0] bit_id = 0;
        reg busy = 0;

        reg rx_sync = 0;
        reg rx_reg = 0;

        always @(posedge clk) begin
            counter <= counter + 1;
            valid <= 0;
            rx_sync <= rx;     // Navzorkujeme aktuální stav pinu
            rx_reg  <= rx_sync; 

            if (rx_reg == 1 && rx_sync == 0 && busy == 0) begin
                busy <= 1;
                counter <= 0;
                bit_id <= 0;
            end else if (busy == 1 && bit_id == 0 && counter == 351) begin
                data[bit_id] <= rx_reg;
                bit_id <= bit_id + 1;
                counter <= 0;
            end else if (busy == 1 && counter == 233) begin

                if(bit_id <= 7) begin
                    data[bit_id] <= rx_reg;
                    bit_id <= bit_id + 1;
                end else begin 
                    valid <= 1;
                    busy <= 0;
                end

                counter <= 0;
            end

        end

    endmodule