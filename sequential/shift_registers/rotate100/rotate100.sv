// HDLBits: Left/Right Rotator (100-bit)
// https://hdlbits.01xz.net/wiki/rotate100
module rotate100(
    input  logic        clk, load,
    input  logic [1:0]  ena,
    input  logic [99:0] data,
    output logic [99:0] q
);
    always_ff @(posedge clk) begin
        if      (load)      q <= data;
        else if (ena == 2'b01) q <= {q[0], q[99:1]};      // rotate right
        else if (ena == 2'b10) q <= {q[98:0], q[99]};     // rotate left
    end
endmodule
