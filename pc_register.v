// Zuhair Shaikh and Brant Lan Li
// Program Counter Register (PC)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module pc_register (D, clk, clr, increment, enable, Q);

	input wire [31:0] D; // port declarations
	input wire clk;
	input	wire clr;
	input wire increment;
	input wire enable;
	output reg [31:0] Q;
	
	always @ (posedge clr, posedge clk) // port logic
		if (clr)
			Q <= 0;
		else if (enable)
			Q <= D;
		else if (increment)
			Q = Q + 1;							// increment program counter for next instr

endmodule 