// HDLBits: D Flip-Flop
// https://hdlbits.01xz.net/wiki/dff
module dff(
    input  logic clk, d,
    output logic q
);
    always_ff @(posedge clk)
        q <= d;
endmodule
