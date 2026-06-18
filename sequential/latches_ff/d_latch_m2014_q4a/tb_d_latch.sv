`timescale 1ns/1ps
module tb_d_latch;
    logic d,ena,q; int errors=0;
    top_module dut(.d,.ena,.q);
    initial begin
        $display("=== D Latch Testbench ===");
        ena=0; d=1; #10;
        if(q===1) begin $error("latch should not follow d when ena=0"); errors++; end
        ena=1; d=1; #10;
        if(q!==1) begin $error("q should follow d=1 when ena=1"); errors++; end
        d=0; #5;
        if(q!==0) begin $error("q should follow d=0 when ena=1"); errors++; end
        ena=0; d=1; #10;
        if(q!==0) begin $error("q should hold 0 after ena=0"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
