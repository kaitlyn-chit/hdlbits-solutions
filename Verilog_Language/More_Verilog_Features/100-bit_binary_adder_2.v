module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar i;
    generate
        for(i = 0; i < 100; i++) begin : gen_fadd
            if(i == 0)
                fadd fadd_inst (a[0], b[0], cin, cout[0], sum[0]);
            else
                fadd fadd_inst (a[i], b[i], cout[i-1], cout[i], sum[i]);
        end
    endgenerate
        

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);

endmodule
