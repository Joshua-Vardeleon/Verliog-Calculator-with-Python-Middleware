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
//--------------------------------------------------------
//------------------------------`include "division_module.v"
/* 	Author: Reg Gonzalez
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------------
	| Division module:                                                                |
	| Takes two 16-bit integers as input and outputs a 32-bit integer that is the     |
	| quotient of the two integers.                                                   |
	-----------------------------------------------------------------------------------
*/
module Division (inputP, inputQ, quotient, divideByZero);

	// 16-bit inputs
	input [15:0] inputP;
	input [15:0] inputQ;
	//32-bit output
	output [31:0] quotient;
	reg [31:0] quotient;
	// Divide by zero output
	output divideByZero;
	reg divideByZero;
	
	
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
//----------------------------------------------------------
//--------------------------------------`include "Modulo.v"
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
    output divZero;
    reg divZero;
	
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
//---------------------------------------------------------
//----------------------------------------`include "multi.v"
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
//------------------------------------------------------------
//---------------------------------`include "Multiplexer.v"
/* 	Author: Joshua Vardeleon, Gabriela Saenz
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*      -----------------------------------------------------------------------------------
	| Multiplexer Module:                                                             |   
        | This module is used to decide what output will be selected determined by a 16   |
	| a 16 bit number called a Hot-Select                                             |
	-----------------------------------------------------------------------------------
*/
module Multiplexer(input0, input1, input2, input3, input4, input5, input6, input7, input8, 
                  input9, input10, input11, input12, input13, input14, input15, hotselect, muxout);

   //inputs and outputs
    input [31:0] input0,
    input1,
    input2,
    input3,
    input4,
    input5,
    input6,
    input7,
    input8,
    input9,
    input10,
    input11,
    input12,
    input13,
    input14,
    input15;
    input [15:0] hotselect;
    output [31:0] muxout;
    reg [31:0] muxout;
    
//case function to select which port the mux will use to output based on the hot select
always @ (hotselect)
        case(hotselect)
        16'b0000000000000001 : assign muxout = input0;
        16'b0000000000000010 : assign muxout = input1;
        16'b0000000000000100 : assign muxout = input2;
        16'b0000000000001000 : assign muxout = input3;
        16'b0000000000010000 : assign muxout = input4;
        16'b0000000000100000 : assign muxout = input5;
        16'b0000000001000000 : assign muxout = input6;
        16'b0000000010000000 : assign muxout = input7;
        16'b0000000100000000 : assign muxout = input8;
        16'b0000001000000000 : assign muxout = input9;
        16'b0000010000000000 : assign muxout = input10;
        16'b0000100000000000 : assign muxout = input11;
        16'b0001000000000000 : assign muxout = input12;
        16'b0010000000000000 : assign muxout = input13;
        16'b0100000000000000 : assign muxout = input14;
        16'b1000000000000000 : assign muxout = input15;
        

        endcase
endmodule
//--------------------------------------------------------
//-----------------------------------------------`include "add-sub.v"
/* Project Part2
 * Author: Gabriela Saenz
 * Cohort Members: Gabriela Saenz, Reg Gonzalez, Desh Padmakumar, Joshua Vardelon, and Matthew Lineberry
 * Cohort Name: DJMr.G 
 * Class: CS4341.502
 * Due Date: 10/11/2021
 */
 
/*
    Adder-Subtractor module is built in structured code. Module takes
    Two 16-bit integers and a mode to determine which operation to perform.
    The 32-bit output will be either the S or difference of the two inputs.

    Adder-subtractor module written by Gabriela Saenz 
 */

