`timescale 1ns/1ps
module tb_rule90;
    logic clk=0,load; logic [511:0] data,q; int errors=0;
    rule90 dut(.clk,.load,.data,.q);
    always #5 clk=~clk;

    function automatic logic [511:0] next_state(input logic [511:0] s);
        next_state[0]   = s[1];
        next_state[511] = s[510];
        for(int i=1;i<511;i++) next_state[i] = s[i-1]^s[i+1];
    endfunction

    initial begin
        $display("=== Rule 90 Testbench ===");
        load=1; data=512'h1; @(posedge clk); #1; load=0;
        logic [511:0] expected = data;
        for(int i=0;i<5;i++) begin
            expected = next_state(expected);
            @(posedge clk); #1;
            if(q!==expected) begin $error("step %0d mismatch",i); errors++; end
        end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
