`include  "DJMr.G.Part3.v"
module calcCircle();	
	// Declaring inputs and outputs
	reg  [31:0] inputP;
	reg  [31:0] inputQ;
	reg[31:0] inputF;
	reg[31:0] inputG;
    reg [3:0] opCode;	

    wire  [31:0] outALU;   
	wire [1:0] errorCode;
    ALU electricity1(clk, inputP, inputQ, opCode, outALU, errorCode); 

	reg clk;	//added in part3

	//Added in Part3
	//CLOCK THREAD 
		initial 
			begin
				forever
					begin 
						clk = 0;
						#3;
						//$display("CLK: %b, Register: %b", clk, electricity1.outval);
						#2;
						clk=1;
						#3;  
						$display("CLK: %b,Register: %b",clk,electricity1.outval);					
						#2;	
					end
			end

	//STIMULUS THREAD 
	initial begin
		$display("\n==========================================================================\n");
		#5;

		$display("Switch on circuit");
		$display("Input P:%1d,inputQ:%4d,OpCode:%4d,Result:%8d",inputP,inputQ,opCode,outALU);
		$display("Input P:%b,InputQ:%b,OpCode:%4b,Result:%8b, Error: %b",inputP,inputQ,opCode,outALU, errorCode);
		$display("\n=======================\n");

		$display("Reset");
		assign inputP=16'b0000;
		assign opCode=4'b1100;	
		#10;
		$display("Input P:%4d,Feedback:%4d,OpCode:%4d,Result:%8d",inputP,electricity1.feedback,opCode,outALU);
		$display("Input P:%4b,Feedback:%4b,OpCode:%4b,Result:%8b, Error: %b",inputP,electricity1.feedback,opCode,outALU, errorCode);
		$display("\n=======================\n");

		$display("Exponent");
                assign inputP = 13; 
		assign inputQ = 2;
		assign opCode=4'b1111;
		
		#10;
		$display("Input P:%4d,Feedback:%4d,OpCode:%4d,Result:%8d",inputP,inputQ,opCode,outALU);
		$display("Input P:%4b,Feedback:%4b,OpCode:%4b,Result:%8b, Error: %b",inputP,inputQ,opCode,outALU, errorCode);
		$display("\n=======================\n");

		assign inputG = electricity1.feedback;
		#10;
		$display("Exponent");
                assign inputP = 14; 
		assign inputQ = 2;
		
		assign opCode= 4'b1111;
		#10;
		$display("Input P:%4d,Feedback:%4d,OpCode:%4d,Result:%8d",inputP,inputQ,opCode,outALU);
		$display("Input P:%4b,Feedback:%4b,OpCode:%4b,Result:%8b, Error: %b",inputP,inputQ,opCode,outALU, errorCode);
		$display("\n=======================\n");
		assign inputF = electricity1.feedback;	
		#10;
		
		$display("Addition");
		
        assign inputP = inputF; 
		assign inputQ = inputG;
		assign opCode=4'b0000;
		#10;
		$display("Input P:%4d,Feedback:%4d,OpCode:%4d,Result:%8d",inputP,inputQ,opCode,outALU);
		$display("Input P:%4b,Feedback:%4b,OpCode:%4b,Result:%8b, Error: %b",inputP,inputQ,opCode,outALU, errorCode);
		$display("\n=======================\n");
		

		// $display("Multiplication");
		// assign inputF = outALU
        // assign inputP = 50; 
		// assign inputQ = 50;
		// assign opCode=4'b0000;
		// #10;
		// $display("Input P:%4d,Feedback:%4d,OpCode:%4d,Result:%8d",inputP,inputQ,opCode,outALU);
		// $display("Input P:%4b,Feedback:%4b,OpCode:%4b,Result:%8b, Error: %b",inputP,inputQ,opCode,outALU, errorCode);
		// $display("\n=======================\n");
		// $finish; 

		// $display("Addition");
        // assign inputP = inputF; 
		// assign inputQ = outALU;
		// assign inputF = outALU
		// assign opCode=4'b0000;
		// #10;
		// $display("Input P:%4d,Feedback:%4d,OpCode:%4d,Result:%8d",inputP,inputQ,opCode,outALU);
		// $display("Input P:%4b,Feedback:%4b,OpCode:%4b,Result:%8b, Error: %b",inputP,inputQ,opCode,outALU, errorCode);
		// $display("\n=======================\n");
		$finish; 
	end
endmodule