// HDLBits: Simple FSM 3 (asynchronous reset) — 4-state Moore
// https://hdlbits.01xz.net/wiki/fsm3
// States: A,B,C,D
module fsm3(
    input  logic clk, areset, in,
    output logic out
);
    typedef enum logic [1:0] {A=2'b00,B=2'b01,C=2'b10,D=2'b11} state_t;
    state_t state;
    always_ff @(posedge clk or posedge areset)
        if (areset) state <= A;
        else case (state)
            A: state <= in ? B : A;
            B: state <= in ? B : C;
            C: state <= in ? D : A;
            D: state <= in ? B : C;
        endcase
    assign out = (state == D);
endmodule
