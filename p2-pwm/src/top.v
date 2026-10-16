module top (
    input  wire       clk,
    output wire [5:0] led
);

    // 27 MHz je moc rychlé — potřebuješ pomalejší takt pro PWM čítač.
    // Spočítej si, o kolik dělit, aby PWM frekvence vyšla 1-5 kHz
    // při 8bitovém čítači.

    // šest instancí pwm, každá s jinou hodnotou duty
    // pwm #(.WIDTH(8)) p0 (.clk(...), .duty(8'd0),   .out(led[0]));
    // ...

endmodule