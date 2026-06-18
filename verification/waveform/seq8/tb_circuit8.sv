`timescale 1ns/1ps
module tb_circuit8;
    logic clk=0, a, b, q;
    circuit8 dut(.clk(clk), .a(a), .b(b), .q(q));
    always #5 clk=~clk;
    initial begin
        $display("=== Sequential Circuit 8 Waveform TB ===");
        $dumpfile("circuit8.vcd");
        $dumpvars(0, tb_circuit8);
        a=0; b=0;
        @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=0; b=1; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=1; b=0; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        a=1; b=1; @(posedge clk); #1; $display("a=%b b=%b => q=%b",a,b,q);
        $display("Compare output to HDLBits expected waveform");
        $finish;
    end
endmodule
