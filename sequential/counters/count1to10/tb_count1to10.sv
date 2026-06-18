`timescale 1ns/1ps
module tb_count1to10;
    logic clk=0,reset; logic [3:0] q; int errors=0;
    count1to10 dut(.clk,.reset,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Count1to10 Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        for(int i=0;i<30;i++) begin
            @(posedge clk); #1;
            int exp = (i%10)+1;
            if(q !== exp) begin $error("step %0d: q=%0d exp=%0d",i,q,exp); errors++; end
        end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
