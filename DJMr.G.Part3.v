/* 	Author: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
    Matthew Lineberry
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

`include "logic_operations.v"
`include "exponent.v"
`include "Arithmetic.v"
`include "DFF.v"
`include "Multiplexer-Decode-ErrorMode.v"

//=============================================

/*	-----------------------------------------------------------------------------------
	| ALU module:                                                                     |
	| Takes two 16-bit integers, 4 bit op code and will do multiplication,            |
    | addition, subtraction and division and Modulus on those 16 bit integer          |
    | depending on what the op code is                                                |
	-----------------------------------------------------------------------------------
*/
//----------------------------------------------------------------------
//ALU start, requires 2 16 bit inputs, 4 bit op code and the output of the ALU
module ALU(clk,inputP, inputQ, opCode, signedoutALU, errorCode);

input clk;		//Added in part3

//instiantiating inputs and output
input signed [31:0] inputP;
input signed [31:0] inputQ;
input signed [3:0] opCode;
output signed [31:0] outALU;
wire signed [31:0] inputP;
wire signed [31:0] inputQ;
wire signed [3:0] opCode;
reg [31:0] outALU;
output signed [31:0] signedoutALU;
reg  signed [31:0] signedoutALU;

//these inputs are used to connect arithmetic outputs into the multiplexer
wire [31:0] outMod;

wire [31:0] outDiv;

wire [31:0] outMult;

wire[31:0] outEX;

wire [31:0] outAddSub;
input mode;
output C;

//inputs and outputs for the error module
input divZeroMod;
input divZeroDiv;
input overflow;

output [1:0] errorCode;
//reg errorCode;

//AND Gate
wire [31:0] outAND;

//NAND Gate 
wire [31:0] outNAND;

//NOR Gate
wire [31:0] outNOR;

//NOT Gate
wire [31:0] outNOT;

//OR Gate 
wire [31:0] outOR;

//XNOR Gate 
wire [31:0] outXNOR;

//XOR Gate 
wire [31:0] outXOR;


//NO-OP
wire [31:0] feedback;
wire [31:0] outval;

//Multiplexer added in part3 
wire [15:0][31:0] channels;
wire [31:0] muxout;

//for the decoder
input [15:0] hotselect;

//calling all modules
DFF #(32) state_reg(clk,muxout,outval);

add_sub inst1(inputQ, inputP, opCode, mode, outAddSub, C, overflow); 
Modulo inst2(inputQ, inputP, outMod, divZeroMod); //calculating modulo outputs the results (outMod) and a divide by zero 2 bit code
Division inst3(inputQ, inputP, outDiv, divZeroDiv); //calculating division outputs the results (outDiv) and a divide by zero 2 bit code
Multiplication inst4(inputQ, feedback, outMult); //calculating multiplication outputs the results (outMult)
Decoder inst5(opCode, hotselect); //changes 4 bit op code to a 16 hot select code
ErrorModule inst6(overflow, divZeroDiv, divZeroMod, errorCode); //will output 00 if no error, 01 if there's a divide by zero, or a 10 if there's an overflow
exponent inst9(inputP, inputQ, outEX);

AND logic1(inputP, feedback, outAND); //AND Gate
NAND logic2(inputP, feedback, outNAND); //NAND Gate
NOR logic3(inputP, feedback, outNOR); //NOR Gate 
NOT logic4(inputP, feedback, outNOT); //NOT Gate
OR logic5(inputP, feedback, outOR); //OR Gate
XNOR logic6(inputP, feedback, outXNOR); //XNOR Gate
XOR logic7(inputP, feedback, outXOR); //XOR Gate 


//Added in part3
Multiplexer inst7(channels, hotselect, muxout);
assign channels[0] = outAddSub; //0000
assign channels[1] = outAddSub; //0001
assign channels[2] = outMult; //0010
assign channels[3] = outDiv; //0011
assign channels[4] = outMod; //0100
assign channels[5] = outAND; //0101
assign channels[6] = outNAND; //0110
assign channels[7] = outNOR; //0111
assign channels[8] = outNOT; //1000
assign channels[9] = outOR; //1001
assign channels[10] = outXNOR; //1010
assign channels[11] = outXOR; //1011
assign channels[12] = 32'b0; //1100
assign channels[13] = 32'b11111111111111111111111111111111; //1101
assign channels[14] = feedback; //1110
assign channels[15] = outEX; //1111

	//assign feedback = outval[15:0];

	always @(*)
	begin
	//-----------------------------
		signedoutALU = muxout;
	//-----------------------------
	end

	assign feedback = outval;


endmodule

