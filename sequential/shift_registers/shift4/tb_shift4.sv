`timescale 1ns/1ps
module tb_shift4;
    logic clk=0,areset,load,ena; logic [3:0] data,q; int errors=0;
    shift4 dut(.clk,.areset,.load,.ena,.data,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Shift4 Testbench ===");
        areset=1; load=0; ena=0; data=4'hF; @(posedge clk); #1; areset=0;
        if(q!==0) begin $error("areset fail"); errors++; end
        load=1; data=4'hA; @(posedge clk); #1; load=0;
        if(q!==4'hA) begin $error("load fail q=%h",q); errors++; end
        ena=1; @(posedge clk); #1;   // shift right: 1010 -> 0101
        if(q!==4'h5) begin $error("shift1 fail q=%h",q); errors++; end
        @(posedge clk); #1;           // 0101 -> 0010
        if(q!==4'h2) begin $error("shift2 fail q=%h",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
