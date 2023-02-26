// Zuhair Shaikh and Brant Lan Li
// NEG Operation (2's Complement, NEG)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module neg_op (A, result);

	input wire [7:0] A;
	output wire [7:0] result;
	
	assign result = ~A + 1;    // complement and add 1 

endmodule 