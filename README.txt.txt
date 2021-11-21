
Purpose: This program is able to solve area of a circle, volume of a sphere, and volume of a Frustrum of a Cone


============================================================================================================================================================================

How to run it: run the python file "DJ.Mr.G.Part4.py" that is in the Project folder

============================================================================================================================================================================

What does each file do in the Project Folder:

"DJ.Mr.G.Part4.py": main driver of the program: it is used to take user input and interface with verilog

"callVerilogFrustrum.py": helper function for "DJ.Mr.G.Part4.py", all it does is call the verilog file "DJ.Mr.G.Part4.v" and was made because to solve for the volume of
a Frustrum it requires multiple calls to verilog so this was made to help that.

"DJ.Mr.G.v": this is the main ALU of the program.

"Arithmetic.v": this file has all the Arithmetic functions the ALU can use like addition, subtraction, Division, etc.

"logic_operations.v": this file has all logic operations the ALU can use like AND, OR, NAND, XOR, etc 

"Multiplexer-Decode-ErrorMode.v": As the name implies, it has the multiplexer and the decoder which is used to control the ALU and the Error Module.

"DFF.v": This is the clock module for the ALU

"FeedbackCheck.v": This is used for the ALU to check if the feedback is empty or not.

"calcCircle.v": testbench for calculating area of a circle

"calcFrustrum.v": testbench for calculating volume of a sphere

"calcSphere.v": testbench for calculating volume of a Frustrum of a cone

"DJ.Mr.GPart4.out": raw output of verilog

"a.dat": vvp output of verilog

"output.txt": output of the program

============================================================================================================================================================================