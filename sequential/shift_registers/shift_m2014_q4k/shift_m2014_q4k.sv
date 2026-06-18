// HDLBits: Shift register (m2014 q4k)
// https://hdlbits.01xz.net/wiki/exams/m2014_q4k
// 4-bit shift register: in → q[0] → q[1] → q[2] → q[3]
module top_module(
    input  logic       clk, in, reset,
    output logic       out
);
    logic [3:0] sr;
    always_ff @(posedge clk)
        if (reset) sr <= 4'b0;
        else       sr <= {sr[2:0], in};
    assign out = sr[3];
endmodule
