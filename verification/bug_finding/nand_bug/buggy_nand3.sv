// HDLBits: Find bug in 3-input NAND
// https://hdlbits.01xz.net/wiki/bugs_nand3
// BUGGY: AND instead of NAND
module nand3(
    input  logic a, b, c,
    output logic out
);
    assign out = a & b & c;  // BUG: should be ~(a & b & c)
endmodule
