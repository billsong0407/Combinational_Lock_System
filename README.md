# Combinational_Lock_System
- Set the 4 input bits (X = x3x2x1x0) to the desired value and “press” Enter (set Enter input HIGH).
  The door will open if input matches the stored combination ('o' will be displayed). Alarm will go active ('A' will be displayed) if two incorrect combinations are entered consecutively. The alarm can only be cancelled by pressing the reset button. 
  When the system is reset, the stored combination should be set to ’0110’. To change the combination, set the input to the old combination and “press” Change (set Change input HIGH). If this is done correctly, output New ('n') goes HIGH to signal user to enter new combination. Set the 4 input bits to the
  new combination and “press” either Change or Enter to store the new value. Two incorrect valueswill set off the alarm as above. 

### Implementation
- Implemented with Moore Finite State Machine using Verilog
- Uses a 4-bit register to store the combination, a 4 bit compartor to determine if the entered number matches the saved value,
  a LED display driver to the display the output, a block for your state machine and so on. 
- Uses a 50 MHz free running clock as Clock input on the Altera board

### Set Up
- Set system.v (driver module) as the top-level entity
- Add the pin assignment file to the existing project
- Compile it for the Cyclone V FPGA (5CSEMA5F31C6) device
- Download it to the Intel Altera DE1-SoC board

### Instruction
- Use toggle switches SW[9], SW[8], SW[7], SW[6] for inputs x3, x2, x1, x0 respectively. Enter is KEY[0], 
  Change is KEY[1], and Reset is KEY[2]
