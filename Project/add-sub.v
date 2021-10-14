/* Project Part2
 * Cohort Members: Gabriela Saenz, Reg Gonzalez, Desh Padmakumar, Joshua Vardelon, and Matthew Lineberry
 * Cohort Name: DJMr.G 
 * Class: CS4341.502
 * Due Date: 10/11/2021
 */
 
/*
    Adder-Subtractor module is built in structured code. Module takes
    Two 16-bit integers and a mode to determine which operation to perform.
    The 32-bit output will be either the S or difference of the two inputs.

    Adder-subtractor module written by Gabriela Saenz 
 */

module add_sub (inputP, inputQ, mode, S, C, O); //put C, O, back into parameters

        //Two 16-bit inputs
        input [15:0]    inputP;
        input [15:0]    inputQ;
        //if mode is 1, sub. if mode is 0, add.
        input           mode;
        //32-bit result of add_sub
        output [31:0]   S;
        wire [31:0]      S;
        //Carry status
        output          C;
        wire             C;
        //Overflow status
        output          O;
        wire             O;

        //Each C(n) serves as the Carry out bit for the current full_adder 
        //And the Carry in bit for the nexy full_adder
        //The final carry, C15, generates the output C.
        wire            C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15;

        wire            Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15;

        assign Q0 = inputQ[0]^mode;
        assign Q1 = inputQ[1]^mode;
        assign Q2 = inputQ[2]^mode;
        assign Q3 = inputQ[3]^mode;
        assign Q4 = inputQ[4]^mode;
        assign Q5 = inputQ[5]^mode;
        assign Q6 = inputQ[6]^mode;
        assign Q7 = inputQ[7]^mode;
        assign Q8 = inputQ[8]^mode;
        assign Q9 = inputQ[9]^mode;
        assign Q10 = inputQ[10]^mode;
        assign Q11 = inputQ[11]^mode;
        assign Q12 = inputQ[12]^mode;
        assign Q13 = inputQ[13]^mode;
        assign Q14 = inputQ[14]^mode;
        assign Q15 = inputQ[15]^mode;
        assign C = C15^mode;

        full_adder fa0(.S(S[0]), .Cout(C0), .inputP(inputP[0]), .inputQ(Q0), .Cin(mode));
        full_adder fa1(.S(S[1]), .Cout(C1), .inputP(inputP[1]), .inputQ(Q1), .Cin(C0));
        full_adder fa2(.S(S[2]), .Cout(C2), .inputP(inputP[2]), .inputQ(Q2), .Cin(C1));
        full_adder fa3(.S(S[3]), .Cout(C3), .inputP(inputP[3]), .inputQ(Q3), .Cin(C2));
        full_adder fa4(.S(S[4]), .Cout(C4), .inputP(inputP[4]), .inputQ(Q4), .Cin(C3));
        full_adder fa5(.S(S[5]), .Cout(C5), .inputP(inputP[5]), .inputQ(Q5), .Cin(C4));
        full_adder fa6(.S(S[6]), .Cout(C6), .inputP(inputP[6]), .inputQ(Q6), .Cin(C5));
        full_adder fa7(.S(S[7]), .Cout(C7), .inputP(inputP[7]), .inputQ(Q7), .Cin(C6));
        full_adder fa8(.S(S[8]), .Cout(C8), .inputP(inputP[8]), .inputQ(Q8), .Cin(C7));
        full_adder fa9(.S(S[9]), .Cout(C9), .inputP(inputP[9]), .inputQ(Q9), .Cin(C8));
        full_adder fa10(.S(S[10]), .Cout(C10), .inputP(inputP[10]), .inputQ(Q10), .Cin(C9));
        full_adder fa11(.S(S[11]), .Cout(C11), .inputP(inputP[11]), .inputQ(Q11), .Cin(C10));
        full_adder fa12(.S(S[12]), .Cout(C12), .inputP(inputP[12]), .inputQ(Q12), .Cin(C11));
        full_adder fa13(.S(S[13]), .Cout(C13), .inputP(inputP[13]), .inputQ(Q13), .Cin(C12));
        full_adder fa14(.S(S[14]), .Cout(C14), .inputP(inputP[14]), .inputQ(Q14), .Cin(C13));
        full_adder fa15(.S(S[15]), .Cout(C15), .inputP(inputP[15]), .inputQ(Q15), .Cin(C14));

        assign O = C14^C15;


        assign S[16] =1'b0;
	    assign S[17] =1'b0;
	    assign S[18] =1'b0;
	    assign S[19] =1'b0;
	    assign S[20] =1'b0;
	    assign S[21] =1'b0;
	    assign S[22] =1'b0;
	    assign S[23] =1'b0;
	    assign S[24] =1'b0;
	    assign S[25] =1'b0;
	    assign S[26] =1'b0;
	    assign S[27] =1'b0;
	    assign S[28] =1'b0;
	    assign S[29] =1'b0;
	    assign S[30] =1'b0;
	    assign S[31] =1'b0;

endmodule //end add_sub

module full_adder(S, Cout, inputP, inputQ, Cin);

    output      S;
    output      Cout;
    input       inputP;
    input       inputQ;
    input       Cin;

    assign S = inputP^inputQ^Cin;
    assign Cout = ((inputP&inputQ) | (inputQ&Cin) | (inputP&Cin));

endmodule //end full_adder

/*module command_mode(Command, mode);
    input [3:0]     Command;
    output          mode;
    reg             mode;

    always @ (Command) 
    begin 
        if(Command)
            mode = 1;
        else 
            mode = 0;
    end


endmodule //end command_mode

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module testbench();

    reg [15:0]      inputP;
    reg [15:0]      inputQ;
    reg [3:0]       Command;
    wire [31:0]     S;
    wire            mode;
    wire            C;
    wire            O;
    

    command_mode cmd(Command, mode);
    add_sub electricity(inputP, inputQ, mode, S, C, O); //put mode back in

    initial begin

            //for ints < 250
            assign inputP = 16'b11110101;
            assign inputQ = 16'b1111111;
            assign Command = 4'b0000;
            

            #900;

            $display("------ TEST #1: Add using integers < 250 ------");
            $display("inputP: %1d", inputP);
            $display("inputQ: %1d", inputQ);
            $display("Mode: %1d", mode);
            $display("Sum: %1d", S);
            $display("Carry: %1d", C);
            $display("Overflow: %1d", O);
            $display("\n");

            assign Command = 4'b0001;

            #900;

            $display("------ TEST #2: Subtract using integers < 250 ------");
            $display("inputP: %1d", inputP);
            $display("inputQ: %1d", inputQ);
            $display("Mode: %1d", mode);
            $display("Difference: %1d", S);
            $display("\n");


            assign inputP = 16'b111110100000000;
            assign inputQ = 16'b11111010000000;
            assign Command = 4'b0000;

            #900;

            $display("------ Test #3: Add using integers > 16000 ------");
            $display("inputP: %1d", inputP);
            $display("inputQ: %1d", inputQ);
            $display("Mode: %1d", mode);
            $display("Sum: %1d", S);
            $display("\n");

            assign Command = 4'b0001;

            #900;

            $display("------ TEST #4: Subtract using integers > 16000 ------");
            $display("inputP: %1d", inputP);
            $display("inputQ: %1d", inputQ);
            $display("Mode: %1d", mode);
            $display("Difference: %1d", S);
            $display("\n");

            #900;
            $finish;
    end 
endmodule //end testbench*/