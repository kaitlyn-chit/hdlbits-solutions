module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c, d, e;
    wire [15:0] f, g;
    add16 u1 (a[15:0], b[15:0], 0, sum[15:0], c);
    add16 u2 (a[31:16], b[31:16], 0, f, d);
    add16 u3 (a[31:16], b[31:16], 1, g, e);

    assign sum[31:16] = c ? g : f;

endmodule