// HDLBits: Serial two's complementer (Moore FSM)
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q5a
// Two's complement rule: copy bits until first 1 seen, then invert remaining
module serial_twos_comp_moore(
    input  logic clk, areset, in,
    output logic out
);
    typedef enum logic {COPY=0, INV=1} state_t;
    state_t state;
    always_ff @(posedge clk or posedge areset) begin
        if (areset) state <= COPY;
        else if (state == COPY && in) state <= INV;
        // once in INV, stay there
    end
    assign out = (state == INV) ? ~in : in;
endmodule
