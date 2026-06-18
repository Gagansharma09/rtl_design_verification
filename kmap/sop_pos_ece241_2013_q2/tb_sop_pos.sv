`timescale 1ns/1ps
module tb_sop_pos;
    logic a, b, c, d, y, x;
    int   errors = 0;

    top_module dut(.a(a),.b(b),.c(c),.d(d),.y(y),.x(x));

    // Reference from SOP/POS expressions
    function automatic logic ref_y(input logic ra,rb,rc,rd);
        return (~rc&~rb) | (ra&rc) | (rb&rc&~ra);
    endfunction

    initial begin
        $display("=== SOP/POS Testbench (verify y output) ===");
        for (int i = 0; i < 16; i++) begin
            {a,b,c,d} = i[3:0]; #10;
            logic ey = ref_y(a,b,c,d);
            if (y !== ey) begin
                $error("FAIL abcd=%04b y=%b(exp %b)", i[3:0],y,ey);
                errors++;
            end
        end
        if (errors == 0) $display("y: ALL TESTS PASSED");
        else             $display("%0d y TEST(S) FAILED", errors);
        $finish;
    end
endmodule
