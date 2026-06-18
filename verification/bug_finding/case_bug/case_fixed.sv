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
            2'b11: out = d;   // FIX: add missing case
            default: out = 4'bx;
        endcase
    end
endmodule
