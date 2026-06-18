// Fixed: signed overflow detection
module add_sub(
    input  logic [7:0] a, b,
    input  logic       sub,
    output logic [7:0] out,
    output logic       overflow, zero
);
    logic [7:0] b_mod;
    assign b_mod   = sub ? ~b : b;
    assign out     = a + b_mod + sub;
    assign overflow = (~a[7] & ~b_mod[7] & out[7]) | (a[7] & b_mod[7] & ~out[7]);
    assign zero     = (out == 8'h00);
endmodule
