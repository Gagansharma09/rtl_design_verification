// HDLBits: Rule 110
// https://hdlbits.01xz.net/wiki/rule110
// next[i] = rule_110[{left, center, right}]
// Rule 110 truth table: 111->0, 110->1, 101->1, 100->0, 011->1, 010->1, 001->1, 000->0
module rule110(
    input  logic        clk, load,
    input  logic [511:0] data,
    output logic [511:0] q
);
    logic [7:0] rule = 8'b0110_1110;  // Rule 110

    always_ff @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (int i = 0; i < 512; i++) begin
                logic left  = (i > 0)   ? q[i-1] : 1'b0;
                logic right = (i < 511) ? q[i+1] : 1'b0;
                q[i] <= rule[{left, q[i], right}];
            end
        end
    end
endmodule
