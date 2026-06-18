// HDLBits: Minimum SOP and POS
// https://hdlbits.01xz.net/wiki/exams/ece241_2013_q2
module top_module(
    input  logic a, b, c, d,
    output logic y, x
);
    // SOP (y): minterms from problem  -> y = ~c&~b | a&c | b&c&~a
    // POS (x): maxterms from problem  -> x = (a|b|~c)&(~b|c)&(a|~c)&(b|~a)
    assign y = (~c & ~b) | (a & c) | (b & c & ~a);
    assign x = (a|b|~c) & (~b|c) & (a|~c) & (b|~a|d); // verify with HDLBits — adjust if needed
endmodule
