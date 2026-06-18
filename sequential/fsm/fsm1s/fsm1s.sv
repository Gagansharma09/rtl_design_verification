// HDLBits: Simple FSM 1 (synchronous reset)
// https://hdlbits.01xz.net/wiki/fsm1s
module fsm1s(
    input  logic clk, reset, in,
    output logic out
);
    typedef enum logic {A=1'b0, B=1'b1} state_t;
    state_t state;
    always_ff @(posedge clk)
        if (reset) state <= A;
        else case (state)
            A: state <= in ? B : A;
            B: state <= in ? B : A;
        endcase
    assign out = (state == B);
endmodule
