// HDLBits: Shift register (2014 q4b) — 4-bit PISO shift register
// https://hdlbits.01xz.net/wiki/exams/2014_q4b
module shift_2014_q4b(
    input  logic       clk, reset, load,
    input  logic [3:0] d,
    output logic       q
);
    logic [3:0] sr;
    always_ff @(posedge clk) begin
        if      (reset) sr <= 4'b0;
        else if (load)  sr <= d;
        else            sr <= {1'b0, sr[3:1]};  // shift right
    end
    assign q = sr[0];
endmodule
