// HDLBits: Mux and DFF (mt2015)
// https://hdlbits.01xz.net/wiki/mt2015_muxdff
module top_module(
    input  logic clk, L, r_in, q_in,
    output logic Q
);
    logic d_in;
    assign d_in = L ? r_in : q_in;
    always_ff @(posedge clk) Q <= d_in;
endmodule
