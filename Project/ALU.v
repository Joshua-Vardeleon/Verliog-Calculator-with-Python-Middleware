/* 	Author: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
    Matthew Lineberry
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| ALU module:                                                                     |
	| Takes two 16-bit integers, 4 bit op code and will do multiplication,            |
    | addition, subtraction and division and Modulus on those 16 bit integer          |
    | depending on what the op code is                                                |
	-----------------------------------------------------------------------------------
*/


//imported needed module
`include "decoder.v"
`include "division_module.v"
`include "Modulo.v"
`include "multi.v"
`include "Multiplexer.v"
`include "AdderSub.v"
//ALU start, requires 2 16 bit inputs, 4 bit op code and the output of the ALU
module ALU(inputP, inputQ, opCode, outALU);

//instiantiating inputs and output
input [15:0] inputP;
input [15:0] inputQ;

input [3:0] opCode;

output [31:0] outALU;

//these inputs are used to connect arithmetic outputs into the multiplexer
input [31:0] outMod;

input [31:0] outDiv;

input [31:0] outMult;

input [31:0] outAddsub;

//outputs for the error module
output divZeroMod;

output divZeroDiv;

output overflow;


//for the decoder
input [15:0] hotselect;

//calling all modules
AddSub inst0(inputP, inputQ, 1'b0, outAddsub, overflow);
Modulo inst2(inputP, inputQ, outMod, divZeroMod); //calculating modulo outputs the results (outMod) and a divide by zero 2 bit code
Division inst3(inputP, inputQ, outDiv, divZeroDiv); //calculating division outputs the results (outDiv) and a divide by zero 2 bit code
Multiplication inst4(inputP, inputQ, outMult); //calculating multiplication outputs the results (outMult)
Decoder inst5(opCode, hotselect);


Multiplexer inst6(outAddsub, outAddsub, outMult, outDiv, outMod, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 
32'b0, 32'b0, 32'b0, 32'b0,hotselect, outALU); //multiplexer, for opcodes multiplication 0000, division 0001, Modulus 0010


 endmodule

module testbench();
	
	// Declaring inputs and outputs
	reg [15:0] inputP;
    reg [15:0] inputQ;
    reg [3:0] opCode;
    wire [31:0] outALU;
  ALU electricity1(inputP, inputQ, opCode, outALU); // Declare 'multiplication' module

	initial begin
		//
		assign inputP = 16'b11111;	// # 31
		assign inputQ = 16'b0011;	// # 3
        assign opCode = 4'b0000;
		
		#90;
		
		// Display results
		$display("A: %1d", inputP);
		$display("B: %1d", inputQ);
        $display("opCode: %1d", opCode);
		$display("outALU: %1d", outALU);
		$display("\n");

		$finish; 
	end

endmodule 