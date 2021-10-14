/* 	Author: Joshua Vardeleon, Gabriela Saenz
	Cohort Members: Reg Gonzalez, Desh Padmakumar, Gabriela Saenz, Joshua Vardeleon,
	Matthew Lineberry
	Cohort Name: DJMr.G
	Class: CS 4341.502
*/

/*      -----------------------------------------------------------------------------------
	| Multiplexer Module:                                                             |   
        | This module is used to decide what output will be selected determined by a 16   |
	| a 16 bit number called a Hot-Select                                             |
	-----------------------------------------------------------------------------------
*/
module Multiplexer(input0, input1, input2, input3, input4, input5, input6, input7, input8, 
                  input9, input10, input11, input12, input13, input14, input15, hotselect, muxout);

   //inputs and outputs
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
    
//case function to select which port the mux will use to output based on the hot select
always @ (hotselect)
        case(hotselect)
        16'b0000000000000001 : assign muxout = input0;
        16'b0000000000000010 : assign muxout = input1;
        16'b0000000000000100 : assign muxout = input2;
        16'b0000000000001000 : assign muxout = input3;
        16'b0000000000010000 : assign muxout = input4;
        16'b0000000000100000 : assign muxout = input5;
        16'b0000000001000000 : assign muxout = input6;
        16'b0000000010000000 : assign muxout = input7;
        16'b0000000100000000 : assign muxout = input8;
        16'b0000001000000000 : assign muxout = input9;
        16'b0000010000000000 : assign muxout = input10;
        16'b0000100000000000 : assign muxout = input11;
        16'b0001000000000000 : assign muxout = input12;
        16'b0010000000000000 : assign muxout = input13;
        16'b0100000000000000 : assign muxout = input14;
        16'b1000000000000000 : assign muxout = input15;
        

        endcase
endmodule
        

