module cronometer(
	input clk, rst,
	input enable,
	output [6:0] s_un, s_de,
	output [6:0] ms_un, ms_de
);


// Definir variable para senal de reloj dividida
wire clk_1ms;

// Produce una senal de reloj de 1000 Hz (1 ms o 0.01 s)
clock_divider clk_div_1ms(
	.clk(clk),
	.rst(rst),
	.clk_div(clk_1ms)
);


// Definir variables con la cuenta del cronometro
wire [12:0] sec;
wire [6:0] ms;

// Cuenta de 1 milisegundo
counter count_1ms(
	.clk_1ms(clk_1ms),
	.rst(rst),
	.enable(enable),
	.sec(sec),
	.ms(ms)
);


// Desplegar cronometro en displays de 7 segmentos
bcd_cronometer cronometer_disp(
	.sec(sec),
	.ms(ms),
	.s_un(s_un),
	.s_de(s_de),
	.ms_un(ms_un),
	.ms_de(ms_de)
);



endmodule