`timescale 1ns/1ps
module tb_dual_edge_dff;
    logic clk=0,d,q; int errors=0;
    dual_edge_dff dut(.clk,.d,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Dual-Edge DFF Testbench ===");
        d=0;
        // Capture on posedge
        d=1; @(posedge clk); #1;
        if(q!==1) begin $error("posedge capture fail"); errors++; end
        // Capture on negedge
        d=0; @(negedge clk); #1;
        if(q!==0) begin $error("negedge capture fail"); errors++; end
        d=1; @(negedge clk); #1;
        if(q!==1) begin $error("negedge capture fail 2"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
