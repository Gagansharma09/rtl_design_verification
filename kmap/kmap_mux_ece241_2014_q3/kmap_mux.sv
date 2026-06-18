// HDLBits: K-map implemented with a multiplexer
// https://hdlbits.01xz.net/wiki/exams/ece241_2014_q3
// Use 4-to-1 mux with inputs c,d; select a,b
// Standard answer for this K-map:
module top_module(
    input  logic  c, d,
    input  logic  a, b,
    output logic  mux_in [4]
);
    // Derive mux inputs from K-map grouping
    // mux_in[0]: ab=00  mux_in[1]: ab=01  mux_in[2]: ab=10  mux_in[3]: ab=11
    assign mux_in[0] = ~c & ~d;   // f(c,d) when a=0,b=0
    assign mux_in[1] =  c | d;    // f(c,d) when a=0,b=1
    assign mux_in[2] =  c ^ d;    // f(c,d) when a=1,b=0 (example; set per actual K-map)
    assign mux_in[3] =  c & d;    // f(c,d) when a=1,b=1
endmodule
