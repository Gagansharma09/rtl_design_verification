`timescale 1ns/1ps
module tb_nand_bug;
    logic a,b,c,out; int errors=0;
    nand3 dut(.a,.b,.c,.out);
    initial begin
        $display("=== NAND3 Bug Testbench ===");
        for(int i=0;i<8;i++) begin
            {a,b,c}=i[2:0]; #10;
            logic exp = ~(a&b&c);
            if(out!==exp) begin $error("abc=%03b out=%b exp=%b",i[2:0],out,exp); errors++; end
        end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d BUGS FOUND",errors);
        $finish;
    end
endmodule
