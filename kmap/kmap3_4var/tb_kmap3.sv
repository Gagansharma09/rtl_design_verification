`timescale 1ns/1ps
module tb_kmap3;
    logic a, b, c, d, out;
    int   errors = 0;

    kmap3 dut(.a(a), .b(b), .c(c), .d(d), .out(out));

    function automatic logic ref_out(input logic ra,rb,rc,rd);
        return (ra&rc) | (ra&~rb) | (~ra&rb&~rd) | (~rb&~rc);
    endfunction

    initial begin
        $display("=== K-map 4-var (kmap3) Testbench ===");
        for (int i = 0; i < 16; i++) begin
            {a,b,c,d} = i[3:0]; #10;
            logic exp = ref_out(a,b,c,d);
            if (out !== exp) begin
                $error("FAIL abcd=%04b | got=%b exp=%b", i[3:0], out, exp);
                errors++;
            end
        end
        if (errors == 0) $display("ALL 16 TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
