// HDLBits: Counter 1-12
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q7a
module top_module(
    input  logic       clk, reset, enable,
    output logic [3:0] q,
    output logic       c_enable, c_load, c_d
);
    // Use loadable counter: enable count 1→12, reset to 1
    always_ff @(posedge clk) begin
        if (reset || q == 4'd12) q <= 4'd1;
        else if (enable)          q <= q + 4'd1;
    end
    assign c_enable = enable;
    assign c_load   = reset | (q == 4'd12);
    assign c_d      = 1'b0;  // load value bit (not used here, HDLBits provides counter)
endmodule
