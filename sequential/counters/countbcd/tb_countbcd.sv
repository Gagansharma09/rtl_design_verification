`timescale 1ns/1ps
module tb_countbcd;
    logic clk=0,reset; logic [15:0] q; logic [3:0] ena; int errors=0;
    countbcd dut(.clk,.reset,.q,.ena);
    always #5 clk=~clk;
    initial begin
        $display("=== BCD Counter Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        // Count to 0099
        repeat(99) @(posedge clk);
        #1;
        if(q[3:0]!==9||q[7:4]!==9||q[11:8]!==0||q[15:12]!==0)
            begin $error("q=%h exp 0099",q); errors++; end
        @(posedge clk); #1;
        if(q[3:0]!==0||q[7:4]!==0||q[11:8]!==1||q[15:12]!==0)
            begin $error("q=%h exp 0100",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
