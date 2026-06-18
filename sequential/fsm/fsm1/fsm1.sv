// HDLBits: Simple FSM 1 (asynchronous reset) — Moore machine
// https://hdlbits.01xz.net/wiki/fsm1
// States A(0),B(1): A->B on in=1, B->A on in=0; out=B
module fsm1(
    input  logic clk, areset, in,
    output logic out
);
    typedef enum logic {A=1'b0, B=1'b1} state_t;
    state_t state;
    always_ff @(posedge clk or posedge areset)
        if (areset) state <= A;
        else case (state)
            A: state <= in ? B : A;
            B: state <= in ? B : A;
        endcase
    assign out = (state == B);
endmodule
