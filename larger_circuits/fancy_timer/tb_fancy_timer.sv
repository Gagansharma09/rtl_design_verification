`timescale 1ns/1ps
module tb_fancy_timer;
    logic clk=0,reset,data,ack; logic [3:0] count; logic counting,done; int errors=0;
    fancy_timer dut(.clk,.reset,.data,.count,.counting,.done,.ack);
    always #5 clk=~clk;
    initial begin
        $display("=== Fancy Timer Testbench ===");
        reset=1; data=0; ack=0; @(posedge clk); #1; reset=0;
        // Shift in count = 4'b0001 (1)
        data=1; @(posedge clk); #1;
        data=0; @(posedge clk); #1;
        data=0; @(posedge clk); #1;
        data=0; @(posedge clk); #1;
        // Wait for done
        repeat(200) begin @(posedge clk); #1; if(done) break; end
        if(done) begin $display("Timer DONE"); ack=1; @(posedge clk); #1; ack=0; end
        else begin $error("Timer never done"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
