module top_module (
	input [15:0] in,
	output [7:0] out_hi,
	output [7:0] out_lo
);
	
	assign out_hi = in[15:8];
	assign out_lo = in[7:0];
		
endmodule

// Unpacked vs. Packed Arrays
//        packed    name    unpacked
//  reg    [7:0]     mem     [255:0];

// 256 memory locations (words), Each word is 8 bits wide
