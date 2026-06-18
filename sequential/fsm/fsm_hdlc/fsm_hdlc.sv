// HDLBits: HDLC sequence recognition (detect 0111_1110)
// https://hdlbits.01xz.net/wiki/fsm_hdlc
// Detects abort sequence: 6 consecutive 1s; disc: 5 ones then a 0
module fsm_hdlc(
    input  logic clk, reset, in,
    output logic disc, flag, err
);
    typedef enum logic [2:0] {
        S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6
    } state_t;
    state_t state;

    always_ff @(posedge clk) begin
        if (reset) state <= S0;
        else case (state)
            S0: state <= in ? S1 : S0;
            S1: state <= in ? S2 : S0;
            S2: state <= in ? S3 : S0;
            S3: state <= in ? S4 : S0;
            S4: state <= in ? S5 : S0;
            S5: state <= in ? S6 : S0;  // disc on 0
            S6: state <= in ? S6 : S0;  // err while in S6
        endcase
    end

    assign disc = (state == S5) & ~in;
    assign flag = (state == S5) & ~in;  // flag: treat same as disc for simplification
    assign err  = (state == S6);
endmodule
