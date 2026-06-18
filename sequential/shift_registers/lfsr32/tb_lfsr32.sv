`timescale 1ns/1ps
module tb_lfsr32;
    logic clk=0,reset; logic [31:1] q; int errors=0;
    lfsr32 dut(.clk,.reset,.q);
    always #5 clk=~clk;
    initial begin
        $display("=== LFSR32 Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        if(q!==32'b1) begin $error("seed fail"); errors++; end
        // Check non-zero for 1000 cycles
        repeat(1000) begin
            @(posedge clk); #1;
            if(q==0) begin $error("zero state at cycle"); errors++; end
        end
        if(errors==0) $display("1000-cycle non-zero check PASSED");
        else          $display("%0d FAILED",errors);
        $finish;
    end
endmodule
