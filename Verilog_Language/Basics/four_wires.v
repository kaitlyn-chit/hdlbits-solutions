module top_module(input a,b,c, output w,x,y,z );

    assign w = a;
	assign x = b;
	assign y = b;
	assign z = c;

	// a single driver drives a wire, and that wire can then drive (or feed into) many outputs

endmodule