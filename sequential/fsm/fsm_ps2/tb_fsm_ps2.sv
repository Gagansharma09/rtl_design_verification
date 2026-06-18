`timescale 1ns/1ps
module tb_fsm_ps2;
    logic clk=0,reset; logic [7:0] in; logic done; int errors=0;
    fsm_ps2 dut(.clk,.reset,.in,.done);
    always #5 clk=~clk;
    task tick(input logic [7:0] v, input logic exp);
        in=v; @(posedge clk); #1;
        if(done!==exp) begin $error("in=%h done=%b exp=%b",v,done,exp); errors++; end
    endtask
    initial begin
        $display("=== PS/2 Parser Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        tick(8'h08, 0);  // byte1: bit3=1 -> B2, done=0
        tick(8'hAA, 0);  // byte2 -> B3, done=0
        tick(8'hBB, 1);  // byte3 -> DONE, done=1
        tick(8'h00, 0);  // no new packet start, done=0
        tick(8'h08, 0);  // start again
        tick(8'h11, 0);
        tick(8'h22, 1);  // done again
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
