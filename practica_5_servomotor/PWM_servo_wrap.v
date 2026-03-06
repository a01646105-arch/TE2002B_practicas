module PWM_servo_wrap(
	input CLOCK_50,
	input [9:0] SW,
	output [5:0] GPIO,
	output [6:0] HEX0, HEX1, HEX2
);

wire [8:0] SW_raw;
wire [8:0] SW_limited;

assign SW_raw = SW[9:1];
assign SW_limited = (SW_raw > 180) ? 180 : SW_raw; 

PWM_servo WRAP(
	.clk(CLOCK_50),
	.rst(SW[0]),
	.SW(SW_limited),
	.PWM_out(GPIO[0]),
	.D_un(HEX0),
	.D_de(HEX1),
	.D_ce(HEX2)
);

endmodule