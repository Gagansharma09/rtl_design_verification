// Code your design here
module full_adder(
      input logic in1,
      input logic in2,
      input logic cin,
      output logic cout,
  output logic sum);
      
//assignement
  assign sum = in1 ^in2 ^cin;
  assign cout = (in1&in2)|(in2&cin)|(cin&in1);
     
endmodule 
