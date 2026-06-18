// HDLBits: 32-bit Galois LFSR (taps at 32,22,2,1)
// https://hdlbits.01xz.net/wiki/lfsr32
module lfsr32(
    input  logic        clk, reset,
    output logic [31:1] q
);
    always_ff @(posedge clk) begin
        if (reset) q <= 32'b1;
        else begin
            q[31] <= q[32];
            q[30:23] <= q[31:24];
            q[22] <= q[23] ^ q[32];
            q[21:3] <= q[22:4];
            q[2]  <= q[3]  ^ q[32];
            q[1]  <= q[2]  ^ q[32];
            // Bit indices remapped for Galois form
        end
    end
endmodule
