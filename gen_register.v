// Zuhair Shaikh and Brant Lan Li
// General Purpose Register (Used for R0 - R15, HI, LO, Y, IR)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module gen_register (D, clk, clr, enable, Q); // ports

	input wire [31:0] D; // port declarations
	input wire clk;
	input	wire clr;
	input wire enable;
	output reg [31:0] Q;
	
	always @ (posedge clr, posedge clk) // port logic
		if (clr)
			Q <= 0;								// clear
		else if (enable)
			Q <= D;								// output D

endmodule // end module