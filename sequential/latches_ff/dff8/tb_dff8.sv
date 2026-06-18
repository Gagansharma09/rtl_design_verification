`timescale 1ns/1ps
module tb_dff8;
    logic clk=0; logic [7:0] d,q; int errors=0;
    dff8 dut(.clk(clk),.d(d),.q(q));
    always #5 clk=~clk;
    initial begin
        $display("=== DFF8 Testbench ===");
        repeat(20) begin
            d=$random; @(posedge clk); #1;
            // q should hold previous d
        end
        // Direct check
        d=8'hA5; @(posedge clk); #1;
        if(q!==8'hA5) begin $error("q=%h exp A5",q); errors++; end
        d=8'h00; @(posedge clk); #1;
        if(q!==8'h00) begin $error("q=%h exp 00",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
