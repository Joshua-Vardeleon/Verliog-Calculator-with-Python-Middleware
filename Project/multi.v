module Multiplication (inputP, inputQ, product);

	
	input [15:0] inputP, inputQ; // 16-bit inputs
	output [31:0] product; //32-bit output
	reg [31:0] product; 
	
	always @ (inputP, inputQ, product) begin
		
	
		product = inputP * inputQ; // Calculate product

	end
	
endmodule 
