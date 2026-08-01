module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    genvar i;
    generate
        for(i = 0; i < 3; i++) begin : fadd_inst
            if(i == 0)
                fadd fa(a[0], b[0], cin, cout[i], sum[i]);
            else
				fadd fa(a[i], b[i], cout[i-1], cout[i], sum[i]);
        end
    endgenerate

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);

endmodule

