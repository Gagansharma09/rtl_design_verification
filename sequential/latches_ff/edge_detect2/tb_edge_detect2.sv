`timescale 1ns/1ps
module tb_edge_detect2;
    logic clk=0; logic [7:0] in,anyedge; int errors=0;
    edge_detect2 dut(.clk,.in,.anyedge);
    always #5 clk=~clk;
    task tick(input logic [7:0] v); in=v; @(posedge clk); #1; endtask
    initial begin
        $display("=== Edge Detect Both Edges Testbench ===");
        in=0; @(posedge clk); #1;
        tick(8'hAA); if(anyedge!==8'hAA) begin $error("rising fail %h",anyedge); errors++; end
        tick(8'hAA); if(anyedge!==8'h00) begin $error("no change fail"); errors++; end
        tick(8'h55); if(anyedge!==8'hFF) begin $error("all change fail"); errors++; end
        tick(8'h55); if(anyedge!==8'h00) begin $error("steady fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
