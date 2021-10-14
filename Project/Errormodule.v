/* 	Author: Joshua Vardeleon
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| Error module:                                                                   |
	| Checks if there were errors on the divider, modulo or adder-subtractor. 01 is   |
	| is an overflow error, 10 is an overflow error                                   |
	-----------------------------------------------------------------------------------
*/
module ErrorModule(overflow, dividebyzeroDiv, dividebyzeroMod,errorCode);

//error outputs from adder subtractor, divider, and modulo
input overflow;
input dividebyzeroDiv;
input dividebyzeroMod;

output [1:0] errorCode;

//displays a 1 on the least significant bit if an error detected by the divider or Modulo module, otherwise will output 0
assign errorCode[0] =  dividebyzeroDiv || dividebyzeroMod;

//displays a 1 on the most significant bit if an error detected by the adder-subtractor
assign errorCode[1] = overflow;

endmodule
