module top_module (
    input clk,
    input d,
    output q
);
    reg Qp, Qn;

    always @(posedge clk)
        Qp <= d;
    always @(negedge clk)
        Qn <= d;
    
    assign q = clk ? Qp : Qn;

endmodule