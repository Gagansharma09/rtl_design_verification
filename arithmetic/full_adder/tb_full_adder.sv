// Code your testbench here
// or browse Examples
//assertion based
module tb_full_adder;
        logic in1;
        logic in2;
        logic cin;
        logic cout;
        logic sum;
   //dut
  full_adder dut(
    .in1(in1),
    .in2(in2),
    .cin(cin),
    .cout(cout),
    .sum(sum)
  );
   //
   initial begin 
     for(int i =0;i<8;i++)begin
       {in1,in2,cin}=i;
     #1 
     $display("full_adder_testbench");
     #5
     assert(sum == (in1^in2^cin))
       $display("correct assignement of sum");
     else 
       $error("wrong assignement of sum");
     assert(cout == ((in1&in2)|(in2&cin)|(cin&in1)))
       $display("correct assignement of cout");
     else 
       $error("wrong assignement of cout");
     end
     $finish;
    end 
endmodule 

