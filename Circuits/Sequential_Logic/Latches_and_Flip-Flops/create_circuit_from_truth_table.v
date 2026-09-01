module method1 (
    input clk,
    input j, //set (1)
    input k, //reset (0)
    output Q); 

    always @(posedge clk) begin
        if (j) begin
            if (k)
                Q <= ~Q;
            else
                Q <= 1;
        end else begin
            if (k)
                Q <= 0;
        end
    end

// JK flip-flop gives control to hold, set, reset, or toggle a stored bit
// characteristic equation Q <= (j & ~Q) | (~k & Q)

endmodule

module method2 (
    input clk,
    input j,
    input k,
    output reg Q
); 

    always @(posedge clk) begin
        case ({j, k})
            2'b00: Q <= Q;   // Hold
            2'b01: Q <= 0;   // Reset
            2'b10: Q <= 1;   // Set
            2'b11: Q <= ~Q;  // Toggle
        endcase
    end

endmodule