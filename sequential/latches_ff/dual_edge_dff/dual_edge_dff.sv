// HDLBits: Dual-edge triggered flip-flop (no direct synthesis support)
// https://hdlbits.01xz.net/wiki/dualedge
// Emulate with two FFs and a mux
module dual_edge_dff(
    input  logic clk, d,
    output logic q
);
    logic q_pos, q_neg;
    always_ff @(posedge clk) q_pos <= d;
    always_ff @(negedge clk) q_neg <= d;
    assign q = clk ? q_pos : q_neg;
endmodule
