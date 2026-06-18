`timescale 1ns/1ps
module tb_mux_dff;
    logic clk=0,L,r_in,q_in,Q; int errors=0;
    top_module dut(.clk,.L,.r_in,.q_in,.Q);
    always #5 clk=~clk;
    task tick(input logic tL,tr,tq);
        L=tL; r_in=tr; q_in=tq; @(posedge clk); #1;
    endtask
    initial begin
        $display("=== Mux+DFF mt2015 Testbench ===");
        tick(1,1,0); if(Q!==1) begin $error("L=1: load r_in=1 fail"); errors++; end
        tick(0,0,0); if(Q!==0) begin $error("L=0: use q_in=0 fail"); errors++; end
        tick(0,1,1); if(Q!==1) begin $error("L=0: use q_in=1 fail"); errors++; end
        tick(1,0,1); if(Q!==0) begin $error("L=1: load r_in=0 fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
