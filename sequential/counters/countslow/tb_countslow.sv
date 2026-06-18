`timescale 1ns/1ps
module tb_countslow;
    logic clk=0,slowena,reset; logic [3:0] q; int errors=0;
    countslow dut(.clk,.slowena,.reset,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Countslow Testbench ===");
        reset=1; slowena=0; @(posedge clk); #1; reset=0;
        // Without enable: should not count
        slowena=0;
        repeat(5) @(posedge clk);
        #1; if(q!==0) begin $error("should not count without ena"); errors++; end
        // With enable: should count 0-9
        slowena=1;
        for(int i=0;i<10;i++) begin @(posedge clk); #1; end
        if(q!==0) begin $error("after 10 cycles should wrap to 0, got %0d",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
