module top_module(
	input x,
	input y,
	output z);

	wire w1, w2, w3, w4;
	
	A ia1 (x, y, w1);
	B ib1 (x, y, w2);
	A ia2 (x, y, w3);
	B ib2 (x, y, w4);
	
	assign z = (w1 | w2) ^ (w3 & w4);

endmodule


module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule
