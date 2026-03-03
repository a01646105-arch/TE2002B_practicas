// Slow clock enable for debouncing button (400 Hz)
module clock_enable(
	input Clk_100M, // Señal de reloj 
	output slow_clk_en // Señal enable
);
    
reg [26:0] counter = 0; // Contador de 27 bits
    
always @(posedge Clk_100M) begin
	counter <= (counter>=249_999)?0:counter+1; // Se reinicia el contador o incrementa por una unidad
end
											// Cambiar cuenta a 10 para hacer el testbench
assign slow_clk_en = (counter == 249_999)?1'b1:1'b0; // Señal enable es 1 cuando el contador llega al máximo

endmodule