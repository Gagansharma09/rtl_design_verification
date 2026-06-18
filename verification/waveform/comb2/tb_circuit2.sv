`timescale 1ns/1ps
// HDLBits: Testbench for combinational circuit 2
// Run simulation, observe waveform, then verify
module tb_circuit2;
    logic a, b, q;
    circuit2 dut(.a(a), .b(b), .q(q));
    initial begin
        $display("=== Circuit2 Waveform Testbench ===");
        $dumpfile("circuit2.vcd");
        $dumpvars(0, tb_circuit2);
        // Exhaustive 2-input test
        for(int i=0;i<4;i++) begin
            {a,b}=i[1:0]; #10;
            $display("a=%b b=%b => q=%b", a, b, q);
        end
        $display("Verify against HDLBits expected waveform");
        $finish;
    end
endmodule
