// HDLBits: D Latch
// https://hdlbits.01xz.net/wiki/exams/m2014_q4a
module top_module(
    input  logic d, ena,
    output logic q
);
    always_latch
        if (ena) q = d;
endmodule
