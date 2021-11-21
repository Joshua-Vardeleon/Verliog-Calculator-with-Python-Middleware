`include  "DJMr.G.Part3.v"
module calcCircle();
	
	// Declaring inputs and outputs
	reg  [31:0] inputP;
	reg  [31:0] inputQ;
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


		//equation (1000* 4 * pi * r^3)/3000
		//reset
		assign inputP=16'b0000;
		assign opCode=4'b1100;	
		#10;
		//r^3
		//line below will be edited through python script
                assign inputP = 12; 
		assign inputQ = 3;
		assign opCode=4'b1111;	
		#10;

		
		//1000* pi* r^2
		assign inputP= 3141;
		assign opCode=4'b0010;	
		#10;


		//(1000 * 4 * pi * r^3)
		assign inputP= 4;
		assign opCode=4'b0010;	
		#10;


		//(1000* 4 * pi * r^3)/3000
		assign inputP= 3000;
		assign opCode=4'b0011;	
		#10;
		
		$display(outALU);
		
		
		

		$finish; 
	end
endmodule