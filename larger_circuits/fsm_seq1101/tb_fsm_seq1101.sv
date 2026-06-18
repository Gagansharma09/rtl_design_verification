`timescale 1ns/1ps
module tb_fsm_seq1101;
    logic clk=0,reset,data,start_shifting; int errors=0;
    fsm_seq1101 dut(.clk,.reset,.data,.start_shifting);
    always #5 clk=~clk;
    task tick(input logic td,input logic exp);
        data=td; @(posedge clk); #1;
        if(start_shifting!==exp) begin
            $error("data=%b ss=%b exp=%b",td,start_shifting,exp); errors++;
        end
    endtask
    initial begin
        $display("=== FSM Seq1101 Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        tick(1,0); tick(1,0); tick(0,0); tick(1,1);  // 1101 detected
        tick(1,0); tick(1,0); tick(0,0); tick(1,1);  // again
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
