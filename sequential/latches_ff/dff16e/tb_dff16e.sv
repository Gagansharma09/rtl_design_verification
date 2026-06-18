`timescale 1ns/1ps
module tb_dff16e;
    logic clk=0,resetn,byteena; logic [15:0] d,q; int errors=0;
    dff16e dut(.clk,.resetn,.byteena,.d,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== DFF16E Testbench ===");
        resetn=0; byteena=0; d=16'hFFFF; @(posedge clk); #1;
        if(q!==0) begin $error("reset fail"); errors++; end
        resetn=1; byteena=1; d=16'hABCD; @(posedge clk); #1;
        if(q!==16'hABCD) begin $error("load fail q=%h",q); errors++; end
        byteena=0; d=16'h0000; @(posedge clk); #1;
        if(q!==16'hABCD) begin $error("hold fail q=%h",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
