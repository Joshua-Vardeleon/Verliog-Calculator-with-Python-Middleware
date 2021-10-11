module ModuloModule(A,B) 

	
	input [15:0] A, B; // 16-bit inputs
	output [31:0] outMod; //32-bit output
	reg [31:0] outMod;
    output [1:0] divZero
    reg [1:0] divZero 
	
	always @ (A, B, outMod) begin
		
	
		outMod = A % B; // Calculate product

	end
	
    if(B == 16'b000000000)
    begin
        divZero = 2'01
    end
endmodule 