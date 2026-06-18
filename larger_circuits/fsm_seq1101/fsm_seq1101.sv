// HDLBits: FSM Sequence 1101 recognizer (Mealy)
// https://hdlbits.01xz.net/wiki/exams/review2015_fsmseq
module fsm_seq1101(
    input  logic clk, reset, data,
    output logic start_shifting
);
    typedef enum logic [1:0] {S0=0,S1=1,S11=2,S110=3} state_t;
    state_t state;
    always_ff @(posedge clk) begin
        if (reset) state <= S0;
        else case (state)
            S0:   state <= data ? S1   : S0;
            S1:   state <= data ? S11  : S0;
            S11:  state <= data ? S11  : S110;
            S110: state <= data ? S1   : S0;   // 1101 detected
        endcase
    end
    // 1 when sequence 1101 is seen (pattern = S110 + in=1)
    assign start_shifting = (state == S110) & data;
endmodule
