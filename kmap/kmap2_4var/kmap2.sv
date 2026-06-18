// HDLBits: 4-variable K-map (kmap2)
// https://hdlbits.01xz.net/wiki/kmap2
// Minterms: 0,1,2,3,4,5,6,7,8,10,11,14,15
// Simplified: out = ~a | ~b | c&d | ~c&~d  =>  ~a|~b|~(c^d)
module kmap2(
    input  logic a, b, c, d,
    output logic out
);
    assign out = ~a | ~b | ~(c ^ d);
endmodule
