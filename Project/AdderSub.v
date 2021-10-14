//=============================================
// Half Adder
//=============================================
module HalfAdder(A,B,carry,sum);
	input A;
	input B;
	output carry;
	output sum;
	reg carry;
	reg sum;
//---------------------------------------------	
	always @(*) 
	  begin
	    sum= A ^ B;
	    carry= A & B;
	  end
//---------------------------------------------
endmodule


//=============================================
// Full Adder
//=============================================
module FullAdder(A,B,C,carry,sum);
	input A;
	input B;
	input C;
	output carry;
	output sum;
	reg carry;
	reg sum;
//---------------------------------------------	
	wire c0;
	wire s0;
	wire c1;
	wire s1;
//---------------------------------------------
	HalfAdder ha1(A ,B,c0,s0);
	HalfAdder ha2(s0,C,c1,s1);
//---------------------------------------------
	always @(*) 
	  begin
	    sum=s1;//
		sum= A^B^C;
	    carry=c1|c0;//
		carry= ((A^B)&C)|(A&B);  
	  end
//---------------------------------------------
	
endmodule

module AddSub(inputP,inputQ,mode,sum,overflow);
   generate
	   
    input [15:0] inputP;
	input [15:0] inputQ;
    input mode;
	output [31:0] sum;
    output overflow;

		

    wire b0,b1,b2,b3,b4,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15; //XOR Interfaces
	wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16; //Carry Interfaces
	

    assign b0 = inputQ[0] ^ mode;
    assign b1 = inputQ[1] ^ mode;
    assign b2 = inputQ[2] ^ mode;
    assign b3 = inputQ[3] ^ mode;
    assign b4 = inputQ[4] ^ mode;
    assign b5 = inputQ[5] ^ mode;
    assign b6 = inputQ[6] ^ mode;
    assign b7 = inputQ[7] ^ mode;
    assign b8 = inputQ[8] ^ mode;
    assign b9 = inputQ[9] ^ mode;
    assign b10 = inputQ[10] ^ mode;
    assign b11 = inputQ[11] ^ mode;
    assign b12 = inputQ[12] ^ mode;
    assign b13 = inputQ[13] ^ mode;
    assign b14 = inputQ[14] ^ mode;
    assign b15 = inputQ[15] ^ mode;


	FullAdder FA0(inputP[0],b0,mode,c1,sum[0]);
	FullAdder FA1(inputP[1],b1,  c1,c2,sum[1]);
	FullAdder FA2(inputP[2],b2,  c2,c3,sum[2]);
	FullAdder FA3(inputP[3],b3,  c3,c4,sum[3]);
	FullAdder FA4(inputP[4],b4,  c4,c5,sum[4]);
	FullAdder FA5(inputP[5],b5,  c5,c6,sum[5]);
	FullAdder FA6(inputP[6],b6,  c6,c7,sum[6]);
    FullAdder FA7(inputP[7],b7,  c7,c8,sum[7]);
    FullAdder FA8(inputP[8],b8,  c8,c9,sum[8]);
    FullAdder FA9(inputP[9],b9,  c9,c10,sum[9]);
    FullAdder FA10(inputP[10],b10,  c10,c11,sum[10]);
    FullAdder FA11(inputP[11],b11,  c11,c12,sum[11]);
    FullAdder FA12(inputP[12],b12,  c12,c13,sum[12]);
    FullAdder FA13(inputP[13],b13,  c13,c14,sum[13]);
    FullAdder FA14(inputP[14],b14,  c14,c15,sum[14]);
    FullAdder FA15(inputP[15],b15,  c15,c16,sum[15]);
	assign sum[16] = 1'b0;
	assign sum[17] = 1'b0;
	assign sum[18] = 1'b0;
	assign sum[19] = 1'b0;
	assign sum[20] = 1'b0;
	assign sum[21] = 1'b0;
	assign sum[22] = 1'b0;
	assign sum[23] = 1'b0;
	assign sum[24] = 1'b0;
	assign sum[25] = 1'b0;
	assign sum[26] = 1'b0;
	assign sum[27] = 1'b0;
	assign sum[28] = 1'b0;
	assign sum[29] = 1'b0;
	assign sum[30] = 1'b0;
	assign sum[31] = 1'b0;




	assign overflow=c16^c15;
	endgenerate

endmodule

// module testbench();
	
// 	// Declaring inputs and outputs
// 	reg [15:0] inputP;
//     reg [15:0] inputQ;
//     reg [3:0] opCode;
//     wire [31:0] outALU;
// 	wire overflow;
//   AddSub electricity1(inputP, inputQ, 1'b1, outALU, overflow); // Declare 'multiplication' module

// 	initial begin
// 		//
// 		assign inputP = 16'b11111;	// # 31
// 		assign inputQ = 16'b0011;	// # 3
//         assign opCode = 4'b0000;
		
// 		#90;
		
// 		// Display results
// 		$display("A: %1d", inputP);
// 		$display("B: %1d", inputQ);
//         $display("opCode: %1d", opCode);
// 		$display("outALU: %1d", outALU);
// 		$display("\n");

// 		$finish; 
// 	end

// endmodule 

