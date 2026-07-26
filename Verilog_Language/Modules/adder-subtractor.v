module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b2;
    assign b2 = b^{32{sub}};
    wire c;
    add16 u1 (a[15:0], b2[15:0], sub, sum[15:0], c);
    add16 u2 (a[31:16], b2[31:16], c, sum[31:16]);
endmodule
