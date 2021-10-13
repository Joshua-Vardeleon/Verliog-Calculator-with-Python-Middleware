`include "Decoder.v"
`include "division_module.v"
`include "Modulo.v"
`include "multi.v"
`include "Multiplexer.v"
module ALU(inputP, inputQ, opCode, outALU);

input [15:0] inputP;
input [15:0] inputQ;
input [3:0] opCode;

output [31:0] outALU;


input [31:0] outMod;

input [31:0] outDiv;

input [31:0] outMult;

output [1:0] divZeroMod;

output [1:0] divZeroDiv;

input [15:0] hotselect;


Modulo inst1(inputP, inputQ, outMod, divZeroMod);
Division inst2(inputP, inputQ, outDiv, divZeroDiv);
Multiplication inst3(inputP, inputQ, outMult);
Decoder inst4(opCode, hotselect);
Multiplexer inst5(outMult, outDiv, outMod, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, hotselect, outALU);


 endmodule

module testbench();
	
	// Declaring inputs and outputs
	reg [15:0] inputP;
    reg [15:0] inputQ;
    reg [3:0] opCode;
    wire [31:0] outALU;
  ALU electricity1(inputP, inputQ, opCode, outALU); // Declare 'multiplication' module

	initial begin
		// for ints < 250
		assign inputP = 16'b11111;	// # 210
		assign inputQ = 16'b0011;	// # 100
        assign opCode = 4'b0000;
		
		#30;
		
		// Display results
		$display("A: %1d", inputP);
		$display("B: %1d", inputQ);
        $display("opCode: %1d", opCode);
		$display("outALU: %1d", outALU);
		$display("\n");

		$finish; 
	end

endmodule 