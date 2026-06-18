`timescale 1ns/1ps
module tb_shift_m2014_q4k;
    logic clk=0,in,reset,out; int errors=0;
    top_module dut(.clk,.in,.reset,.out);
    always #5 clk=~clk;
    task tick(input logic td); in=td; @(posedge clk); #1; endtask
    initial begin
        $display("=== Shift Register m2014_q4k Testbench ===");
        reset=1; in=0; @(posedge clk); #1; reset=0;
        tick(1); tick(0); tick(0); tick(0);  // after 4 clocks, out=1
        if(out!==1) begin $error("out should be 1 after 4 clocks, got %b",out); errors++; end
        tick(0);  // now out=0
        if(out!==0) begin $error("out should be 0 now"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