module add_sub (inputP, inputQ, Command, mode, S, C, O); //put C, O, back into parameters

        input [3:0] Command;
        

        //Two 16-bit inputs
        input [15:0]    inputP;
        input [15:0]    inputQ;
        //if mode is 1, sub. if mode is 0, add.
        inout           mode;
        //32-bit result of add_sub
        output [31:0]   S;
        wire [31:0]      S;
        //Carry status
        output          C;
        wire             C;
        //Overflow status
        output          O;
        wire             O;

        command_mode cmd(Command, mode);

        //Each C(n) serves as the Carry out bit for the current full_adder 
        //And the Carry in bit for the nexy full_adder
        //The final carry, C15, generates the output C.
        wire            C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15;

        wire            Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;

        assign Q0 = inputQ[0]^mode;
        assign Q1 = inputQ[1]^mode;
        assign Q2 = inputQ[2]^mode;
        assign Q3 = inputQ[3]^mode;
        assign Q4 = inputQ[4]^mode;
        assign Q5 = inputQ[5]^mode;
        assign Q6 = inputQ[6]^mode;
        assign Q7 = inputQ[7]^mode;
        assign Q8 = inputQ[8]^mode;
        assign Q9 = inputQ[9]^mode;
        assign Q10 = inputQ[10]^mode;
        assign Q11 = inputQ[11]^mode;
        assign Q12 = inputQ[12]^mode;
        assign Q13 = inputQ[13]^mode;
        assign Q14 = inputQ[14]^mode;
        assign Q15 = inputQ[15]^mode;
        assign C = C15^mode;

        full_adder fa0(.S(S[0]), .Cout(C0), .inputP(inputP[0]), .inputQ(Q0), .Cin(mode));
        full_adder fa1(.S(S[1]), .Cout(C1), .inputP(inputP[1]), .inputQ(Q1), .Cin(C0));
        full_adder fa2(.S(S[2]), .Cout(C2), .inputP(inputP[2]), .inputQ(Q2), .Cin(C1));
        full_adder fa3(.S(S[3]), .Cout(C3), .inputP(inputP[3]), .inputQ(Q3), .Cin(C2));
        full_adder fa4(.S(S[4]), .Cout(C4), .inputP(inputP[4]), .inputQ(Q4), .Cin(C3));
        full_adder fa5(.S(S[5]), .Cout(C5), .inputP(inputP[5]), .inputQ(Q5), .Cin(C4));
        full_adder fa6(.S(S[6]), .Cout(C6), .inputP(inputP[6]), .inputQ(Q6), .Cin(C5));
        full_adder fa7(.S(S[7]), .Cout(C7), .inputP(inputP[7]), .inputQ(Q7), .Cin(C6));
        full_adder fa8(.S(S[8]), .Cout(C8), .inputP(inputP[8]), .inputQ(Q8), .Cin(C7));
        full_adder fa9(.S(S[9]), .Cout(C9), .inputP(inputP[9]), .inputQ(Q9), .Cin(C8));
        full_adder fa10(.S(S[10]), .Cout(C10), .inputP(inputP[10]), .inputQ(Q10), .Cin(C9));
        full_adder fa11(.S(S[11]), .Cout(C11), .inputP(inputP[11]), .inputQ(Q11), .Cin(C10));
        full_adder fa12(.S(S[12]), .Cout(C12), .inputP(inputP[12]), .inputQ(Q12), .Cin(C11));
        full_adder fa13(.S(S[13]), .Cout(C13), .inputP(inputP[13]), .inputQ(Q13), .Cin(C12));
        full_adder fa14(.S(S[14]), .Cout(C14), .inputP(inputP[14]), .inputQ(Q14), .Cin(C13));
        full_adder fa15(.S(S[15]), .Cout(C15), .inputP(inputP[15]), .inputQ(Q15), .Cin(C14));

        assign O = C14^C15;


        assign S[16] =1'b0;
	    assign S[17] =1'b0;
	    assign S[18] =1'b0;
	    assign S[19] =1'b0;
	    assign S[20] =1'b0;
	    assign S[21] =1'b0;
	    assign S[22] =1'b0;
	    assign S[23] =1'b0;
	    assign S[24] =1'b0;
	    assign S[25] =1'b0;
	    assign S[26] =1'b0;
	    assign S[27] =1'b0;
	    assign S[28] =1'b0;
	    assign S[29] =1'b0;
	    assign S[30] =1'b0;
	    assign S[31] =1'b0;

