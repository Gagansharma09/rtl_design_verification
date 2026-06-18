// HDLBits: PS/2 packet parser
// https://hdlbits.01xz.net/wiki/fsm_ps2
// A PS/2 packet is 3 bytes; first byte always has bit[3]=1
// done asserted after 3rd byte received
module fsm_ps2(
    input  logic       clk, reset,
    input  logic [7:0] in,
    output logic       done
);
    typedef enum logic [1:0] {WAIT=2'b00,B2=2'b01,B3=2'b10,DONE=2'b11} state_t;
    state_t state;
    always_ff @(posedge clk) begin
        if (reset) state <= WAIT;
        else case (state)
            WAIT: state <= in[3] ? B2   : WAIT;
            B2:   state <= B3;
            B3:   state <= DONE;
            DONE: state <= in[3] ? B2   : WAIT;
        endcase
    end
    assign done = (state == DONE);
endmodule
