`timescale 1ns/1ps
module tb_count1k;
    logic clk=0,reset; logic [9:0] q; int errors=0;
    count1k dut(.clk,.reset,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Count1k Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        repeat(999) @(posedge clk);
        #1; if(q!==999) begin $error("q=%0d exp 999",q); errors++; end
        @(posedge clk); #1;
        if(q!==0) begin $error("wrap fail q=%0d",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
