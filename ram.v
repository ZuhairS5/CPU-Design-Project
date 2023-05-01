// Zuhair Shaikh and Brant Lan Li
// RAM (RAM)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module ram(
	input wire [31:0] D,
	input wire [8:0] address,
	input wire clock,
	input wire read,
	input wire write,
	output wire [31:0] Q
	);
	
	reg [31:0] memory [0:511];
	initial $readmemh("ram.hex", memory);
	
	reg [31:0] qTemp;
	always @ (posedge clock) begin
		if (write) begin
			memory[address] <= D;
		end
		else if (read) begin
			qTemp <= memory[address];
		end
	end
	assign Q = qTemp;
endmodule