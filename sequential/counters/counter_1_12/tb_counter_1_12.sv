`timescale 1ns/1ps
module tb_counter_1_12;
    logic clk=0,reset,enable; logic [3:0] q; logic c_enable,c_load,c_d; int errors=0;
    top_module dut(.clk,.reset,.enable,.q,.c_enable,.c_load,.c_d);
    always #5 clk=~clk;
    initial begin
        $display("=== Counter 1-12 Testbench ===");
        reset=1; enable=0; @(posedge clk); #1; reset=0; enable=1;
        for(int i=0;i<36;i++) begin
            @(posedge clk); #1;
            int exp = (i%12)+1;
            if(q!==exp) begin $error("step %0d q=%0d exp=%0d",i,q,exp); errors++; end
        end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
