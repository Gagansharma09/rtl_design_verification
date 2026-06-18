`timescale 1ns/1ps
module tb_lfsr3;
    logic clk=0,reset; logic [2:0] q; int errors=0;
    lfsr3 dut(.clk,.reset,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== LFSR3 Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        if(q!==3'b001) begin $error("seed fail"); errors++; end
        // Maximal LFSR: 7 unique states (all non-zero for 3-bit)
        logic [6:0] seen=0;
        for(int i=0;i<7;i++) begin
            @(posedge clk); #1;
            if(q==0) begin $error("zero state"); errors++; end
            if(seen[q]) begin $error("repeated state %b at step %0d",q,i); errors++; end
            seen[q]=1;
        end
        @(posedge clk); #1;
        if(q!==3'b001) begin $error("not maximal"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED (maximal 7-state)");
        else          $display("%0d FAILED",errors);
        $finish;
    end
endmodule
