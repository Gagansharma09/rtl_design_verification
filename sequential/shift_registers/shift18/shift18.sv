// HDLBits: Left/right arithmetic shift by 1 or 8
// https://hdlbits.01xz.net/wiki/shift18
module shift18(
    input  logic        clk, load,
    input  logic [1:0]  ena,
    input  logic [63:0] data,
    output logic [63:0] q
);
    always_ff @(posedge clk) begin
        if (load) q <= data;
        else case (ena)
            2'b00: q <= q;                              // no shift
            2'b01: q <= $signed(q) >>> 1;               // arithmetic right by 1
            2'b10: q <= $signed(q) >>> 8;               // arithmetic right by 8
            2'b11: q <= q << 1;                         // left shift by 1
        endcase
    end
endmodule
