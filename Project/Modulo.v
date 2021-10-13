/* 	Author: Joshua Vardeleon
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| Modulo module:                                                                  |
	| Takes two 16 bit input and uses them to calculate their Modulus, this module    |
	| This module will output a 32 bit integer which is the results of the modulus    |
	-----------------------------------------------------------------------------------
*/

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
