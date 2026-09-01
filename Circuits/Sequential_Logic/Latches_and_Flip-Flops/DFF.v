// exercise 1
module top_module (
    input clk,
    input d, 
    input ar,   
    output q);

    always @(posedge clk, posedge ar) begin
        if (ar)
            q <= 1'b0;
        else 
            q <= d;
    end

endmodule

// exercise 2
module top_module (
    input clk,
    input d, 
    input r,   
    output q);

    always @(posedge clk) begin
        if (r)
            q <= 1'b0;
        else
            q <= d;
    end
    

endmodule
