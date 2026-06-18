// HDLBits: 5-bit Galois LFSR (taps at bit 5 and 3)
// https://hdlbits.01xz.net/wiki/lfsr5
// Polynomial: x^5 + x^3 + 1 => taps 5,3 (1-indexed)
module lfsr5(
    input  logic       clk, reset,
    output logic [4:1] q
);
    always_ff @(posedge clk) begin
        if (reset) q <= 5'b1_0000;
        else begin
            q[4] <= q[5];
            q[3] <= q[4] ^ q[5];
            q[2] <= q[3];
            q[1] <= q[2];
            // Galois: XOR at taps 5 and 3 (positions 5 and 3)
        end
    end
endmodule
