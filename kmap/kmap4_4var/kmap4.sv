// HDLBits: 4-variable K-map (kmap4) — with don't-cares
// https://hdlbits.01xz.net/wiki/kmap4
// Don't cares allow further simplification.
// Standard simplified answer: out = ~b&~c | ~a&~d | b&c&d
module kmap4(
    input  logic a, b, c, d,
    output logic out
);
    assign out = (~b & ~c) | (~a & ~d) | (b & c & d);
endmodule
