module PWM_servo #(
	parameter CLK_FREQ = 5_000_000, // 5 MHz
	parameter PWM_FREQ = 50 // 50 Hz
) (
	input clk, rst,
	input [8:0] SW,
	output PWM_out,
	output [6:0] D_un, D_de, D_ce
);

// Definir parametros internos/locales
parameter C = CLK_FREQ / PWM_FREQ; // ~100,000
parameter B = ceillog2(C);
parameter D_min = (2**B - 1) * 5 / 100;
parameter D_max = (2**B - 1) * 10 / 100;
parameter CMIN = C * D_min;
parameter CMAX = C * D_max;

// Clock divider (frecuencia inicial -> 5 MHz)
wire clk_div;
clk_divider #(.FREQ(CLK_FREQ)) CLOCK_DIV(
	.CLK(clk),
	.RST(rst),
	.clk_div(clk_div)
);

// Contador (la cuenta se calcula tomando en cuenta los 50 Hz deseados)
wire [B-1:0] servo_count;
counter #(
	.ConstantNumber(C), 
	.B(B-1)
) Contador(
	.clk(clk_div),
	.rst(rst),
	.count(servo_count)
);

// Comparador
comparator #(
	.B(B-1)
) Comparador(
	.count(servo_count),
	.SW(SW),
	.pwm(PWM_out)
);

// Mostrar el input de los switches en las pantallas de siete segmentos
BCD_3displays #(.N_in(B)) DISPLAY(
	.bcd_in(SW),
	.D_un(D_un),
	.D_de(D_de),
	.D_ce(D_ce)
);


// Función para obtener cantidad de bits para representar cierta cantidad
function integer ceillog2;
	input integer data;
	integer i,result;
	begin
		for(i=0; 2**i < data; i=i+1)
			result = i + 1;
		ceillog2 = result;
   end
endfunction


endmodule