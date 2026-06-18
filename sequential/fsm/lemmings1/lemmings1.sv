// HDLBits: Lemmings 1 — Walk left or right
// https://hdlbits.01xz.net/wiki/lemmings1
module lemmings1(
    input  logic clk, areset,
    input  logic bump_left, bump_right,
    output logic walk_left, walk_right
);
    typedef enum logic {LEFT=1'b0, RIGHT=1'b1} state_t;
    state_t state;
    always_ff @(posedge clk or posedge areset)
        if (areset) state <= LEFT;
        else case (state)
            LEFT:  state <= bump_left  ? RIGHT : LEFT;
            RIGHT: state <= bump_right ? LEFT  : RIGHT;
        endcase
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
endmodule
