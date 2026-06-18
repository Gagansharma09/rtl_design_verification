`timescale 1ns/1ps
module tb_edge_capture;
    logic clk=0,reset; logic [31:0] in,out; int errors=0;
    edge_capture dut(.clk,.reset,.in,.out);
    always #5 clk=~clk;
    task tick(input logic [31:0] v); in=v; @(posedge clk); #1; endtask
    initial begin
        $display("=== Edge Capture Testbench ===");
        reset=1; in=0; @(posedge clk); #1; reset=0;
        tick(32'hFFFF_FFFF);               // all high, no fall yet
        if(out!==0) begin $error("no fall yet"); errors++; end
        tick(32'h0000_0000);               // all fall
        if(out!==32'hFFFF_FFFF) begin $error("fall capture fail %h",out); errors++; end
        tick(32'hFFFF_FFFF);               // sticky — out should remain
        if(out!==32'hFFFF_FFFF) begin $error("sticky fail %h",out); errors++; end
        reset=1; @(posedge clk); #1; reset=0;
        if(out!==0) begin $error("reset clear fail"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
