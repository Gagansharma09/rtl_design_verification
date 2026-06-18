`timescale 1ns/1ps
module tb_shift18;
    logic clk=0,load; logic [1:0] ena; logic [63:0] data,q; int errors=0;
    shift18 dut(.clk,.load,.ena,.data,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Shift18 Testbench ===");
        load=1; data=64'hFFFF_FFFF_FFFF_FFF0; ena=2'b00; @(posedge clk); #1; load=0;
        // Arithmetic right by 1: MSB sign-extended
        ena=2'b01; @(posedge clk); #1;
        if(q[63]!==1) begin $error("arith right1 sign extend fail"); errors++; end
        // Left shift by 1
        load=1; data=64'h1; @(posedge clk); #1; load=0;
        ena=2'b11; @(posedge clk); #1;
        if(q!==64'h2) begin $error("left shift fail q=%h",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
