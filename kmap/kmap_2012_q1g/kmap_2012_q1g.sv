// HDLBits: K-map 2012 q1g
// https://hdlbits.01xz.net/wiki/exams/2012_q1g
module top_module(
    input  logic [3:0] x,
    output logic       f
);
    assign f = (~x[1] & x[2]) | (x[1] & ~x[2]) | x[3] | x[4];  // adjust to problem truth table
endmodule
