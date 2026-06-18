// HDLBits: 3-input LUT using shift register
// https://hdlbits.01xz.net/wiki/exams/ece241_2013_q12
// A 3-input LUT is an 8-bit shift register that stores the truth table
// Inputs (a,b,c) select which bit of the shift register is the output
module lut3(
    input  logic       clk,
    input  logic [2:0] a,
    output logic       z
);
    logic [7:0] sr;
    // Each clock shifts in a new LUT bit from sr[7]
    // The LUT output is selected by address a
    always_ff @(posedge clk)
        sr <= {sr[0], sr[7:1]};   // rotate (simplified LUT load)
    assign z = sr[a];
endmodule
