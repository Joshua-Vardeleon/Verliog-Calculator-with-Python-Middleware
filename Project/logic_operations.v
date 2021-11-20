/* 	Author: Reg Gonzalez
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*	-----------------------------------------------------------------------------
	| AND module:                                                               |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the         |
	| result of the AND operation.                                              |
	-----------------------------------------------------------------------------
*/
module AND (inputP, inputQ, outAND);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outAND;
	reg [31:0] outAND;


	// Perform AND operation on inputs
	always @ (inputP, inputQ, outAND) begin
		
		outAND = inputP & inputQ;

	end
	
endmodule 



/*	------------------------------------------------------------------------------
	| NAND module:                                                               |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the          |
	| result of the NAND operation.                                              |
	------------------------------------------------------------------------------
*/
module NAND (inputP, inputQ, outNAND);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outNAND;
	reg [31:0] outNAND;


	// Perform NAND operation on inputs
	always @ (inputP, inputQ, outNAND) begin
		
		outNAND = ~(inputP & inputQ);

	end
	
endmodule 



/*	------------------------------------------------------------------------------
	| NOR module:                                                                |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the          |
	| result of the NOR operation.                                               |
	------------------------------------------------------------------------------
*/
module NOR (inputP, inputQ, outNOR);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outNOR;
	reg [31:0] outNOR;


	// Perform NOR operation on inputs
	always @ (inputP, inputQ, outNOR) begin
		
		outNOR = ~(inputP | inputQ);

	end
	
endmodule 



/*	------------------------------------------------------------------------------
	| NOT module:                                                                |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the          |
	| result of the NOT operation.                                               |
	------------------------------------------------------------------------------
*/
module NOT (inputP, inputQ, outNOT);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outNOT;
	reg [31:0] outNOT;


	// Perform NOT operation on inputs
	// (perform the NOT operation on InputQ and concatenate/pad it with InputP so that 
	// it fits into the Multiplexer)
	always @ (inputP, inputQ, outNOT) begin
		
		outNOT = {inputP, (~inputQ)};

	end
	
endmodule 



/*	-----------------------------------------------------------------------------
	| OR module:                                                                |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the         |
	| result of the OR operation.                                               |
	-----------------------------------------------------------------------------
*/
module OR (inputP, inputQ, outOR);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outOR;
	reg [31:0] outOR;


	// Perform OR operation on inputs
	always @ (inputP, inputQ, outOR) begin
		
		outOR = inputP | inputQ;

	end
	
endmodule 



/*	-------------------------------------------------------------------------------
	| XNOR module:                                                                |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the           |
	| result of the XNOR operation.                                               |
	-------------------------------------------------------------------------------
*/
module XNOR (inputP, inputQ, outXNOR);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outXNOR;
	reg [31:0] outXNOR;


	// Perform XNOR operation on inputs
	always @ (inputP, inputQ, outXNOR) begin
		
		outXNOR = ~(inputP ^ inputQ);

	end
	
endmodule



/*	------------------------------------------------------------------------------
	| XOR module:                                                                |
	| Takes two 16-bit integer and outputs a 32-bit integer that is the          |
	| result of the XOR operation.                                               |
	------------------------------------------------------------------------------
*/
module XOR (inputP, inputQ, outXOR);

	// 16-bit inputs
	input [31:0] inputP;
	input [31:0] inputQ;
	
	//32-bit output
	output [31:0] outXOR;
	reg [31:0] outXOR;


	// Perform XOR operation on inputs
	always @ (inputP, inputQ, outXOR) begin
		
		outXOR = inputP ^ inputQ;

	end
	
endmodule  



// -----------------------------------------------------------------------------------------------------

/*	--------------------------------------------------------------------------------------
	| testbench() module:														         |
	| Declares/calls all the logic operation modules and tests them/displays results     |
	--------------------------------------------------------------------------------------
*/
/*
module testbench();
	
	// Declare inputs and outputs (the inputs are each 16 bits while the output 
	// is 32 bits)
	reg [15:0] inputP;
	reg [15:0] inputQ;
	wire [31:0] outAND;
	wire [31:0] outNAND;
	wire [31:0] outNOR;
	wire [31:0] outNOT;
	wire [31:0] outOR;
	wire [31:0] outXNOR;
	wire [31:0] outXOR;
	
	// Declare logic operations modules
	AND ANDmodule(inputP, inputQ, outAND);
	NAND NANDmodule(inputP, inputQ, outNAND);
	NOR NORmodule(inputP, inputQ, outNOR);
	NOT NOTmodule(inputP, inputQ, outNOT);
	OR ORmodule(inputP, inputQ, outOR);
	XNOR XNORmodule(inputP, inputQ, outXNOR);
	XOR XORmodule(inputP, inputQ, outXOR);
	
	initial begin
	
		// Test AND operation
		assign inputP = 16'b1001011011110010;
		assign inputQ = 16'b0010101011111100;
		
		#60;
		
		$display("\n");
		$display("------ TEST #1: ANDing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outAND);
		$display("\n");
		
		
		// Test NAND operation
		assign inputP = 16'b1010101011010010;
		assign inputQ = 16'b0001011111001010;
		
		#60;
		
		$display("------ TEST #2: NANDing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outNAND);
		$display("\n");
		
		
		// Test NOR operation
		assign inputP = 16'b0011001100110011;
		assign inputQ = 16'b1100110011001100;
		
		#60;
		
		$display("------ TEST #3: NORing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outNOR);
		$display("\n");
		
		
		// Test NOT operation
		assign inputP = 16'b0101110000111111;
		assign inputQ = 16'b0100010111000101;
		
		#60;
		
		$display("------ TEST #4: NOTing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outNOT);
		$display("\n");
		
		
		// Test NOR operation
		assign inputP = 16'b1111000101001011;
		assign inputQ = 16'b0011010111100100;
		
		#60;
		
		$display("------ TEST #5: ORing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outOR);
		$display("\n");
		
		
		// Test XNOR operation
		assign inputP = 16'b1010101000110111;
		assign inputQ = 16'b0001011011010010;
		
		#60;
		
		$display("------ TEST #6: XNORing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outXNOR);
		$display("\n");
		
		
		// Test XOR operation
		assign inputP = 16'b0001101001001111;
		assign inputQ = 16'b1000101111111000;
		
		#60;
		
		$display("------ TEST #7: XORing 16-bit inputs ------");
		$display("inputP: %1b", inputP);
		$display("inputQ: %1b", inputQ);
		$display("result: %1b", outXOR);
		$display("\n");
		
		#10;
		$finish; 
		
	end

endmodule 
*/