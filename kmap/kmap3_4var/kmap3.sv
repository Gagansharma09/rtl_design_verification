// HDLBits: 4-variable K-map (kmap3)
// https://hdlbits.01xz.net/wiki/kmap3
// Standard answer: out = a&c | a&~b | ~a&b&~d | ~b&~c
module kmap3(
    input  logic a, b, c, d,
    output logic out
);
    assign out = (a & c) | (a & ~b) | (~a & b & ~d) | (~b & ~c);
endmodule
