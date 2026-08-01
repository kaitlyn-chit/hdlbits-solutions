module top_module (
	input [1023:0] in,
	input [7:0] sel,
	output [3:0] out
);

    assign out = in[sel*4 +: 4];		
    // select starting at index "sel*4", then select a total width of 4 bits with increasing (+:) index number
	// assign out = in[sel*4+3 -: 4];	width must must be constant


endmodule
