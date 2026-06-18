`timescale 1ns/1ps
module tb_kmap4;
    logic a, b, c, d, out;
    int   errors = 0;

    kmap4 dut(.a(a), .b(b), .c(c), .d(d), .out(out));

    // Only check non-don't-care minterms
    // Minterms: 0,2,5,6,7,8,10,13,14,15; Don't cares: 1,3,9,11
    // (from HDLBits kmap4 truth table)
    logic [15:0] truth = 16'b1110_0010_1110_0101; // bit[i] = out at minterm i
    logic [15:0] dc    = 16'b0000_1000_0000_1010; // don't care bits

    initial begin
        $display("=== K-map 4-var (kmap4) Testbench ===");
        for (int i = 0; i < 16; i++) begin
            {a,b,c,d} = i[3:0]; #10;
            if (!dc[i]) begin   // skip don't cares
                if (out !== truth[i]) begin
                    $error("FAIL abcd=%04b | got=%b exp=%b", i[3:0], out, truth[i]);
                    errors++;
                end else
                    $display("PASS abcd=%04b => out=%b", i[3:0], out);
            end else
                $display("SKIP abcd=%04b (don't care)", i[3:0]);
        end
        if (errors == 0) $display("ALL CARE-BIT TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
