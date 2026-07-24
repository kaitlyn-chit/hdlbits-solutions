module top_module(input a, input b, output out );
    
    assign out = ~(a|b);
    // verilog has separate bitwise-OR (|) and logical-OR (||) operators

endmodule