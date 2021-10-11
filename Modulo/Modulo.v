module modulo(modA,modB, outMod, divZero);

	
	input [15:0] modA, modB; // 16-bit inputs
	output [31:0] outMod; //32-bit output
	reg [31:0] outMod;
    output [1:0] divZero;
    reg [1:0] divZero;
	
	always @ (modA, modB, outMod) begin
		
	
		outMod = modA % modB; // calculates modulo

	end
	
    always @ (modB, divZero) begin //checks for divide by zero
    if(!modB) 
        assign divZero = 2'b01;
	else 
		assign divZero = 2'b00;
	end
endmodule 
