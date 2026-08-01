module top_module(
	input too_cold, 
	input too_hot,
	input mode,
	input fan_on,
	output heater,
	output aircon,
	output fan
);
	// reminder: The order in which you write assign statements doesn't matter. 

	assign fan = heater | aircon | fan_on;
	assign heater = (mode & too_cold);
	assign aircon = (~mode & too_hot);
		
endmodule
