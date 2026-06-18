// HDLBits: DFF with synchronous reset, reset value = 0x34
// https://hdlbits.01xz.net/wiki/dff8p
module dff8p(
    input  logic       clk, reset,
    input  logic [7:0] d,
    output logic [7:0] q
);
    always_ff @(posedge clk)
        if (reset) q <= 8'h34;
        else       q <= d;
endmodule
