`timescale 1ns/1ps
module tb_lut3;
    logic clk=0; logic [2:0] a; logic z;
    lut3 dut(.clk,.a,.z);
    always #5 clk=~clk;
    initial begin
        $display("=== LUT3 Testbench ===");
        $display("NOTE: Load LUT contents via 8 shift cycles before testing");
        // This is a structural/behavioral testbench placeholder
        // Actual HDLBits problem requires loading LUT via serial input
        repeat(20) begin
            a=$random[2:0]; @(posedge clk); #1;
            $display("a=%0d z=%b",a,z);
        end
        $finish;
    end
endmodule
