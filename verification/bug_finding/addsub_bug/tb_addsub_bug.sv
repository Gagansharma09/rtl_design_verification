`timescale 1ns/1ps
module tb_addsub_bug;
    logic [7:0] a,b,out; logic sub,overflow,zero; int errors=0;
    add_sub dut(.a,.b,.sub,.out,.overflow,.zero);
    initial begin
        $display("=== Add/Sub Bug Testbench ===");
        a=8'd100; b=8'd27; sub=0; #10;
        if(out!==127 || zero!==0) begin $error("add basic fail"); errors++; end
        a=8'd5; b=8'd5; sub=1; #10;
        if(out!==0 || zero!==1) begin $error("sub zero fail out=%0d zero=%b",out,zero); errors++; end
        if(errors==0) $display("TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
