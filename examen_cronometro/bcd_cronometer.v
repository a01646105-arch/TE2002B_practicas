module bcd_cronometer(
	input [12:0] sec, // 0-5999 milisegundos
	input [6:0] ms, // 0-59 milisegundos
	output [6:0] s_un, s_de,
	output [6:0] ms_un, ms_de
);


// Definir entradas del modulo BCD de los digitos de segundos
wire [3:0] s_unit, s_dec;


// Definir entradas del modulo BCD de los digitos de milisegundos
wire [3:0] ms_unit, ms_dec;

// Dividir la entrada de sec de milisegundos a segundos
wire [5:0] seconds;

assign seconds = sec / 100;


// Asignacion de cada digito de los segundos
assign s_unit = seconds % 10;
assign s_dec = (seconds / 10) % 10;


// Asignacion de cada digito de los milisegundos
assign ms_unit = ms % 10;
assign ms_dec = (ms / 10) % 10;


// Instanciacion de displays para mostrar segundos
bcd_module sec_unit(.bcd_in(s_unit), .bcd_out(s_un));
bcd_module sec_dec(.bcd_in(s_dec), .bcd_out(s_de));


// Instanciacion de displays para mostrar milisegundos
bcd_module milisec_unit(.bcd_in(ms_unit), .bcd_out(ms_un));
bcd_module milisec_dec(.bcd_in(ms_dec), .bcd_out(ms_de));

endmodule