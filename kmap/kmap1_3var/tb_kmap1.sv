`timescale 1ns/1ps
module tb_kmap1;
    logic a, b, c, out;
    int   errors = 0;

    kmap1 dut(.a(a), .b(b), .c(c), .out(out));

    // Reference model — directly from K-map specification
    function automatic logic ref_out(input logic ra, rb, rc);
        return ~rb | (ra ^ rc);
    endfunction

    initial begin
        $display("=== K-map 3-var Testbench ===");
        for (int i = 0; i < 8; i++) begin
            {a, b, c} = i[2:0]; #10;
            logic exp = ref_out(a, b, c);
            if (out !== exp) begin
                $error("FAIL a=%b b=%b c=%b | got=%b exp=%b", a,b,c,out,exp);
                errors++;
            end else
                $display("PASS a=%b b=%b c=%b => out=%b", a,b,c,out);
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
