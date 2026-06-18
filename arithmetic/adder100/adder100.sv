// HDLBits: 100-bit Binary Adder
// https://hdlbits.01xz.net/wiki/adder100
module adder100(
    input  logic [99:0] a, b,
    input  logic        cin,
    output logic [99:0] sum,
    output logic        cout
);
    assign {cout, sum} = a + b + cin;
endmodule
