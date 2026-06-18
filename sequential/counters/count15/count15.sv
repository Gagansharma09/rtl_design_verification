// HDLBits: Four-bit binary counter (0 to 15)
// https://hdlbits.01xz.net/wiki/count15
module count15(
    input  logic       clk, reset,
    output logic [3:0] q
);
    always_ff @(posedge clk)
        if (reset) q <= 4'd0;
        else       q <= q + 4'd1;
endmodule
