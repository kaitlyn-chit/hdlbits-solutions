// exercise 1
module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @(posedge clk) begin
        Q <= L ? r_in : q_in;
    end

endmodule

// exercise 2
module top_module (input clk,
    input w, R, E, L,
    output Q
);

    always @(posedge clk)
        if (L)
            Q <= R;
        else if (E)
            Q <= w;
        
endmodule