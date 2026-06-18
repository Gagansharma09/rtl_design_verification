// HDLBits: Sequential circuit 10 — reverse-engineered from waveform
// https://hdlbits.01xz.net/wiki/sim/circuit10
module circuit10(
    input  logic clk, a, b,
    output logic q
);
    // TODO: Derive from HDLBits waveform simulation
    // Placeholder — update after analysis
    always_ff @(posedge clk)
        q <= a ^ b;  // example pattern
endmodule
