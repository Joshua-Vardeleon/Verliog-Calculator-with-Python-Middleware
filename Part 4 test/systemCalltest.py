import os
import time

os.system("iverilog DJMr.G.Part3.v")
time.sleep(2)
os.system("vvp  a.out")
