//imported needed module
//------------------------------------`include "decoder.v"
/* 	Author: Joshua Vardeleon
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| Decoder module:                                                                 |
	| Changes the 4 bit opcode to a 16 bit hotselect code                             | 
	-----------------------------------------------------------------------------------
*/


module Decoder(opCode, hotselect);
//inputs and outputs
input [3:0] opCode;
output [15:0] hotselect;
reg [15:0] hotselect;

//uses cases to determine which should be outputted
always @ (opCode)
    case(opCode)
    4'b0000 : assign hotselect = 16'b0000000000000001;
    4'b0001 : assign hotselect = 16'b0000000000000010;
    4'b0010 : assign hotselect = 16'b0000000000000100;
    4'b0011 : assign hotselect = 16'b0000000000001000;
    4'b0100 : assign hotselect = 16'b0000000000010000;
    4'b0101 : assign hotselect = 16'b0000000000100000;
    4'b0110 : assign hotselect = 16'b0000000001000000;
    4'b0111 : assign hotselect = 16'b0000000010000000;
    4'b1000 : assign hotselect = 16'b0000000100000000;
    4'b1001 : assign hotselect = 16'b0000001000000000;
    4'b1010 : assign hotselect = 16'b0000010000000000;
    4'b1011 : assign hotselect = 16'b0000100000000000;
    4'b1100 : assign hotselect = 16'b0001000000000000;
    4'b1101 : assign hotselect = 16'b0010000000000000;
    4'b1110 : assign hotselect = 16'b0100000000000000;
    4'b1111 : assign hotselect = 16'b1000000000000000;
    endcase
endmodule



//------------------------------------------------------------
/* 	Author: Gabriela Saenz
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*  -----------------------------------------------------------------------------------
	| Multiplexer Module:                                                             |   
    | This module is used to decide what output will be selected determined by a 16   |
	| a 16 bit number called a Hot-Select                                             |
	-----------------------------------------------------------------------------------
*/

module Multiplexer(channels, hotselect, muxout);
input [15:0][31:0] channels;
input      [15:0] hotselect;
output      [31:0] muxout;
//wire  [15:0][31:0] channels;
//wire        [31:0] muxout;


	assign muxout = ({32{hotselect[15]}} & channels[15]) | //GRND
               ({32{hotselect[14]}} & channels[14]) | //NO-OP
			   ({32{hotselect[13]}} & channels[13]) | //Pre-set
			   ({32{hotselect[12]}} & channels[12]) |
			   ({32{hotselect[11]}} & channels[11]) |
			   ({32{hotselect[10]}} & channels[10]) |
			   ({32{hotselect[ 9]}} & channels[ 9]) |
			   ({32{hotselect[ 8]}} & channels[ 8]) |
			   ({32{hotselect[ 7]}} & channels[ 7]) | 
			   ({32{hotselect[ 6]}} & channels[ 6]) | 
			   ({32{hotselect[ 5]}} & channels[ 5]) | //AND
			   ({32{hotselect[ 4]}} & channels[ 4]) | //MOD
			   ({32{hotselect[ 3]}} & channels[ 3]) | //DIV
			   ({32{hotselect[ 2]}} & channels[ 2]) | //MULT
               ({32{hotselect[ 1]}} & channels[ 1]) | //SUB
               ({32{hotselect[ 0]}} & channels[ 0]) ;//ADD

endmodule

//-------------------------------------------------------------------
//----------------------------------------------`include "Errormodule.v"
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