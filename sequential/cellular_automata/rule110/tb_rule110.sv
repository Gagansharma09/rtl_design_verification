`timescale 1ns/1ps
module tb_rule110;
    logic clk=0,load; logic [511:0] data,q; int errors=0;
    rule110 dut(.clk,.load,.data,.q);
    always #5 clk=~clk;

    function automatic logic [511:0] next_rule110(input logic [511:0] s);
        logic [7:0] rule = 8'b0110_1110;
        for(int i=0;i<512;i++) begin
            logic l = (i>0)   ? s[i-1] : 0;
            logic r = (i<511) ? s[i+1] : 0;
            next_rule110[i] = rule[{l, s[i], r}];
        end
    endfunction

    initial begin
        $display("=== Rule 110 Testbench ===");
        load=1; data=512'h1; @(posedge clk); #1; load=0;
        logic [511:0] expected = data;
        for(int i=0;i<5;i++) begin
            expected = next_rule110(expected);
            @(posedge clk); #1;
            if(q!==expected) begin $error("step %0d mismatch",i); errors++; end
        end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
