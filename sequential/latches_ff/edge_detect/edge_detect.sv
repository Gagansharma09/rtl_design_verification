// HDLBits: Detect rising edge (0→1 transition)
// https://hdlbits.01xz.net/wiki/edgedetect
module edge_detect(
    input  logic       clk,
    input  logic [7:0] in,
    output logic [7:0] pedge
);
    logic [7:0] prev;
    always_ff @(posedge clk) begin
        pedge <= in & ~prev;   // 1 only on rising edge
        prev  <= in;
    end
endmodule
