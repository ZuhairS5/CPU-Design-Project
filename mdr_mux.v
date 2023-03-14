// Zuhair Shaikh and Brant Lan Li
// Memory Data Register Register MUX (MDR_MUX)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module mdr_mux (
	input wire [31:0] BusMuxOut,
	input wire Read,
	input wire [31:0] MDAtain,
	output reg [31:0] Q
	);
		
	always @ (*)
		begin
			if (Read == 0)
			        Q <= BusMuxOut;
			else if (Read == 1)
				Q <= MDAtain;
		end
endmodule 
