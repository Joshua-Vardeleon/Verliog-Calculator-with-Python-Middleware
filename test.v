module Multiplexer(input0, input1, input2, input3, input4, input5, input6, input7, input8, 
                  input9, input10, input11, input12, input13, input14, input15, hotselect, muxout);

   
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

always @ (muxout, hotselect) begin
        case(hotselect)
        16'b0000000000000001 : muxout = input0;
        16'b0000000000000010 : muxout = input1;
        16'b0000000000000100 : muxout = input2;
        16'b0000000000001000 : muxout = input3;
        16'b0000000000010000 : muxout = input4;
        16'b0000000000100000 : muxout = input5;
        16'b0000000001000000 : muxout = input6;
        16'b0000000010000000 : muxout = input7;
        16'b0000000100000000 : muxout = input8;
        16'b0000001000000000 : muxout = input9;
        16'b0000010000000000 : muxout = input10;
        16'b0000100000000000 : muxout = input11;
        16'b0001000000000000 : muxout = input12;
        16'b0010000000000000 : muxout = input13;
        16'b0100000000000000 : muxout = input14;
        16'b1000000000000000 : muxout = input15;

        endcase
endmodule
    module testbench();
    	Multiplexer electricity(input0, input1, muxout, hotselect);
	
	initial begin
	
		// Divide using integers < 250
		reg [31:0] input0 = 32'b111111111;	// # 245
		reg [31:0] input1 = 32'b101010101;	// # 127
		reg [15:0] hotselect = 16'b01;
        wire [31:0] muxout;

		#90;
		
		// Display results of division
		$display("------ TEST #1: Divide using integers < 250 ------");
		$display("test: %1d", muxout);
		$finish; 
		
	end

endmodule 