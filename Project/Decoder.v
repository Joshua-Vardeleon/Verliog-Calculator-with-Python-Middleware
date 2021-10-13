module Decoder(opCode, hotselect);
//inputs and outputs
input [3:0] opCode;
output [15:0] hotselect;
reg [15:0] hotselect;

//uses cases to determine which should be outputted
always @ (opCode)
    case(opCode)
    4'b0000 : assign hotselect = 16'b0000000000000001;
    4'b0001 : assign hotselect = 16'b0000000000000010;
    4'b0010 : assign hotselect = 16'b0000000000000100;
    4'b0011 : assign hotselect = 16'b0000000000001000;
    4'b0100 : assign hotselect = 16'b0000000000010000;
    4'b0101 : assign hotselect = 16'b0000000000100000;
    4'b0110 : assign hotselect = 16'b0000000001000000;
    4'b0111 : assign hotselect = 16'b0000000010000000;
    4'b1000 : assign hotselect = 16'b0000000100000000;
    4'b1001 : assign hotselect = 16'b0000001000000000;
    4'b1010 : assign hotselect = 16'b0000010000000000;
    4'b1011 : assign hotselect = 16'b0000100000000000;
    4'b1100 : assign hotselect = 16'b0001000000000000;
    4'b1101 : assign hotselect = 16'b0010000000000000;
    4'b1110 : assign hotselect = 16'b0100000000000000;
    4'b1111 : assign hotselect = 16'b1000000000000000;
    endcase
endmodule
