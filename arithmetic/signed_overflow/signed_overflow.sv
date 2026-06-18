// HDLBits: Signed Addition Overflow
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q1c
// overflow when adding two numbers of same sign produces opposite sign result
module signed_overflow(
    input  logic [7:0] a, b,
    output logic       s,       // sign of result
    output logic       overflow
);
    logic [7:0] sum;
    assign sum      = a + b;
    assign s        = sum[7];
    // overflow: both positives sum to negative, or both negatives sum to positive
    assign overflow = (~a[7] & ~b[7] &  sum[7])
                    | ( a[7] &  b[7] & ~sum[7]);
endmodule
