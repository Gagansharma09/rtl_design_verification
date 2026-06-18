`timescale 1ns/1ps
module tb_signed_overflow;
    logic [7:0] a, b;
    logic       s, overflow;
    int         errors = 0;

    signed_overflow dut(.a(a), .b(b), .s(s), .overflow(overflow));

    task automatic check(input logic [7:0] ta, tb,
                         input logic exp_s, exp_ov);
        a = ta; b = tb; #10;
        if (s !== exp_s || overflow !== exp_ov) begin
            $error("FAIL a=%0d b=%0d | s=%b(exp %b) ov=%b(exp %b)",
                    signed'(ta), signed'(tb), s, exp_s, overflow, exp_ov);
            errors++;
        end else
            $display("PASS a=%4d b=%4d => s=%b ov=%b",
                     signed'(ta), signed'(tb), s, overflow);
    endtask

    initial begin
        $display("=== Signed Overflow Testbench ===");
        check(8'd100,  8'd27,  1'b0, 1'b0);  // 127 — no overflow
        check(8'd100,  8'd28,  1'b1, 1'b1);  // 128 — overflow (positive → negative)
        check(8'hFF,   8'hFF,  1'b1, 1'b0);  // -1 + -1 = -2 — no overflow
        check(8'h80,   8'hFF,  1'b0, 1'b1);  // -128 + (-1) wraps — overflow
        check(8'd0,    8'd0,   1'b0, 1'b0);  // 0 + 0
        check(8'h7F,   8'h00,  1'b0, 1'b0);  // 127 + 0 = 127
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
