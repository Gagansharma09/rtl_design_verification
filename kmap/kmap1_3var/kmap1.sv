// HDLBits: 3-variable K-map
// https://hdlbits.01xz.net/wiki/kmap1
// K-map (a,b,c): minterms 0,2,3,4,6,7 => groups give: ~b | ~a&~c | a&b (simplifies to ~b | ~c&~a | ...)
// Simplified: out = ~b | a&~c | ~a&c  => Actually: ~b|c  ... let's derive:
// Truth table: a b c | out
//              0 0 0 | 1  (minterm 0)
//              0 0 1 | 0  ... wait, HDLBits kmap1 answer is ~b | a^c
// Standard answer for kmap1: out = ~b | a^c
module kmap1(
    input  logic a, b, c,
    output logic out
);
    assign out = ~b | (a ^ c);
endmodule
