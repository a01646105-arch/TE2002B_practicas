module BCD_module(
    input [3:0] BCD_in,
    output reg [6:0] BCD_out
);

always @(*)
    begin
        case(BCD_in) //     gfed_cba
            0: BCD_out = 7'b1000_000; // Las señales del display de 7 segmentos están invertidas
            1: BCD_out = 7'b1111_001;
            2: BCD_out = 7'b0100_100; 
            3: BCD_out = 7'b0110_000; 
            4: BCD_out = 7'b0011_001;
            5: BCD_out = 7'b0010_010;
            6: BCD_out = 7'b0000_010;
            7: BCD_out = 7'b1111_000;
            8: BCD_out = 7'b0000_000;
            9: BCD_out = 7'b0011_000;
            default: BCD_out = 7'b1111_111;
        endcase
    end

endmodule