`timescale 1ns/1ps
module tb_adder3;
    logic [2:0] a, b, sum;
    logic       cin;
    logic [3:0] cout;
    int         errors = 0;

    adder3 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $display("=== 3-bit Adder Testbench ===");
        // Exhaustive test
        for (int i = 0; i < 128; i++) begin
            {a, b, cin} = i[6:0];
            #10;
            logic [3:0] expected = a + b + cin;
            if ({cout[3], sum} !== expected) begin
                $error("FAIL a=%0d b=%0d cin=%b | got=%0d exp=%0d",
                        a, b, cin, {cout[3],sum}, expected);
                errors++;
            end
        end
        if (errors == 0) $display("ALL %0d TESTS PASSED", 128);
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
