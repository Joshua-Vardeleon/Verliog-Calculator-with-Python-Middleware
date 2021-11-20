
import io
import os
import time
import callVerilogFrustrum


print('Choose what equation you want to choose: \n'
      'Circle = 1 \n'
      'Volume of a Sphere= 2 \n'
      'Volume of a Frustum of a cone = 3 \n')

#ask user what 
eqPick = input("type in the number: ")

#Area of the circle
if eqPick == "1":
    #equation pi(r^2)
    #takes user input for the radius
    eqPick = input("what is the radius of the circle? ")

    #snippet of verilog code to be added to calcCircle.v
    newInputP = "                assign inputP = " + eqPick + "; \n"
   
    #opens calcCircle.v
    file = open('calcCircle.v')

    #reads calcCircle.v and stores it in a array editLine[]
    editLine = file.readlines()

    #edits line 42 of the code
    editLine[41] = newInputP

    #most work is done through calcSphere,v
    file = open("calcCircle.v", "w")
    
    new_file_contents = "". join(editLine)

    #writes edited code into calcCircle.v
    file.write(new_file_contents)

    #close file
    file.close()

    #systems calls for verilog
    time.sleep(2)
    os.system("iverilog calcCircle.v")
    time.sleep(2)
    os.system("vvp a.out")

#volume of a circle
#equation (4*pi * r^3)/3
elif eqPick == "2":
    eqPick = input("What is the radius of the sphere? ")
    newInputP = "                assign inputP = " + eqPick + "; \n"
    print(newInputP)

    file = open('calcSphere.v')

    editLine = file.readlines()


    editLine[44] = newInputP
    

    #most work is done through calcSphere,v
    #open file to write
    file = open("calcSphere.v", "w")

    new_file_contents = "". join(editLine)

    #write into file
    file.write(new_file_contents)
    file.close()

    #system calls for verilog to open and process calcSphere.v
    time.sleep(2)
    os.system("iverilog calcSphere.v")
    time.sleep(2)
    os.system("vvp a.out")

#Volume of a Frustum of a Cone
#equation (pi * h * (R^2 + Rr + r^2))/3
elif eqPick == "3":

    #user input of height, smaller radius and bigger radius
    height = input("What is the height of the Frustrum? ")
    smRadius = input("What is the smaller radius of the Frustrum? ")
    bgRadius = input("What is the bgger of the Frustrum? ")


    #equation (pi * h * (R^2 + Rr + r^2))/3
    #R^2
    r = callVerilogFrustrum.callVer("1111" , smRadius, "2")

    #r^2
    r2 = callVerilogFrustrum.callVer("1111" , bgRadius, "2")
    
    #Rr
    rR = callVerilogFrustrum.callVer("0010" , bgRadius, smRadius)

    #r^2 + R^2
    r = callVerilogFrustrum.callVer("0000" , r, r2)
    
    #r^2 + Rr + R^2
    r = callVerilogFrustrum.callVer("0000" , r, rR)

    #pi(r^2 + Rr + R^2)
    r = callVerilogFrustrum.callVer("0010" , r, "3141")

    #h *pi(r^2 + Rr + R^2)
    r = callVerilogFrustrum.callVer("0010" , r, height)

    #(h *pi(r^2 + Rr + R^2))/3
    r = callVerilogFrustrum.callVer("0011" ,"3000" , r)


    #print output
    print("\n==========================================================================\n")
    print("Frustum of a Cone Volume: " + r)
    print("\n==========================================================================\n")

