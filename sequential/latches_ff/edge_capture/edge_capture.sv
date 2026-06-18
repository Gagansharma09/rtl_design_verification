// HDLBits: Edge capture register (1→0 transition, sticky until reset)
// https://hdlbits.01xz.net/wiki/edgecapture
module edge_capture(
    input  logic        clk, reset,
    input  logic [31:0] in,
    output logic [31:0] out
);
    logic [31:0] prev;
    always_ff @(posedge clk) begin
        if (reset)      out <= 32'h0;
        else            out <= out | (prev & ~in);   // set on 1→0, sticky
        prev <= in;
    end
endmodule
