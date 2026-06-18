`timescale 1ns/1ps
module tb_rotate100;
    logic clk=0,load; logic [1:0] ena; logic [99:0] data,q; int errors=0;
    rotate100 dut(.clk,.load,.ena,.data,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Rotate100 Testbench ===");
        load=1; data=100'h1; ena=2'b00; @(posedge clk); #1; load=0;
        // Rotate right: bit 0 -> bit 99
        ena=2'b01; @(posedge clk); #1;
        if(q[99]!==1'b1) begin $error("rotate right fail MSB=%b",q[99]); errors++; end
        // Rotate left back
        ena=2'b10; @(posedge clk); #1;
        if(q!==100'h1) begin $error("rotate left back fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
