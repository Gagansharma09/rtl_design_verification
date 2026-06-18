// HDLBits: Decade counter again (1 to 10)
// https://hdlbits.01xz.net/wiki/count1to10
module count1to10(
    input  logic       clk, reset,
    output logic [3:0] q
);
    always_ff @(posedge clk)
        if (reset || q == 4'd10) q <= 4'd1;
        else                     q <= q + 4'd1;
endmodule
