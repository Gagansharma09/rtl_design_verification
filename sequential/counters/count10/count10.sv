// HDLBits: Decade counter (0 to 9)
// https://hdlbits.01xz.net/wiki/count10
module count10(
    input  logic       clk, reset,
    output logic [3:0] q
);
    always_ff @(posedge clk)
        if (reset || q == 4'd9) q <= 4'd0;
        else                    q <= q + 4'd1;
endmodule
