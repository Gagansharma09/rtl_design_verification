// HDLBits: Serial receiver FSM
// https://hdlbits.01xz.net/wiki/fsm_serial
// Detects 8-bit serial frame: start(0), 8 data bits, stop(1)
module fsm_serial(
    input  logic clk, reset, in,
    output logic done
);
    typedef enum logic [3:0] {
        IDLE=4'd0, D0=4'd1, D1=4'd2, D2=4'd3, D3=4'd4,
        D4=4'd5, D5=4'd6, D6=4'd7, D7=4'd8, STOP=4'd9, ERR=4'd10
    } state_t;
    state_t state;
    always_ff @(posedge clk) begin
        if (reset) state <= IDLE;
        else case (state)
            IDLE: state <= in ? IDLE : D0;   // wait for start bit (0)
            D0:   state <= D1;
            D1:   state <= D2;
            D2:   state <= D3;
            D3:   state <= D4;
            D4:   state <= D5;
            D5:   state <= D6;
            D6:   state <= D7;
            D7:   state <= in ? STOP : ERR;  // stop bit must be 1
            STOP: state <= in ? IDLE : D0;
            ERR:  state <= in ? IDLE : ERR;
        endcase
    end
    assign done = (state == STOP);
endmodule
