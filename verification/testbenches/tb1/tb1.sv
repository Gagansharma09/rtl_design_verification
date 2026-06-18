// HDLBits: Testbench1 — apply all input combinations and check outputs
// https://hdlbits.01xz.net/wiki/tb/tb1
`timescale 1ns/1ps
module tb1;
    logic a, b, q;

    // DUT (AND gate as example from HDLBits)
    and_gate dut(.a(a), .b(b), .q(q));

    initial begin
        $display("=== Testbench1 ===");
        {a,b}=2'b00; #10;
        {a,b}=2'b01; #10;
        {a,b}=2'b10; #10;
        {a,b}=2'b11; #10;
        $display("Done. Check waveform or add assertions.");
        $finish;
    end
endmodule

// Placeholder DUT (replace with actual HDLBits module)
module and_gate(input logic a, b, output logic q);
    assign q = a & b;
endmodule
