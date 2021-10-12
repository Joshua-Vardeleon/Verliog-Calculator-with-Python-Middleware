module multiplication (inputA, inputB, product);

	
	input [16:0] inputA, inputB; // 16-bit inputs
	output [32:0] product; //32-bit output
	reg [32:0] product; 
	
	always @ (inputA, inputB, product) begin
		
	
		product = inputA * inputB; // Calculate product

	end
	
endmodule 
