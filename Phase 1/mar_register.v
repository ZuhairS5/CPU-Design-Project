// Zuhair Shaikh and Brant Lan Li
// memory Address Register (MAR)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module mar_register (MAR_in, Q);

	input wire [31:0] MAR_in; // 32 bit input to be spliced
	output reg [8:0] Q;
	
	always @ (*) begin // port logic
	
		Q = MAR_in[8:0]; // spliced address
		
	end 

endmodule 
