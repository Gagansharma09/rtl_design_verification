`timescale 1ns/1ps
module tb_counter_1000;
    logic clk=0,reset; logic c_enable,c_load,c_d; logic [9:0] q; int errors=0;
    top_module dut(.clk,.reset,.c_enable,.c_load,.c_d,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Counter 1000 Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        repeat(998) @(posedge clk);
        #1; if(q!==999) begin $error("q=%0d exp 999",q); errors++; end
        @(posedge clk); #1;
        if(q!==0) begin $error("wrap fail q=%0d",q); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
