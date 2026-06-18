`timescale 1ns/1ps
module tb_serial_twos_comp_moore;
    logic clk=0,areset,in,out; int errors=0;
    serial_twos_comp_moore dut(.clk,.areset,.in,.out);
    always #5 clk=~clk;
    task tick(input logic ti, input logic exp);
        in=ti; @(posedge clk); #1;
        if(out!==exp) begin $error("in=%b out=%b exp=%b",ti,out,exp); errors++; end
    endtask
    initial begin
        $display("=== Serial Two's Comp Moore Testbench ===");
        areset=1; @(posedge clk); #1; areset=0;
        // Input 0110 (LSB first) = 6 dec, twos comp = -6 = 1010
        // Output: 0 (copy 0), 1 (copy 1, switch to INV), 0 (invert 1), 1 (invert 0) => 0101? 
        // Verify with actual HDLBits problem
        tick(0, 0);  // first 0, still copy
        tick(1, 1);  // first 1, copy, then switch state
        tick(1, 0);  // now inverting
        tick(0, 1);  // inverting
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
