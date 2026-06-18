`timescale 1ns/1ps
module tb_dff8p;
    logic clk=0,reset; logic [7:0] d,q; int errors=0;
    dff8p dut(.clk,.reset,.d,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== DFF8P Testbench ===");
        reset=1; d=8'hFF; @(posedge clk); #1;
        if(q!==8'h34) begin $error("reset val fail: q=%h exp 34",q); errors++; end
        reset=0; d=8'hAB; @(posedge clk); #1;
        if(q!==8'hAB) begin $error("load fail q=%h",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
