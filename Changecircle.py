import linecache
import io
import os
import time

print('Choose what equation you want to choose: \n'
      'Circle = 1 \n'
      'Sphere of a circle = 2 \n'
      'Quadratic Formula = 3 \n')

eqPick = input("type in the number: ")

if eqPick == "1":
    eqPick = input("what is the radius of the circle? ")
    newInputP = "                assign inputP = " + eqPick + "; \n"
    print(newInputP)

    file = open('calcCircle.v')

    editLine = file.readlines()


    editLine[51] = newInputP

    file = open("calcCircle1.v", "w")

    new_file_contents = "". join(editLine)

    file.write(new_file_contents)

    file.close()

    time.sleep(2)
    os.system("iverilog calcCircle1.v")
    time.sleep(2)
    os.system("vvp a.out")

