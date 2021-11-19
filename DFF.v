//=============================================
// D Flip-Flop, Added in part3
// implemented in part 3 by Gabriela Saenz
//=============================================
module DFF(clk,in,out);
  parameter n=1;
  input  clk;
  input  [n-1:0]in;
  output [n-1:0]out;
  reg    [n-1:0]out;
  
  always @(posedge clk)//<--This is the statement that makes the circuit behave with TIME
  out =  in;
endmodule