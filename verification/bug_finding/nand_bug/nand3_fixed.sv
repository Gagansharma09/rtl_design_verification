module nand3(
    input  logic a, b, c,
    output logic out
);
    assign out = ~(a & b & c);
endmodule
