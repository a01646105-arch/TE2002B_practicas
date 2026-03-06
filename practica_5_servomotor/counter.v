module counter #(parameter ConstantNumber = 100_000, B = 17) (
	input clk, rst,
	output reg [B:0] count // B ya es considerado base-1
);

always @(posedge clk or posedge rst) begin
	if(rst)
		count <= 0;
	else if(count >= ConstantNumber-1)
		count <= 0;
	else
		count <= count + 1;
end

endmodule