// HDLBits: Find bug in case statement
// https://hdlbits.01xz.net/wiki/bugs_case
// BUGGY: incomplete case (missing default / some cases)
module case_bug(
    input  logic [1:0] sel,
    input  logic [3:0] a, b, c, d,
    output logic [3:0] out
);
    always_comb begin
        case(sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            // BUG: missing 2'b11 case -> latch inferred
        endcase
    end
endmodule
