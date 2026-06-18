// HDLBits: Counter 1000 (0 to 999)
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q7b
module top_module(
    input  logic        clk, reset,
    output logic        c_enable, c_load, c_d,
    output logic [9:0]  q
);
    always_ff @(posedge clk)
        if (reset || q == 10'd999) q <= 10'd0;
        else                       q <= q + 10'd1;
    assign c_enable = 1'b1;
    assign c_load   = reset | (q == 10'd999);
    assign c_d      = 1'b0;
endmodule
