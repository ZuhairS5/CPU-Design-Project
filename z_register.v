// Zuhair Shaikh and Brant Lan Li
// Z Register (Z)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module z_register (
	input wire [63:0] D,
	input wire ZLowOut,
	input wire ZHighOut,
	input wire enable,
	input wire clk,
	input wire clr,
	output reg [31:0] ZHighData,
	output reg [31:0] ZLowData
	);

always @ (posedge clr, posedge clk) // port logic

	if (clr) begin
	
		ZHighData = 32'h00000000;	// assign NULL values to HI and LO registers
		ZLowData = 32'h00000000;
		
	end
	
	else if (enable) begin
	
		if (ZLowOut)
		
			ZLowData = D[31:0];		// hold quotient in lower byte 
		
		else if (ZHighOut)
		
			ZHighData = D[32:63];	// hold remainder in upper byte 
	end
		
endmodule 