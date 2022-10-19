# HOW_SPEED_UP_CODES
how make our code works with higher freq ,
in this project i'm make a simple GCD(Greatest common divisor) VHDL code to work from 4.354 to 3.017 ns, here's what i'm done:
# STEP 0:
not standard and raw code but tested and work well with xilinx ISE green check,  
GCD code + test bench + reports(timing,resource)
# STEP 1:
TIMING CONSTRAINT :
Timing constraints are used to specify the timing characteristics of the design. Timing constraints may affect all internal timing interconnections, delays through logic and LUTs and between flip-flops or registers. Timing constraints can be either global or path-specific. 
via TIMING CONSTRAINT i declear to ISE what speed(freq) i want and ISE do it's best to reach my goal but it's not enough for me
# STEP 2:
XILINX has many standards that help us to write our code more performance, the detail of how the code standarded is inside VHDL code at step2 folder, 
the detail of reports(timing,resource) changes is inside step2 folder
# STEP 3:
CONSTRAINT GOAL is a pro skill which help us to comminucate better with ISE sofware so we can tell to software what to do for reaching our goal, 
the detail of how do CONSTRAINT GOAL and reports(timing,resource) changes is inside step3 folder
# STEP 4:
SMART XPLORER is same as CONSTRAINT GOAL but take much more time to process so we first do CONSTRAINT GOAL and if we dont reach our goal then do SMART XPLORER, 
the detail of how do SMART XPLORER and reports(timing,resource) changes is inside  step4 folder
