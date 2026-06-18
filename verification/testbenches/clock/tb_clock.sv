// HDLBits: Clock testbench — generate a 50MHz clock with initial reset
// https://hdlbits.01xz.net/wiki/tb/clock
`timescale 1ns/1ps
module tb_clock;
    logic clk;

    // 50 MHz clock: period = 20ns
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        $display("=== Clock TB ===");
        repeat(10) @(posedge clk);
        $display("10 clock cycles completed");
        $finish;
    end
endmodule
