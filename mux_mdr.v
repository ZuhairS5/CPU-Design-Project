// Zuhair Shaikh and Brant Lan Li
// 2 to 1 Multiplexer for MDR Register (2:1 MUX - MDR) 
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module mux_mdr(

	input wire [31:0] BusMuxOut,
	input wire [31:0] Mdatain,
	input wire read,
	output reg out
);

	always @ (*) begin 
	
		if (read == 0)
		
			out[31:0] <= BusMuxOut[31:0];
		
		else if (read == 1)
		
			out[31:0] <= Mdatain[31:0];
			
	end 
	
endmodule 