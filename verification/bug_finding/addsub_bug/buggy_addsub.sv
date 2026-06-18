// HDLBits: Find bug in add/subtract
// https://hdlbits.01xz.net/wiki/bugs_addsubz
// BUGGY: doesn't set overflow correctly / zero flag wrong
module add_sub(
    input  logic [7:0] a, b,
    input  logic       sub,
    output logic [7:0] out,
    output logic       overflow, zero
);
    logic [7:0] b_mod;
    assign b_mod = sub ? ~b + 1 : b;    // two's complement for sub
    assign {overflow, out} = a + b_mod; // BUG: overflow is carry-out, not signed overflow
    assign zero = (out == 8'h00);
endmodule
