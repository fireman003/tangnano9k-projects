module regbus (
    input  wire       clk,
    input  wire [7:0] rx_data,
    input  wire       rx_valid,
    output reg  [7:0] tx_data,
    output reg        tx_start,
    input  wire       tx_busy,
    output wire [7:0] reg0,    // vybrana adresa
    output wire [7:0] reg1
);

    reg incomingByte = 0;

    reg [7:0]memory[7:0];
    reg [3:0]currentAddres = 0; 
    reg readReg = 0;
     

    always @(posedge clk) begin
        tx_start <= 0;

        if(rx_valid) begin
            if(rx_data - 49 == 8 && incomingByte == 0) begin 
                readReg <= 1;
            end else if(incomingByte == 0 && readReg == 0) begin
                currentAddres <= rx_data - 49;
            end else if(incomingByte == 1 && readReg == 1) begin 
                readReg <= 0;

                if (!tx_busy) begin
                    tx_data <= memory[rx_data - 49];
                    tx_start <= 1;
                end

            end else begin
                memory[currentAddres] <= rx_data;
            end
            
            incomingByte <= incomingByte + 1;
        end
    end

    assign reg0 = currentAddres;

endmodule   