`timescale 1ns/1ps
module tb_full_adder;
    logic a, b, cin, sum, cout;
    int   errors = 0;

    full_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $display("=== Full Adder Testbench ===");
        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = i[2:0];
            #10;
            logic [1:0] expected = a + b + cin;
            if ({cout, sum} !== expected) begin
                $error("FAIL a=%b b=%b cin=%b | got cout=%b sum=%b, exp %02b",
                        a, b, cin, cout, sum, expected);
                errors++;
            end else
                $display("PASS a=%b b=%b cin=%b => sum=%b cout=%b", a, b, cin, sum, cout);
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
