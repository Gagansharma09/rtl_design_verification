`timescale 1ns/1ps
module tb_dff8ar;
    logic clk=0,areset; logic [7:0] d,q; int errors=0;
    dff8ar dut(.clk,.areset,.d,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== DFF8AR Testbench ===");
        areset=0; d=8'hFF; @(posedge clk); #1;
        if(q!==8'hFF) begin $error("load fail"); errors++; end
        // Async reset mid-cycle
        areset=1; #3;
        if(q!==8'h00) begin $error("async reset fail: q=%h",q); errors++; end
        areset=0; d=8'h5A; @(posedge clk); #1;
        if(q!==8'h5A) begin $error("post-reset load fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
