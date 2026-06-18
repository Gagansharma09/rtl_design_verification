// HDLBits: 3-bit LFSR
// https://hdlbits.01xz.net/wiki/mt2015_lfsr
// Polynomial: x^3 + x^2 + 1 => Galois taps at 3,2
module lfsr3(
    input  logic       clk, reset,
    output logic [2:0] q
);
    always_ff @(posedge clk) begin
        if (reset) q <= 3'b001;
        else begin
            q[2] <= q[0];
            q[1] <= q[2] ^ q[0];
            q[0] <= q[1];
        end
    end
endmodule
