`timescale 1ns/1ps
module tb_fsm1s;
    logic clk=0,reset,in,out; int errors=0;
    fsm1s dut(.clk,.reset,.in,.out);
    always #5 clk=~clk;
    task tick(input logic ti); in=ti; @(posedge clk); #1; endtask
    initial begin
        $display("=== FSM1S (sync reset) Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        tick(1); if(out!==1) begin $error("A->B fail"); errors++; end
        tick(0); if(out!==0) begin $error("B->A fail"); errors++; end
        tick(1); reset=1; @(posedge clk); #1; reset=0;
        if(out!==0) begin $error("sync reset fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
