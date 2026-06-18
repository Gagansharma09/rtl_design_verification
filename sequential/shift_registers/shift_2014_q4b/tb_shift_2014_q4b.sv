`timescale 1ns/1ps
module tb_shift_2014_q4b;
    logic clk=0,reset,load; logic [3:0] d; logic q; int errors=0;
    shift_2014_q4b dut(.clk,.reset,.load,.d,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== Shift 2014_q4b Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        load=1; d=4'b1011; @(posedge clk); #1; load=0;
        // Shift out: q[0]=1,1,0,1 over 4 cycles
        logic [3:0] expected = 4'b1011;
        for(int i=0;i<4;i++) begin
            if(q!==expected[i]) begin $error("bit%0d: q=%b exp=%b",i,q,expected[i]); errors++; end
            @(posedge clk); #1;
        end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
