`timescale 1ns/1ps
module tb_dff;
    logic clk=0, d, q;
    int   errors=0;

    dff dut(.clk(clk),.d(d),.q(q));
    always #5 clk = ~clk;

    task tick(input logic td); d=td; @(posedge clk); #1; endtask

    initial begin
        $display("=== DFF Testbench ===");
        d=0; @(posedge clk); #1;
        tick(1); if(q!==1) begin $error("q should be 1"); errors++; end
        tick(0); if(q!==0) begin $error("q should be 0"); errors++; end
        tick(1); tick(1);
        if(q!==1) begin $error("q should hold 1"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
