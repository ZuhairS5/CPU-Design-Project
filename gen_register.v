// Zuhair Shaikh and Brant Lan Li
// General Purpose Register 
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module gen_register (
	input wire [31:0] D,
	input wire clk,
	input	wire clr,
	input wire enable,
	output reg [31:0] Q
	);
	
	initial Q = 32'b0;
	always @ (posedge clk)
	begin
		if (clr) begin
			Q = 32'b0;
		end
		else if (enable) begin
			Q <= D;
		end
	end
endmodule 
