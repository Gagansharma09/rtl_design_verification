`timescale 1ns/1ps
module tb_case_bug;
    logic [1:0] sel; logic [3:0] a,b,c,d,out; int errors=0;
    case_bug dut(.sel,.a,.b,.c,.d,.out);
    initial begin
        $display("=== Case Bug Testbench ===");
        a=4'h1; b=4'h2; c=4'h3; d=4'h4;
        sel=0; #10; if(out!==4'h1) begin $error("sel=0 fail"); errors++; end
        sel=1; #10; if(out!==4'h2) begin $error("sel=1 fail"); errors++; end
        sel=2; #10; if(out!==4'h3) begin $error("sel=2 fail"); errors++; end
        sel=3; #10; if(out!==4'h4) begin $error("sel=3 fail (missing case)"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d BUGS FOUND",errors);
        $finish;
    end
endmodule
