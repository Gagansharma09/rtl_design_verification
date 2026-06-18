`timescale 1ns/1ps
module tb_half_adder;
    logic a, b, sum, cout;

    half_adder dut(.a(a), .b(b), .sum(sum), .cout(cout));

    // Expected values
    logic exp_sum, exp_cout;
    int   errors = 0;

    initial begin
        $display("=== Half Adder Testbench ===");
        for (int i = 0; i < 4; i++) begin
            {a, b} = i[1:0];
            #10;
            exp_sum  = a ^ b;
            exp_cout = a & b;
            if (sum !== exp_sum || cout !== exp_cout) begin
                $error("FAIL a=%b b=%b | sum=%b(exp %b) cout=%b(exp %b)",
                        a, b, sum, exp_sum, cout, exp_cout);
                errors++;
            end else begin
                $display("PASS a=%b b=%b => sum=%b cout=%b", a, b, sum, cout);
            end
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
