`timescale 1ns/1ps
module tb_adder_m2014_q4j;
    logic a, b, cin, sum, cout;
    int   errors = 0;

    full_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $display("=== Adder m2014_q4j Testbench ===");
        for (int i = 0; i < 8; i++) begin
            {a, b, cin} = i[2:0];
            #10;
            logic [1:0] exp = a + b + cin;
            if ({cout, sum} !== exp) begin
                $error("FAIL a=%b b=%b cin=%b got=%02b exp=%02b", a,b,cin,{cout,sum},exp);
                errors++;
            end
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
