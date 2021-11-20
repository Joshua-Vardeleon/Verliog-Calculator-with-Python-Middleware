//--------------------------------------------------------
/* 
 * Author: Gabriela Saenz
 * Cohort Members: Gabriela Saenz, Reg Gonzalez, Desh Padmakumar, Joshua Vardelon, and Matthew Lineberry
 * Cohort Name: DJMr.G 
 * Class: CS4341.502
 * Due Date: 10/31/2021
 */
 
/*
    Adder-Subtractor module is built in structured code. Module takes
    Two 16-bit integers and a mode to determine which operation to perform.
    The 32-bit output will be either the S or difference of the two inputs.

    Adder-subtractor module written by Gabriela Saenz 
 */
 
module add_sub (inputP, inputQ, Command, mode, outAddSub, C, O); 

        input [3:0] Command;
        

        //Two 16-bit inputs
        input  [15:0]    inputP;
        input  [15:0]    inputQ;
        //if mode is 1, sub. if mode is 0, add.
        inout            mode;
        //32-bit result of add_sub
        output  [31:0]   outAddSub;
        //Carry status
        output          C;
        //Overflow status
        output          O;

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

        full_adder fa0(.outAddSub(outAddSub[0]), .Cout(C0), .inputP(inputP[0]), .inputQ(Q0), .Cin(mode));
        full_adder fa1(.outAddSub(outAddSub[1]), .Cout(C1), .inputP(inputP[1]), .inputQ(Q1), .Cin(C0));
        full_adder fa2(.outAddSub(outAddSub[2]), .Cout(C2), .inputP(inputP[2]), .inputQ(Q2), .Cin(C1));
        full_adder fa3(.outAddSub(outAddSub[3]), .Cout(C3), .inputP(inputP[3]), .inputQ(Q3), .Cin(C2));
        full_adder fa4(.outAddSub(outAddSub[4]), .Cout(C4), .inputP(inputP[4]), .inputQ(Q4), .Cin(C3));
        full_adder fa5(.outAddSub(outAddSub[5]), .Cout(C5), .inputP(inputP[5]), .inputQ(Q5), .Cin(C4));
        full_adder fa6(.outAddSub(outAddSub[6]), .Cout(C6), .inputP(inputP[6]), .inputQ(Q6), .Cin(C5));
        full_adder fa7(.outAddSub(outAddSub[7]), .Cout(C7), .inputP(inputP[7]), .inputQ(Q7), .Cin(C6));
        full_adder fa8(.outAddSub(outAddSub[8]), .Cout(C8), .inputP(inputP[8]), .inputQ(Q8), .Cin(C7));
        full_adder fa9(.outAddSub(outAddSub[9]), .Cout(C9), .inputP(inputP[9]), .inputQ(Q9), .Cin(C8));
        full_adder fa10(.outAddSub(outAddSub[10]), .Cout(C10), .inputP(inputP[10]), .inputQ(Q10), .Cin(C9));
        full_adder fa11(.outAddSub(outAddSub[11]), .Cout(C11), .inputP(inputP[11]), .inputQ(Q11), .Cin(C10));
        full_adder fa12(.outAddSub(outAddSub[12]), .Cout(C12), .inputP(inputP[12]), .inputQ(Q12), .Cin(C11));
        full_adder fa13(.outAddSub(outAddSub[13]), .Cout(C13), .inputP(inputP[13]), .inputQ(Q13), .Cin(C12));
        full_adder fa14(.outAddSub(outAddSub[14]), .Cout(C14), .inputP(inputP[14]), .inputQ(Q14), .Cin(C13));
        full_adder fa15(.outAddSub(outAddSub[15]), .Cout(C15), .inputP(inputP[15]), .inputQ(Q15), .Cin(C14));

        assign O = C14^C15;

        assign outAddSub[16] =1'b0;
	    assign outAddSub[17] =1'b0;
	    assign outAddSub[18] =1'b0;
	    assign outAddSub[19] =1'b0;
	    assign outAddSub[20] =1'b0;
	    assign outAddSub[21] =1'b0;
	    assign outAddSub[22] =1'b0;
	    assign outAddSub[23] =1'b0;
	    assign outAddSub[24] =1'b0;
	    assign outAddSub[25] =1'b0;
	    assign outAddSub[26] =1'b0;
	    assign outAddSub[27] =1'b0;
	    assign outAddSub[28] =1'b0;
	    assign outAddSub[29] =1'b0;
	    assign outAddSub[30] =1'b0;
	    assign outAddSub[31] =1'b0;

endmodule //end add_sub

module full_adder(outAddSub, Cout, inputP, inputQ, Cin);

    output      outAddSub;
    output      Cout;
    input       inputP;
    input       inputQ;
    input       Cin;

    assign outAddSub = inputP^inputQ^Cin;
    assign Cout = ((inputP&inputQ) | (inputQ&Cin) | (inputP&Cin));

endmodule //end full_adder

module command_mode(Command, mode);
    input [3:0]     Command;
    output          mode;
    reg             mode;

    always @ (Command) 
    begin 
        if(Command == 1)
            mode = 1;
        else 
            mode = 0;
    end


endmodule //end command_mode

//--------------------------------------------------------
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
	input  [31:0] inputP;
	input  [31:0] inputQ;
	//32-bit output
	output  [31:0] quotient;
	reg  [31:0] quotient;
	// Divide by zero output
	output  divideByZero;
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

	
	input  [31:0] inputP, inputQ; // 16-bit inputs
	output  [31:0] outMod; //32-bit output
	reg  [31:0] outMod;
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

	
	input  [31:0] inputP, inputQ; // 16-bit inputs
	output [31:0] product; //32-bit output
	reg [31:0] product; 
	
	always @ (inputP, inputQ, product) begin

		product = inputP * inputQ; // Calculate product

	end

endmodule 

module exponent(inputP, inputQ, outEX);

	// 16-bit inputs
	input  [31:0] inputP;
	input  [31:0] inputQ;
	
	//32-bit output
	output  [31:0] outEX;
	reg  [31:0] outEX;


	// Perform XOR operation on inputs
	always @ (inputP, inputQ, outEX) begin
		
		outEX = inputP ** inputQ;

	end
	

endmodule  
