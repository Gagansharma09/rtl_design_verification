// Code your testbench here
// or browse Examples
// self cheking one till now 
module tb_half_adder;
    logic a;
    logic b;
    logic cout;
    logic sum;

 //dut 
  half_adder dut(
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout));
 //stimulus 
  initial begin
    $display("a,b,cout,sum");
    a = 0 ;b = 0;
    #10
    if(sum!=(a^b))
      $error(" sum mismatch");
    if(cout!=(a&b))
      $error("cout mismatch");
    $display("%b %b | %b %b",a,b,cout,sum);
    a = 0 ;b = 1;
    #10
    if(sum!=(a^b))
      $error(" sum mismatch");
    if(cout!=(a&b))
      $error("cout mismatch");
    $display("%b %b | %b %b",a,b,cout,sum);
    a = 1 ;b = 0;
    #10
    if(sum!=(a^b))
      $error(" sum mismatch");
    if(cout!=(a&b))
      $error("cout mismatch");
    $display("%b %b | %b %b",a,b,cout,sum);
    a = 1 ;b = 1;
    #10
    if(sum!=(a^b))
      $error(" sum mismatch");
    if(cout!=(a&b))
      $error("cout mismatch");
    $display("%b %b | %b %b",a,b,cout,sum);
    #10

    $finish;
  end
endmodule 

  
