// HDLBits: DFF with asynchronous active-high reset
// https://hdlbits.01xz.net/wiki/dff8ar
module dff8ar(
    input  logic       clk, areset,
    input  logic [7:0] d,
    output logic [7:0] q
);
    always_ff @(posedge clk or posedge areset)
        if (areset) q <= 8'h00;
        else        q <= d;
endmodule
