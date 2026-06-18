`timescale 1ns/1ps
module tb_top;
    logic clk=0,reset,out;
    top_module dut(.clk,.reset,.out);
    always #5 clk=~clk;
    initial begin
        reset=1; @(posedge clk); #1; reset=0;
        repeat(20) @(posedge clk);
        $display("STUB — implement and add tests");
        $finish;
    end
endmodule
