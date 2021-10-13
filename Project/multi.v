/* 	Author: Matthew Lineberry
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| Multiplication Module:                                                          |   
	| Takes two 16-bit integers as input and outputs a 32-bit integer that is the     |
	| product of the two integers.                                                    |
	-----------------------------------------------------------------------------------
*/
module Multiplication (inputP, inputQ, product);

	
	input [15:0] inputP, inputQ; // 16-bit inputs
	output [31:0] product; //32-bit output
	reg [31:0] product; 
	
	always @ (inputP, inputQ, product) begin
		
	
		product = inputP * inputQ; // Calculate product

	end
	
endmodule 
