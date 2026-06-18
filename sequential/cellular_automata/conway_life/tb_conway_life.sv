`timescale 1ns/1ps
module tb_conway_life;
    logic clk=0,load; logic [255:0] data,q; int errors=0;
    conway_life dut(.clk,.load,.data,.q);
    always #5 clk=~clk;

    // Blinker pattern (period 2): 3 horizontal cells in a row
    // Row 8, cols 7,8,9 alive
    initial begin
        $display("=== Conway's Game of Life Testbench ===");
        data = 256'h0;
        data[8*16+7] = 1; data[8*16+8] = 1; data[8*16+9] = 1;  // horizontal blinker
        load=1; @(posedge clk); #1; load=0;
        @(posedge clk); #1;  // step 1: should become vertical
        // Check vertical blinker: rows 7,8,9 col 8 should be alive
        if (!q[7*16+8] || !q[8*16+8] || !q[9*16+8])
            $error("blinker step1: vertical not formed");
        if (q[8*16+7] || q[8*16+9])
            $error("blinker step1: horizontal cells should be dead");
        @(posedge clk); #1;  // step 2: back to horizontal
        if (!q[8*16+7] || !q[8*16+8] || !q[8*16+9])
            begin $error("blinker not periodic"); errors++; end
        if(errors==0) $display("BLINKER TEST PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
