// Zuhair Shaikh and Brant Lan Li
// Program Counter Register (PC)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module pc_register (
	input wire [31:0] D,
	input wire clk,
	input	wire clr,
	input wire increment,
	input wire enable,
	output reg [31:0] Q
	);
	
	initial Q = 32'b0;
	
	always @ (clk) 
		begin
			if (clr) begin
				Q = 32'b0;
			end
			else if (enable) begin
				Q = D;
			end
			else if (increment) begin
				Q = Q + 1'b1;
			end
		end
endmodule 
