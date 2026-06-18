module half_adder(
     input logic a,
     input logic b ,
    output logic cout,sum);
     
    
      assign  sum = a ^ b;
      assign  cout = a & b;
    
endmodule 
