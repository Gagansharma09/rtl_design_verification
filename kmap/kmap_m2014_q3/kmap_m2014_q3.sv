// HDLBits: K-map m2014_q3
// https://hdlbits.01xz.net/wiki/exams/m2014_q3
module top_module(
    input  logic [4:1] x,
    output logic       f
);
    // From K-map: f = ~x[1]&x[3] | x[1]&~x[3] | x[2]&x[4] | ~x[2]&~x[4]
    assign f = (~x[1] & x[3]) | (x[1] & ~x[3]) | (x[2] & x[4]) | (~x[2] & ~x[4]);
endmodule
