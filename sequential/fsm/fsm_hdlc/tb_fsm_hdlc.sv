`timescale 1ns/1ps
module tb_fsm_hdlc;
    logic clk=0,reset,in,disc,flag,err; int errors=0;
    fsm_hdlc dut(.clk,.reset,.in,.disc,.flag,.err);
    always #5 clk=~clk;
    task tick(input logic ti); in=ti; @(posedge clk); #1; endtask
    initial begin
        $display("=== HDLC FSM Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        // 5 ones then 0 -> disc
        tick(1);tick(1);tick(1);tick(1);tick(1);
        in=0; @(posedge clk); #1;
        if(!disc) begin $error("disc not asserted after 5+zero"); errors++; end
        // 6 ones -> err
        reset=1; @(posedge clk); #1; reset=0;
        tick(1);tick(1);tick(1);tick(1);tick(1);tick(1);
        if(!err) begin $error("err not asserted after 6 ones"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
