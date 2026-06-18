`timescale 1ns/1ps
module tb_adder100;
    logic [99:0] a, b, sum;
    logic        cin, cout;
    int          errors = 0;

    adder100 dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    task automatic check(input logic [99:0] ta, tb, input logic tcin);
        a = ta; b = tb; cin = tcin; #10;
        logic [100:0] exp = {1'b0,ta} + {1'b0,tb} + tcin;
        if ({cout,sum} !== exp) begin
            $error("FAIL a=%h b=%h cin=%b | got=%h exp=%h",ta,tb,tcin,{cout,sum},exp);
            errors++;
        end
    endtask

    initial begin
        $display("=== 100-bit Adder Testbench ===");
        check(100'h0, 100'h0, 0);
        check(100'hF, 100'hF, 0);
        check({100{1'b1}}, 100'h1, 0);        // max + 1 -> overflow
        check({100{1'b1}}, {100{1'b1}}, 1);   // all ones + all ones + cin
        check(100'hDEAD_BEEF, 100'hCAFE_BABE, 1);
        repeat (20) begin
            a   = $random; a = {$random,$random,$random,$random} & {100{1'b1}};
            b   = $random; b = {$random,$random,$random,$random} & {100{1'b1}};
            cin = $random;
            #10;
            logic [100:0] exp = {1'b0,a} + {1'b0,b} + cin;
            if ({cout,sum} !== exp) begin $error("RAND FAIL"); errors++; end
        end
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
