// HDLBits: T flip-flop testbench
// https://hdlbits.01xz.net/wiki/tb/tff
`timescale 1ns/1ps
module tb_tff;
    logic clk, reset, t, q;
    int   errors = 0;

    tff dut(.clk(clk), .reset(reset), .t(t), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    task tick(input logic tt, input logic expected);
        t = tt;
        @(posedge clk); #1;
        if (q !== expected) begin
            $error("FAIL t=%b q=%b exp=%b", tt, q, expected);
            errors++;
        end else
            $display("PASS t=%b => q=%b", tt, q);
    endtask

    initial begin
        $display("=== T Flip-Flop Testbench ===");
        reset = 1; t = 0;
        @(posedge clk); #1; reset = 0;
        if (q !== 0) begin $error("reset fail"); errors++; end
        tick(1, 1);   // T=1: toggle 0->1
        tick(0, 1);   // T=0: hold
        tick(1, 0);   // T=1: toggle 1->0
        tick(1, 1);   // T=1: toggle 0->1
        tick(0, 1);   // T=0: hold
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule

// T flip-flop implementation
module tff(
    input  logic clk, reset, t,
    output logic q
);
    always_ff @(posedge clk)
        if (reset) q <= 0;
        else       q <= t ? ~q : q;
endmodule
