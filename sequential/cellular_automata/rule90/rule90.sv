// HDLBits: Rule 90 (1D cellular automaton)
// https://hdlbits.01xz.net/wiki/rule90
// next[i] = left[i-1] XOR right[i+1]
// Boundaries: 0 outside array edges
module rule90(
    input  logic        clk, load,
    input  logic [511:0] data,
    output logic [511:0] q
);
    always_ff @(posedge clk) begin
        if (load) q <= data;
        else begin
            q[0]   <= q[1];             // left of 0 is 0 (boundary)
            q[511] <= q[510];           // right of 511 is 0 (boundary)
            for (int i = 1; i < 511; i++)
                q[i] <= q[i-1] ^ q[i+1];
        end
    end
endmodule
