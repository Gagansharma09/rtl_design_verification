`timescale 1ns/1ps
module tb_dff8r;
    logic clk=0,reset; logic [7:0] d,q; int errors=0;
    dff8r dut(.clk(clk),.reset(reset),.d(d),.q(q));
    always #5 clk=~clk;
    initial begin
        $display("=== DFF8R Testbench ===");
        // reset active
        reset=1; d=8'hFF; @(posedge clk); #1;
        if(q!==0) begin $error("reset fail: q=%h",q); errors++; end
        // reset release
        reset=0; d=8'hAB; @(posedge clk); #1;
        if(q!==8'hAB) begin $error("load fail: q=%h",q); errors++; end
        // synchronous reset - should only clear on clock edge
        reset=1; #3; // assert reset between edges
        if(q===0) begin $error("async behavior detected"); errors++; end
        @(posedge clk); #1;
        if(q!==0) begin $error("sync reset fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
