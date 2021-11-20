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
						//$display("CLK: %b,Register: %b",clk,electricity1.outval);					
						#2;	
					end
			end

	//STIMULUS THREAD 
	initial begin
		#5;
		//reset
		assign inputP=16'b0000;
		assign opCode=4'b1100;	
		#10;
                assign inputP = 3000; 
                assign inputQ = 20617524; 
                assign opCode = 4'b0011; 
		#10;
		$display(outALU);
		$finish; 
	end
endmodule