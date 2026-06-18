`timescale 1ns/1ps
module tb_lfsr5;
    logic clk=0,reset; logic [4:1] q; int errors=0;
    lfsr5 dut(.clk,.reset,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== LFSR5 Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        if(q!==5'b10000) begin $error("reset state fail q=%05b",q); errors++; end
        // Run 31 cycles — LFSR should revisit all 31 non-zero states
        logic [30:0] seen=0;
        for(int i=0;i<31;i++) begin
            @(posedge clk); #1;
            if(q==0) begin $error("LFSR reached zero state"); errors++; end
            if(seen[q-1]) begin $error("repeated state %05b at cycle %0d",q,i); errors++; end
            seen[q-1]=1;
        end
        @(posedge clk); #1;
        if(q!==5'b10000) begin $error("not maximal length"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED (maximal 31-state sequence)");
        else          $display("%0d FAILED",errors);
        $finish;
    end
endmodule
