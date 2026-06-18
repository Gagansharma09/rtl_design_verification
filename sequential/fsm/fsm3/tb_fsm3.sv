`timescale 1ns/1ps
module tb_fsm3;
    logic clk=0,areset,in,out; int errors=0;
    fsm3 dut(.clk,.areset,.in,.out);
    always #5 clk=~clk;
    task tick(input logic ti, input logic exp);
        in=ti; @(posedge clk); #1;
        if(out!==exp) begin $error("in=%b out=%b exp=%b",ti,out,exp); errors++; end
    endtask
    initial begin
        $display("=== FSM3 Testbench ===");
        areset=1; @(posedge clk); #1; areset=0;
        //  A->B->C->D sequence: in=1,1,0,1 -> out at D
        tick(1,0); // A->B
        tick(0,0); // B->C
        tick(1,0); // C->D
        tick(1,1); // D->B? wait D outputs 1 but transitions next clock
        // actual: out is based on CURRENT state after clock
        // After areset=A(out=0), in=1->B(0), in=1->B(0), in=0->C(0), in=1->D(1)
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
