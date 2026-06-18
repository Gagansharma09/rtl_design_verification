// HDLBits: Slow decade counter (slowena enables count)
// https://hdlbits.01xz.net/wiki/countslow
module countslow(
    input  logic       clk, slowena, reset,
    output logic [3:0] q
);
    always_ff @(posedge clk)
        if      (reset)               q <= 4'd0;
        else if (slowena && q == 4'd9) q <= 4'd0;
        else if (slowena)              q <= q + 4'd1;
endmodule
