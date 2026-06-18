`timescale 1ns/1ps
module tb_kmap_m2014_q3;
    logic [4:1] x;
    logic       f;
    int         errors = 0;

    top_module dut(.x(x), .f(f));

    function automatic logic ref_f(input logic [4:1] rx);
        return (~rx[1]&rx[3]) | (rx[1]&~rx[3]) | (rx[2]&rx[4]) | (~rx[2]&~rx[4]);
    endfunction

    initial begin
        $display("=== K-map m2014_q3 Testbench ===");
        for (int i = 0; i < 16; i++) begin
            x = i[3:0]+1; #10;
            logic [4:1] xi; xi = i[3:0]+1; // not clean, use direct
            x[4]=i[3]; x[3]=i[2]; x[2]=i[1]; x[1]=i[0]; #10;
            logic ef = ref_f(x);
            if (f !== ef) begin
                $error("FAIL x=%04b | f=%b exp=%b", x, f, ef);
                errors++;
            end
        end
        if (errors == 0) $display("ALL 16 TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
