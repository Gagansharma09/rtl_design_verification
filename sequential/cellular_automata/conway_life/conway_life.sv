// HDLBits: Conway's Game of Life 16x16
// https://hdlbits.01xz.net/wiki/conwaylife
// Grid is 16x16, toroidal (wraps at edges)
module conway_life(
    input  logic        clk, load,
    input  logic [255:0] data,
    output logic [255:0] q
);
    // Count live neighbors (8 adjacent, toroidal)
    function automatic logic [3:0] neighbors(input logic [255:0] s, input int row, col);
        int cnt = 0;
        for (int dr = -1; dr <= 1; dr++) begin
            for (int dc = -1; dc <= 1; dc++) begin
                if (dr == 0 && dc == 0) continue;
                int r = (row + dr + 16) % 16;
                int c = (col + dc + 16) % 16;
                cnt += s[r*16 + c];
            end
        end
        return cnt[3:0];
    endfunction

    always_ff @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (int r = 0; r < 16; r++) begin
                for (int c = 0; c < 16; c++) begin
                    logic [3:0] n = neighbors(q, r, c);
                    logic alive   = q[r*16 + c];
                    // Born if dead and 3 neighbors; survive if 2 or 3 neighbors
                    q[r*16+c] <= (alive && (n==2 || n==3)) || (!alive && n==3);
                end
            end
        end
    end
endmodule
