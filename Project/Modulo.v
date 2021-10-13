module Modulo(inputP,inputQ, outMod, divZero);

	
	input [15:0] inputP, inputQ; // 16-bit inputs
	output [31:0] outMod; //32-bit output
	reg [31:0] outMod;
    output [1:0] divZero;
    reg [1:0] divZero;
	
	always @ (inputP, inputQ, outMod) begin
		
		
		outMod = inputP % inputQ; // calculates modulo

	end
	
    always @ (inputQ, divZero) begin //checks for divide by zero
    if(!inputQ) 
        assign divZero = 2'b01;
	else 
		assign divZero = 2'b00;
	end
endmodule 
