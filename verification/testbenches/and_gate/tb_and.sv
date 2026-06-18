// HDLBits: AND gate testbench with self-checking
// https://hdlbits.01xz.net/wiki/tb/and
`timescale 1ns/1ps
module tb_and;
    logic a, b, q;
    int   errors = 0;

    // Instantiate the AND gate (HDLBits: andgate module)
    andgate dut(.a(a), .b(b), .out(q));

    initial begin
        $display("=== AND Gate Testbench ===");
        for (int i = 0; i < 4; i++) begin
            {a, b} = i[1:0];
            #10;
            logic exp = a & b;
            if (q !== exp) begin
                $error("FAIL a=%b b=%b out=%b exp=%b", a, b, q, exp);
                errors++;
            end else
                $display("PASS a=%b b=%b => %b", a, b, q);
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule

module andgate(input logic a, b, output logic out);
    assign out = a & b;
endmodule
