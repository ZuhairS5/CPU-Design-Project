// Zuhair Shaikh and Brant Lan Li
// ROR Operation (ROR)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module ror_32(
	input wire [31:0] rIn, rotB,
	output wire [31:0] rOut
	);
	
	reg [31:0] oTemp;
	always @ (*)
		begin
			oTemp = ((rIn >> rotB) | (rIn << (32 - rotB)));
		end
	assign rOut = oTemp;
endmodule 