`timescale 1ns/1ps
module tb_edge_detect;
    logic clk=0; logic [7:0] in,pedge; int errors=0;
    edge_detect dut(.clk,.in,.pedge);
    always #5 clk=~clk;
    task tick(input logic [7:0] v); in=v; @(posedge clk); #1; endtask
    initial begin
        $display("=== Edge Detect Testbench ===");
        in=0; @(posedge clk); #1;
        tick(8'h01); if(pedge!==8'h01) begin $error("rising 0->1 fail"); errors++; end
        tick(8'h01); if(pedge!==8'h00) begin $error("steady 1 should give 0"); errors++; end
        tick(8'h00); if(pedge!==8'h00) begin $error("falling should give 0"); errors++; end
        tick(8'hFF); if(pedge!==8'hFF) begin $error("all rising fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
