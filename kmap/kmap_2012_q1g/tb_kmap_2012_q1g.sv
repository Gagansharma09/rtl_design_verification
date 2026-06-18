`timescale 1ns/1ps
module tb_kmap_2012_q1g;
    logic [3:0] x;
    logic       f;
    int         errors = 0;

    top_module dut(.x(x), .f(f));

    function automatic logic ref_f(input logic [3:0] rx);
        return (~rx[1]&rx[2]) | (rx[1]&~rx[2]) | rx[3] | rx[4];
    endfunction

    initial begin
        $display("=== K-map 2012_q1g Testbench ===");
        for (int i = 0; i < 16; i++) begin
            x = i[3:0]+4'b0001; // x is 1-indexed
            x = i[3:0];
            #10;
            logic ef = ref_f(x);
            if (f !== ef) begin
                $error("FAIL x=%04b f=%b exp=%b", x,f,ef); errors++;
            end
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d FAILED", errors);
        $finish;
    end
endmodule
