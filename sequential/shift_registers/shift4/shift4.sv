// HDLBits: 4-bit shift register with asynchronous reset, synchronous load, enable
// https://hdlbits.01xz.net/wiki/shift4
module shift4(
    input  logic       clk, areset, load, ena,
    input  logic [3:0] data,
    output logic [3:0] q
);
    always_ff @(posedge clk or posedge areset)
        if      (areset) q <= 4'd0;
        else if (load)   q <= data;
        else if (ena)    q <= {1'b0, q[3:1]};   // right shift, MSB=0
endmodule
