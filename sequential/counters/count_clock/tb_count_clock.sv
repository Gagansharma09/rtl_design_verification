`timescale 1ns/1ps
module tb_count_clock;
    logic clk=0,reset; logic [7:0] hh,mm,ss; logic pm; int errors=0;
    count_clock dut(.clk,.reset,.hh,.mm,.ss,.pm);
    always #5 clk=~clk;
    initial begin
        $display("=== 12-hour Clock Testbench ===");
        reset=1; @(posedge clk); #1; reset=0;
        if(hh!==8'h12||mm!==0||ss!==0||pm!==0) begin
            $error("reset: hh=%h mm=%h ss=%h pm=%b",hh,mm,ss,pm); errors++;
        end
        // Advance 60 seconds
        repeat(60) @(posedge clk); #1;
        if(mm!==8'h01||ss!==8'h00) begin $error("1min fail mm=%h ss=%h",mm,ss); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
