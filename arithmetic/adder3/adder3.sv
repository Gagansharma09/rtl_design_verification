// HDLBits: 3-bit Binary Adder (using 3 full adders)
// https://hdlbits.01xz.net/wiki/adder3
module adder3(
    input  logic [2:0] a, b,
    input  logic       cin,
    output logic [2:0] sum,
    output logic [3:0] cout
);
    // Instantiate 3 full adders, expose all carry bits
    full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin),     .sum(sum[0]), .cout(cout[1]));
    full_adder fa1(.a(a[1]), .b(b[1]), .cin(cout[1]), .sum(sum[1]), .cout(cout[2]));
    full_adder fa2(.a(a[2]), .b(b[2]), .cin(cout[2]), .sum(sum[2]), .cout(cout[3]));
    assign cout[0] = cin;
endmodule

// Embedded full_adder for standalone simulation
module full_adder(
    input  logic a, b, cin,
    output logic sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
