// HDLBits: Detect both edges (any change)
// https://hdlbits.01xz.net/wiki/edgedetect2
module edge_detect2(
    input  logic       clk,
    input  logic [7:0] in,
    output logic [7:0] anyedge
);
    logic [7:0] prev;
    always_ff @(posedge clk) begin
        anyedge <= in ^ prev;  // 1 on any transition
        prev    <= in;
    end
endmodule
