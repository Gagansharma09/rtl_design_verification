// HDLBits: Adder (m2014 q4j) — implement a 1-bit full adder
// https://hdlbits.01xz.net/wiki/exams/m2014_q4j
module full_adder(
    input  logic a, b, cin,
    output logic sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
