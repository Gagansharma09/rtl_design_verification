// HDLBits: DFF with synchronous active-high reset
// https://hdlbits.01xz.net/wiki/dff8r
module dff8r(
    input  logic       clk, reset,
    input  logic [7:0] d,
    output logic [7:0] q
);
    always_ff @(posedge clk)
        if (reset) q <= 8'h00;
        else       q <= d;
endmodule
