`timescale 1ns/1ps
module tb_bcd_adder4;
    logic [15:0] a, b, sum;
    logic        cin, cout;
    int          errors = 0;

    bcd_adder4 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    // Convert 16-bit BCD to integer
    function automatic int bcd_to_int(input logic [15:0] v);
        return v[15:12]*1000 + v[11:8]*100 + v[7:4]*10 + v[3:0];
    endfunction

    // Convert integer to BCD (up to 9999)
    function automatic logic [15:0] int_to_bcd(input int v);
        int_to_bcd[15:12] = (v / 1000) % 10;
        int_to_bcd[11:8]  = (v / 100)  % 10;
        int_to_bcd[7:4]   = (v / 10)   % 10;
        int_to_bcd[3:0]   =  v         % 10;
    endfunction

    task automatic check(input int ia, ib, input logic tcin);
        a   = int_to_bcd(ia);
        b   = int_to_bcd(ib);
        cin = tcin;
        #10;
        int exp_val   = ia + ib + tcin;
        int exp_cout  = (exp_val >= 10000) ? 1 : 0;
        int exp_sum_v = exp_val % 10000;
        logic [15:0] exp_sum = int_to_bcd(exp_sum_v);
        if (sum !== exp_sum || cout !== exp_cout) begin
            $error("FAIL %0d + %0d + %b | got=%h(cout=%b) exp=%h(cout=%b)",
                    ia, ib, tcin, sum, cout, exp_sum, exp_cout);
            errors++;
        end else
            $display("PASS %0d + %0d + %b = %0d (cout=%b)", ia, ib, tcin, exp_val, cout);
    endtask

    initial begin
        $display("=== BCD Adder4 Testbench ===");
        check(0,    0,    0);
        check(9,    1,    0);   // single digit carry
        check(99,   1,    0);   // multi-digit carry
        check(999,  1,    0);
        check(9999, 1,    0);   // overflow into cout
        check(1234, 5678, 0);
        check(9999, 9999, 1);   // maximum
        check(1000, 2000, 1);
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
