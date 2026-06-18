// HDLBits: 16-bit DFF with byte enable (active-high)
// https://hdlbits.01xz.net/wiki/dff16e
module dff16e(
    input  logic        clk, resetn, byteena,
    input  logic [15:0] d,
    output logic [15:0] q
);
    always_ff @(posedge clk)
        if (~resetn)       q <= 16'h0000;
        else if (byteena)  q <= d;
    // If byteena=0, hold q
endmodule
