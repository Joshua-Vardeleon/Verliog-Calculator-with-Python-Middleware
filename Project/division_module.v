/* 	Author: Reg Gonzalez
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| Division module:															      |
	| Takes two 16-bit integers as input and outputs a 32-bit integer that is the	  |
	| quotient of the two integers. 												  |
	-----------------------------------------------------------------------------------
*/
module division (inputP, inputQ, quotient, divideByZero);

	// 16-bit inputs
	input [16:0] inputP;
	input [16:0] inputQ;
	//32-bit output
	output [32:0] quotient;
	reg [32:0] quotient;
	// Divide by zero output
	output [1:0] divideByZero;
	reg [1:0] divideByZero;
	
	
	// Checks to see if the second input is a 0 (i.e., divide by zero error)
	always @ (inputQ, divideByZero) begin 
		if(inputQ == 0)
			// If second input is 0, then assign 1 to 'divideByZero'
			assign divideByZero = 2'b01;
		else 
			// If second input is not 0, then assign 0 to 'divideByZero'
			assign divideByZero = 2'b00;
	end
	
	
	// Calculate quotient
	always @ (inputP, inputQ, quotient) begin
		
		quotient = inputP / inputQ;

	end
	
endmodule 
