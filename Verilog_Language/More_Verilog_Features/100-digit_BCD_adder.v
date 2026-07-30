module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum 
);

    wire [99:0] cout_wire; // internal carry chain

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : gen_bcd_fadd
            if (i == 0) begin
                bcd_fadd bcd_inst (a[3:0], b[3:0], cin, cout_wire[0], sum[3:0]);
            end else begin
                bcd_fadd bcd_inst (a[4*i+3 : 4*i], b[4*i+3 : 4*i], cout_wire[i-1], cout_wire[i], sum[4*i+3 : 4*i]);
            end
        end
    endgenerate

    assign cout = cout_wire[99];

endmodule