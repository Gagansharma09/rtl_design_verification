// HDLBits: 4-digit BCD Adder
// https://hdlbits.01xz.net/wiki/bcdadd4
module bcd_adder4(
    input  logic [15:0] a, b,
    input  logic        cin,
    output logic [15:0] sum,
    output logic        cout
);
    logic [3:0] c;

    bcd_fadd digit0(.a(a[3:0]),   .b(b[3:0]),   .cin(cin),  .sum(sum[3:0]),   .cout(c[0]));
    bcd_fadd digit1(.a(a[7:4]),   .b(b[7:4]),   .cin(c[0]), .sum(sum[7:4]),   .cout(c[1]));
    bcd_fadd digit2(.a(a[11:8]),  .b(b[11:8]),  .cin(c[1]), .sum(sum[11:8]),  .cout(c[2]));
    bcd_fadd digit3(.a(a[15:12]), .b(b[15:12]), .cin(c[2]), .sum(sum[15:12]), .cout(cout));
endmodule

// Single-digit BCD full adder
module bcd_fadd(
    input  logic [3:0] a, b,
    input  logic       cin,
    output logic [3:0] sum,
    output logic       cout
);
    logic [4:0] raw;
    assign raw  = a + b + cin;
    assign cout = (raw >= 5'd10);
    assign sum  = cout ? (raw - 5'd10) : raw[3:0];
endmodule
