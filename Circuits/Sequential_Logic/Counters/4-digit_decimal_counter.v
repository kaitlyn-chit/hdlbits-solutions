module first_attempt (
    input clk,
    input reset,   // synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
            q <= '0;
            ena <= '0;
        end else begin
            
            ena[1] <= (q[3:0]==8) ? 1 : 0;
            q[3:0] <= (q[3:0]==9) ? 0 : q[3:0] + 1;
            
            ena[2] <= (q[7:4]==9 && q[3:0]==8) ? 1 : 0;
            q[7:4] <= (ena[1]) ? ((q[7:4]==9) ? 0 : q[7:4]+1) : ((q[3:0]==9) ? q[7:4]+1 : q[7:4]);
            
            ena[3] <= (q[11:8]==9 && q[7:4]==9 && q[3:0]==8) ? 1 : 0;
            q[11:8] <= (ena[2]) ? ((q[11:8]==9) ? 0 : q[11:8]+1): ((q[7:4]==9 && q[3:0]==9) ? q[11:8]+1 : q[11:8]);
            
            q[15:12] <= (ena[3]) ? ((q[15:12]==9) ? 0 : q[15:12] + 1) : q[15:12];
        end
    end
            
        
endmodule


module improved_version (
    input clk,
    input reset,   // synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);

    // combinational enable signals for upper digits
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[7:4] == 4'd9) && ena[1];
    assign ena[3] = (q[11:8] == 4'd9) && ena[2];

    // ones digit is always enabled
    bcd_digit d0 (clk, reset, 1'b1,   q[3:0]);
    // upper digits are enabled based on enable signals
    bcd_digit d1 (clk, reset, ena[1], q[7:4]);
    bcd_digit d2 (clk, reset, ena[2], q[11:8]);
    bcd_digit d3 (clk, reset, ena[3], q[15:12]);

endmodule

// helper module for a single digit (0–9 counter)
module bcd_digit (
    input clk,
    input reset,
    input ena,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'd0;
        else if (ena) begin
            if (q == 4'd9)
                q <= 4'd0;
            else
                q <= q + 1'b1;
        end
    end
endmodule
