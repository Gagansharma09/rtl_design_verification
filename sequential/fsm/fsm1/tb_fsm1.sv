`timescale 1ns/1ps
module tb_fsm1;
    logic clk=0,areset,in,out; int errors=0;
    fsm1 dut(.clk,.areset,.in,.out);
    always #5 clk=~clk;
    task tick(input logic ti); in=ti; @(posedge clk); #1; endtask
    initial begin
        $display("=== FSM1 (async reset) Testbench ===");
        areset=1; in=0; @(posedge clk); #1; areset=0;
        if(out!==0) begin $error("initial state A fail"); errors++; end
        tick(1); if(out!==1) begin $error("A->B fail"); errors++; end
        tick(1); if(out!==1) begin $error("B->B fail"); errors++; end
        tick(0); if(out!==0) begin $error("B->A fail"); errors++; end
        // Async reset test
        tick(1); areset=1; #3;
        if(out!==0) begin $error("async reset mid-seq fail"); errors++; end
        areset=0;
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
