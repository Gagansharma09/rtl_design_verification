// HDLBits: 8 D Flip-Flops
// https://hdlbits.01xz.net/wiki/dff8
module dff8(
    input  logic       clk,
    input  logic [7:0] d,
    output logic [7:0] q
);
    always_ff @(posedge clk)
        q <= d;
endmodule
