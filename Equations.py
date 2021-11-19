import linecache
import io
import os
import time


print('Choose what equation you want to choose: \n'
      'Circle = 1 \n'
      'Volume of a Sphere= 2 \n'
      'Quadratic Formula = 3 \n')

#ask user what 
eqPick = input("type in the number: ")

if eqPick == "1":
    eqPick = input("what is the radius of the circle? ")
    newInputP = "                assign inputP = " + eqPick + "; \n"
    print(newInputP)

    file = open('calcCircle.v')

    editLine = file.readlines()


    editLine[51] = newInputP

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

    radiusSmIn = "                assign inputP = " + smRadius + "; \n"
    radiusBGIn = "                assign inputP = " + bgRadius + "; \n"
    heightIn = "                assign inputP = " + height + "; \n"


    file = open('calcFrustrum.v')

    editLine = file.readlines()


    editLine[51] = radiusSmIn
    editLine[63] = radiusBGIn
    

    file = open("calcFrustrum.v", "w")

    new_file_contents = "". join(editLine)

    file.write(new_file_contents)

    file.close()

    time.sleep(2)
    os.system("iverilog calcFrustrum.v")
    time.sleep(2)
    os.system("vvp a.out")

