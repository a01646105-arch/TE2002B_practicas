module BCD_3displays #(parameter N_in = 17, N_out = 7)(
    input [N_in-1:0] bcd_in,
    output [N_out-1:0] D_un, D_de, D_ce // Por convención, las señales del display de 7 segmentos empieza con el segmento 0
);

wire [3:0] unidades, decenas, centenas;

assign unidades = bcd_in % 10;
assign decenas = (bcd_in / 10) % 10;
assign centenas = (bcd_in / 100) % 10;

BCD_module bcd_unidades(.BCD_in(unidades), .BCD_out(D_un));

BCD_module bcd_decenas(.BCD_in(decenas), .BCD_out(D_de));

BCD_module bcd_centenas(.BCD_in(centenas), .BCD_out(D_ce));

endmodule