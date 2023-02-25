// Zuhair Shaikh and Brant Lan Li
// AND Operation (AND)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module and_op (A, B, result);

	input wire [7:0] A;
	input wire [7:0] B;
	output wire [7:0] result;
	
	assign result = A & B;

endmodule
	