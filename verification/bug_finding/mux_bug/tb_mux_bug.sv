`timescale 1ns/1ps
module tb_mux_bug;
    logic sel,a,b,out; int errors=0;
    mux dut(.sel,.a,.b,.out);
    initial begin
        $display("=== Mux Bug Testbench ===");
        // Test all combinations
        for(int i=0;i<8;i++) begin
            {sel,a,b}=i[2:0]; #10;
            logic exp = sel ? b : a;
            if(out!==exp) begin $error("sel=%b a=%b b=%b out=%b exp=%b",sel,a,b,out,exp); errors++; end
        end
        if(errors==0) $display("ALL TESTS PASSED (bug fixed)");
        else          $display("%0d BUGS FOUND",errors);
        $finish;
    end
endmodule
