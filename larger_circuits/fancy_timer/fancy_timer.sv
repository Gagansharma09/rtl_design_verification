// HDLBits: The complete timer (review2015 fancytimer)
// https://hdlbits.01xz.net/wiki/exams/review2015_fancytimer
// Integrates: shift reg for storing count, down counter, FSM for control
module fancy_timer(
    input  logic        clk, reset,
    input  logic        data,
    output logic [3:0]  count,
    output logic        counting, done,
    input  logic        ack
);
    typedef enum logic [1:0] {IDLE=0, LOAD=1, COUNT=2, DONE=3} state_t;
    state_t state;
    logic [3:0] shift_reg;
    logic [9:0] timer;

    // Shift register (load 4 bits)
    always_ff @(posedge clk) begin
        if (state == IDLE || state == LOAD)
            shift_reg <= {shift_reg[2:0], data};
    end

    // FSM
    always_ff @(posedge clk) begin
        if (reset) state <= IDLE;
        else case (state)
            IDLE:  state <= LOAD;
            LOAD:  state <= (/* 4 bits loaded */ 1) ? COUNT : LOAD; // simplified
            COUNT: state <= (timer == 0) ? DONE : COUNT;
            DONE:  state <= ack ? IDLE : DONE;
        endcase
    end

    // Down counter
    always_ff @(posedge clk) begin
        if (state == COUNT) begin
            if (timer == 0) timer <= {shift_reg, 6'd0};  // reload when wrapping
            else            timer <= timer - 1;
        end else timer <= {shift_reg, 6'd0};
    end

    assign count    = shift_reg;
    assign counting = (state == COUNT);
    assign done     = (state == DONE);
endmodule
