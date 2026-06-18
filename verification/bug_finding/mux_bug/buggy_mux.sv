// HDLBits: Find the bug in a 2-to-1 mux
// https://hdlbits.01xz.net/wiki/bugs_mux2
// BUGGY VERSION (for reference)
module mux(
    input  logic sel, a, b,
    output logic out
);
    always_comb begin
        case(sel)
            1'b0: out = a;
            1'b1: out = a;  // BUG: should be b
        endcase
    end
endmodule
