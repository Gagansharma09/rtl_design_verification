// HDLBits: 4-digit decimal counter
// https://hdlbits.01xz.net/wiki/countbcd
module countbcd(
    input  logic        clk, reset,
    output logic [15:0] q,
    output logic [3:0]  ena
);
    // ena[i] = 1 when digit i should increment
    assign ena[0] = 1'b1;
    assign ena[1] = (q[3:0]   == 4'd9);
    assign ena[2] = (q[7:4]   == 4'd9) && ena[1];
    assign ena[3] = (q[11:8]  == 4'd9) && ena[2];

    bcd_digit d0(.clk,.reset,.ena(ena[0]),.q(q[3:0]));
    bcd_digit d1(.clk,.reset,.ena(ena[1]),.q(q[7:4]));
    bcd_digit d2(.clk,.reset,.ena(ena[2]),.q(q[11:8]));
    bcd_digit d3(.clk,.reset,.ena(ena[3]),.q(q[15:12]));
endmodule

module bcd_digit(
    input  logic       clk, reset, ena,
    output logic [3:0] q
);
    always_ff @(posedge clk)
        if      (reset)        q <= 4'd0;
        else if (ena && q==9)  q <= 4'd0;
        else if (ena)          q <= q + 4'd1;
endmodule
