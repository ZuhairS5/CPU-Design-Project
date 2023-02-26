// Zuhair Shaikh and Brant Lan Li
// NOT Operation (AND)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module not_op (A, result);

	input wire [7:0] A;
	output wire [7:0] result;
	
	assign result = ~A;

endmodule 
