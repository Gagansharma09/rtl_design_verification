`timescale 1ns/1ps
module tb_circuit9;
    logic clk=0, a, b, q;
    circuit9 dut(.clk(clk), .a(a), .b(b), .q(q));
    always #5 clk=~clk;
    initial begin
        $display("=== Sequential Circuit 9 Waveform TB ===");
        $dumpfile("circuit9.vcd");
        $dumpvars(0, tb_circuit9);
        a=0; b=0;
        @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=0; b=1; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=1; b=0; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=1; b=1; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        $display("Compare output to HDLBits expected waveform");
        $finish;
    end
endmodule
