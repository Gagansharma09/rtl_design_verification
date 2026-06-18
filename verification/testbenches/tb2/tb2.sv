// HDLBits: Testbench2 — apply specific input sequence
// https://hdlbits.01xz.net/wiki/tb/tb2
`timescale 1ns/1ps
module tb2;
    logic clk, in, out;

    // DUT
    dff_tb2 dut(.clk(clk), .d(in), .q(out));

    initial clk = 0;
    always #5 clk = ~clk;

    // Apply specified sequence from HDLBits waveform
    initial begin
        $display("=== Testbench2 ===");
        in = 0;
        @(negedge clk); in = 0;
        @(negedge clk); in = 1;
        @(negedge clk); in = 1;
        @(negedge clk); in = 0;
        @(negedge clk); in = 0;
        @(negedge clk); in = 1;
        @(negedge clk);
        $display("Sequence applied. Verify against HDLBits expected output.");
        $finish;
    end
endmodule

module dff_tb2(input logic clk, d, output logic q);
    always_ff @(posedge clk) q <= d;
endmodule
