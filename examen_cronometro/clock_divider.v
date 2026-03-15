module clock_divider #(parameter FREQ = 1000) (
	input clk, rst,
	output reg clk_div
);

reg [31:0] count;

parameter CLK_FPGA = 50_000_000;
parameter MaxCount = CLK_FPGA / (2 * FREQ);

// Logica para el contador de la señal de reloj
always @(posedge clk or posedge rst) begin
	if (rst)
		count <= 0;
	else if (count >= MaxCount - 1)
		count <= 0;
	else 
		count <= count + 1;
end

// Logica para la señal de reloj
always @(posedge clk or posedge rst) begin
	if (rst)
		clk_div <= 0;
	else if (count >= MaxCount - 1)
		clk_div <= ~clk_div;
	else
		clk_div <= clk_div;
end

	
endmodule