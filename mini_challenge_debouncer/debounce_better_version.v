// Verilog code for button debouncing on FPGA
// debouncing module without creating another clock domain
// by using clock enable signal 
module debounce_better_version(
	input pb_1, // Señal del botón sin procesar
	input clk, // Señal de reloj
	output pb_out // Señal del botón procesada (un solo pulso dentro del periodo que se acciona el botón)
);

wire slow_clk_en; // Señal enable manejada por un contador con baja frecuencia
wire Q1, Q2, Q2_bar, Q0; // Señales del flip flop tipo D
clock_enable u1(.Clk_100M(clk), .slow_clk_en(slow_clk_en)); // Señal enable manejada por reloj (baja frecuencia)

my_dff_en d0(.DFF_CLOCK(clk), .clock_enable(slow_clk_en), .D(pb_1), .Q(Q0));

my_dff_en d1(.DFF_CLOCK(clk), .clock_enable(slow_clk_en), .D(Q0), .Q(Q1)); // Primer flip flop
my_dff_en d2(.DFF_CLOCK(clk), .clock_enable(slow_clk_en), .D(Q1), .Q(Q2)); // Segundo flip flop

assign Q2_bar = ~Q2; // Se asigna la señal negada del segundo flip flop

assign pb_out = Q2; // Se asigna el pulso de la señal procesada del botón

endmodule