`timescale 1ns/1ps
module tb_fsm_serial;
    logic clk=0,reset,in,done; int errors=0;
    fsm_serial dut(.clk,.reset,.in,.done);
    always #5 clk=~clk;
    task send_byte(input logic [7:0] data);
        // start bit
        in=0; @(posedge clk); #1;
        for(int i=0;i<8;i++) begin in=data[i]; @(posedge clk); #1; end
        // stop bit
        in=1; @(posedge clk); #1;
    endtask
    initial begin
        $display("=== Serial Receiver Testbench ===");
        reset=1; in=1; @(posedge clk); #1; reset=0;
        send_byte(8'hA5);
        if(done!==1) begin $error("done not asserted after valid frame"); errors++; end
        send_byte(8'hFF);
        if(done!==1) begin $error("done not asserted second frame"); errors++; end
        if(errors==0) $display("ALL TESTS PASSED"); else $display("%0d FAILED",errors);
        $finish;
    end
endmodule
