
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

if eqPick == "1":
    eqPick = input("what is the radius of the circle? ")
    newInputP = "                assign inputP = " + eqPick + "; \n"
   

    file = open('calcCircle.v')

    editLine = file.readlines()


    editLine[41] = newInputP

    file = open("calcCircle.v", "w")

    new_file_contents = "". join(editLine)

    file.write(new_file_contents)

    file.close()

    time.sleep(2)
    os.system("iverilog calcCircle.v")
    time.sleep(2)
    os.system("vvp a.out")

elif eqPick == "2":
    eqPick = input("What is the radius of the sphere? ")
    newInputP = "                assign inputP = " + eqPick + "; \n"
    print(newInputP)

    file = open('calcSphere.v')

    editLine = file.readlines()


    editLine[51] = newInputP
    

    file = open("calcSphere.v", "w")

    new_file_contents = "". join(editLine)

    file.write(new_file_contents)

    file.close()

    time.sleep(2)
    os.system("iverilog calcSphere.v")
    time.sleep(2)
    os.system("vvp a.out")

elif eqPick == "3":
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

    print("frustum of a Cone Volume: " + r)