endmodule //end add_sub

module full_adder(S, Cout, inputP, inputQ, Cin);

    output      S;
    output      Cout;
    input       inputP;
    input       inputQ;
    input       Cin;

    assign S = inputP^inputQ^Cin;
    assign Cout = ((inputP&inputQ) | (inputQ&Cin) | (inputP&Cin));

endmodule //end full_adder

module command_mode(Command, mode);
    input [3:0]     Command;
    output          mode;
    reg             mode;

    always @ (Command) 
    begin 
        if(Command == 3)
            mode = 1;
        else 
            mode = 0;
    end


endmodule //end command_mode
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
//----------------------------------------------------------------------
//ALU start, requires 2 16 bit inputs, 4 bit op code and the output of the ALU
module ALU(inputP, inputQ, opCode, outALU, errorCode);

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
input mode;

//inputs and outputs for the error module
input divZeroMod;

input divZeroDiv;

input overflow;

output [1:0] errorCode;
output C;


//for the decoder
input [15:0] hotselect;

//calling all modules
add_sub inst1(inputP, inputQ, opCode, mode, outAddsub, C, overflow); 
Modulo inst2(inputP, inputQ, outMod, divZeroMod); //calculating modulo outputs the results (outMod) and a divide by zero 2 bit code
Division inst3(inputP, inputQ, outDiv, divZeroDiv); //calculating division outputs the results (outDiv) and a divide by zero 2 bit code
Multiplication inst4(inputP, inputQ, outMult); //calculating multiplication outputs the results (outMult)
Decoder inst5(opCode, hotselect); //changes 4 bit op code to a 16 hot select code
ErrorModule inst6(overflow, divZeroDiv, divZeroMod, errorCode); //will output 00 if no error, 01 if there's a divide by zero, or a 10 if there's an overflow

Multiplexer inst7(outMult, outDiv, outMod, outAddsub, outAddsub, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 
32'b0, 32'b0, 32'b0, 32'b0,hotselect, outALU); //multiplexer, for opcodes multiplication 0000, division 0001, Modulus 0010, Add 0100, Subtract 0011


endmodule

module testbench();
	
	// Declaring inputs and outputs
	reg [15:0] inputP;
    reg [15:0] inputQ;
    reg [3:0] opCode;
    wire [31:0] outALU;
	wire [1:0] errorCode;
  ALU electricity1(inputP, inputQ, opCode, outALU, errorCode); // Declare 'multiplication' module

	initial begin
		#900;
		//assign inputP = 16'b11111;	// # 31
		//assign inputQ = 16'b0011;	// # 3
        //assign opCode = 4'b0011;    
		
		#900;
		//Add: 0100
		//Sub: 0011
		//Mul: 0000
		//Div: 0001
		//Mod: 0010
		// Display results
		assign inputP = 16'b11111111;
		assign inputQ = 16'b1111111;
		assign opCode = 16'b0100;
		#900;
		$display("[Input P:    %1d, Input Q:    %1d][Add: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0011;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Sub: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0000;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Mul: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0001;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Div: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0010;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Mod: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign inputP = 16'b111110100000000;
		assign inputQ = 16'b0011111010000000;
		assign opCode = 16'b0100;
		#900;
		$display("[Input P:    %1d, Input Q:    %1d][Add: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0011;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Sub: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0000;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Mul: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0001;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Div: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		assign opCode = 16'b0010;
		#30;
		$display("[Input P:    %1d, Input Q:    %1d][Mod: %b][Output:    %1d, Error: %b]", inputP, inputQ, opCode, outALU, errorCode);
		/*$display("A: %1d", inputP);
		$display("B: %1d", inputQ);
        $display("opCode: %1d", opCode);
		$display("outALU: %1d", outALU);
		$display("errorCode: %1d", errorCode);*/
		$display("\n");

		$finish; 
	end

endmodule 
