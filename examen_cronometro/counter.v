module counter(
	input clk_1ms,
	input rst,
	input enable,			 // Para parar o reanudar la cuenta
	output reg [12:0] sec,
	output reg [6:0] ms	 // unidad de la cuenta en milisegundos
);

// Logica para el contador de milisegundos
always @(posedge clk_1ms or posedge rst) begin
	if(rst)
		ms <= 0;
	else if(enable) begin
		if(ms >= 99)
			ms <= 0;
		else
			ms <= ms + 1;
	end 
	else
		ms <= ms;
end


// Logica para el contador de segundos
always @(posedge clk_1ms or posedge rst) begin
	if(rst)
		sec <= 0;
	else if(enable) begin
		if(sec >= 5_999)
			sec <= 0;
		else
			sec <= sec + 1;
	end 
	else
		sec <= sec;
end


endmodule