import io
import os
import time
import re

def callVer(opCode, inputP, inputQ):

    #used to replace part of the verilog code
    inputpV = "                assign inputP = " + inputP + "; \n"
    inputqV = "                assign inputQ = " + inputQ + "; \n"
    opcodeV = "                assign opCode = 4'b" + opCode + "; \n"


    file = open('calcFrustrum.v')

    editLine = file.readlines()

    #change the lines of the verilog code
    editLine[39] = inputpV
    editLine[40] = inputqV
    editLine[41] = opcodeV
    
    #opens verilog code
    file = open("calcFrustrum.v", "w")

    new_file_contents = "". join(editLine)

    #writes edit
    file.write(new_file_contents)

    #close file
    file.close()

    #run verilog through sys calls
    time.sleep(0.5)
    os.system("iverilog calcFrustrum.v")

    #output is put into a.out
    time.sleep(0.5)
    os.system("vvp a.out > a.dat")
    #open a.dat
    file = open("a.dat", "r")


    readLine = str(file.readlines(1))
    
    #regex to remove all uneeded characters
    answer = re.sub(r"[a-z \s ' \] \[ \\ ]", '', readLine)

    #returns a the answer
    return answer 
