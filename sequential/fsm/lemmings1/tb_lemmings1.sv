`timescale 1ns/1ps
module tb_lemmings1;
    logic clk=0,areset,bump_left,bump_right,walk_left,walk_right; int errors=0;
    lemmings1 dut(.clk,.areset,.bump_left,.bump_right,.walk_left,.walk_right);
    always #5 clk=~clk;
    task tick(input logic bl,br,input logic ewl,ewr);
        bump_left=bl; bump_right=br; @(posedge clk); #1;
        if(walk_left!==ewl||walk_right!==ewr) begin
            $error("bl=%b br=%b | wl=%b(exp%b) wr=%b(exp%b)",bl,br,walk_left,ewl,walk_right,ewr);
            errors++;
        end
    endtask
    initial begin
        $display("=== Lemmings1 Testbench ===");
        areset=1; bump_left=0; bump_right=0; @(posedge clk); #1; areset=0;
        tick(0,0, 1,0); // walking left
        tick(1,0, 0,1); // hit left wall -> walk right
        tick(0,0, 0,1); // still right
        tick(0,1, 1,0); // hit right wall -> walk left
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
