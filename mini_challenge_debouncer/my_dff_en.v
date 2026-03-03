// D-flip-flop with clock enable signal for debouncing module 
module my_dff_en(
	input DFF_CLOCK, 
	input clock_enable, 
	input D, // Señal de dato
	output reg Q = 0 // Señal de salida
);
    
always @ (posedge DFF_CLOCK) begin
	if(clock_enable==1) 
		Q <= D; 
end


endmodule