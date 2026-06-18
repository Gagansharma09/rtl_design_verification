`timescale 1ns/1ps
// HDLBits: Testbench for combinational circuit 6
// Run simulation, observe waveform, then verify
module tb_circuit6;
    logic a, b, q;
    circuit6 dut(.a(a), .b(b), .q(q));
    initial begin
        $display("=== Circuit6 Waveform Testbench ===");
        $dumpfile("circuit6.vcd");
        $dumpvars(0, tb_circuit6);
        // Exhaustive 2-input test
        for(int i=0;i<4;i++) begin
            {a,b}=i[1:0]; #10;
            $display("a=%b b=%b => q=%b", a, b, q);
        end
        $display("Verify against HDLBits expected waveform");
        $finish;
    end
endmodule
