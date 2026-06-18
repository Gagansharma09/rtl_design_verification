// HDLBits: Counter with period 1000
// https://hdlbits.01xz.net/wiki/exams/review2015_count1k
module count1k(
    input  logic        clk, reset,
    output logic [9:0]  q
);
    always_ff @(posedge clk)
        if (reset || q == 10'd999) q <= 10'd0;
        else                        q <= q + 10'd1;
endmodule
