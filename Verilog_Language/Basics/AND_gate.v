module top_module(input a, input b, output out );
    
    assign out = a & b;
    // verilog has separate bitwise-AND (&) and logical-AND (&&) operators

endmodule