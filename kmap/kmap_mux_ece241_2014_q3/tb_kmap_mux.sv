`timescale 1ns/1ps
module tb_kmap_mux;
    logic c, d, a, b;
    logic mux_in[4];
    logic f_actual, f_expected;
    int   errors = 0;

    top_module dut(.c(c),.d(d),.a(a),.b(b),.mux_in(mux_in));

    // Reconstruct function from mux
    function automatic logic mux_out(input logic ta,tb,tc,td, input logic mi[4]);
        case ({ta,tb})
            2'b00: mux_out = mi[0];
            2'b01: mux_out = mi[1];
            2'b10: mux_out = mi[2];
            2'b11: mux_out = mi[3];
        endcase
    endfunction

    initial begin
        $display("=== K-map MUX Testbench ===");
        $display("NOTE: Verify mux_in assignments against HDLBits K-map.");
        for (int i = 0; i < 16; i++) begin
            {a,b,c,d} = i[3:0]; #10;
            f_actual = mux_out(a,b,c,d,mux_in);
            $display("abcd=%04b mux_sel=%02b mux_in=[%b%b%b%b] f=%b",
                     {a,b,c,d},{a,b},mux_in[3],mux_in[2],mux_in[1],mux_in[0],f_actual);
        end
        $display("DONE — compare output to HDLBits expected truth table");
        $finish;
    end
endmodule
