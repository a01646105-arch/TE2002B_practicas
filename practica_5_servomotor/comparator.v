module comparator #(parameter B = 17) (
	input [B:0] count,
	input [8:0] SW,
	output reg pwm
);

// Define DUTY wire
reg [B:0] DUTY;

always @(*) begin
	
	// Calculate DUTY
	// DUTY = 5_000; // Hardcode for debugging
	
	// DUTY = ((250/9)*SW) + 5_000; // Change slope values and y-intercept to see which values make the servo work. FOR TOMORROW MORNING
	DUTY = ((500/9)*SW) + 2_500;

	if(count < DUTY)
		pwm = 1;
	else
		pwm = 0;
end	

endmodule