// HDLBits: Half Adder
// https://hdlbits.01xz.net/wiki/hadd
module half_adder(
    input  logic a, b,
    output logic sum, cout
);
    assign sum  = a ^ b;
    assign cout = a & b;
endmodule
