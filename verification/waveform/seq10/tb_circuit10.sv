`timescale 1ns/1ps
module tb_circuit10;
    logic clk=0, a, b, q;
    circuit10 dut(.clk(clk), .a(a), .b(b), .q(q));
    always #5 clk=~clk;
    initial begin
        $display("=== Sequential Circuit 10 Waveform TB ===");
        $dumpfile("circuit10.vcd");
        $dumpvars(0, tb_circuit10);
        a=0; b=0;
        @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=0; b=1; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=1; b=0; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=1; b=1; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        $display("Compare output to HDLBits expected waveform");
        $finish;
    end
endmodule
