module exponent(inputP, inputQ, outEX);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outEX;
	reg [31:0] outEX;


	// Perform XOR operation on inputs
	always @ (inputP, inputQ, outEX) begin
		
		outEX = inputP ** inputQ;

	end
	

endmodule  


