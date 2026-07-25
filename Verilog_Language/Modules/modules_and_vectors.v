module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

    wire [7:0] w1, w2, w3;		
	
    my_dff8 d1 ( clk, d, w1 );
    my_dff8 d2 ( clk, w1, w2 );
    my_dff8 d3 ( clk, w2, w3 );

    always @(*)		// combinational always block
		case(sel)
			0: q = d;
			1: q = w1;
			2: q = w2;
			3: q = w3;
		endcase

endmodule