// Fixed version
module mux(
    input  logic sel, a, b,
    output logic out
);
    assign out = sel ? b : a;
endmodule
