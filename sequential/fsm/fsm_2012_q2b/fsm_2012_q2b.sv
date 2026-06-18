// TODO: Implement per HDLBits problem specification
// Refer to the URL in the module comment and the README
module top_module(
    input  logic clk, reset,
    output logic out
);
    typedef enum logic [1:0] {S0, S1, S2, S3} state_t;
    state_t state;
    always_ff @(posedge clk)
        if (reset) state <= S0;
    assign out = 1'b0;
endmodule
