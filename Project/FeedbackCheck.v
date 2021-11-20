module FeedbackCheck(inputQ, feedback, feedbackCheck);

    input [31:0] feedback;
    input [31:0] inputQ;
    output [31:0] feedbackCheck;
    reg [31:0] feedbackCheck;

    always @(inputQ, feedback, feedbackCheck) begin
        if(feedback == 0)
            assign feedbackCheck = inputQ;
        else
            assign feedbackCheck = feedback;
        
    end 
endmodule


