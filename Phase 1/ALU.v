// Zuhair Shaikh and Brant Lan Li
// Arithemtic Logic Unit (ALU)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module ALU(A, B, opcode, result);

	input wire [31:0] A;
	input wire [31:0] B;
	input wire [3:0] opcode;
	output reg [7:0] result; 
	
	wire [7:0] and_result;
	wire [7:0] or_result;
	wire [7:0] not_result;
	and_op and_instance (A, B, and_result);
	or_op or_instance (A, B, or_result);
	not_op not_instance (A, not_result);
	
	always @ (*) begin 
	
		case (opcode)
		
			5'b0000 : result = and_result;    // AND result
			5'b0001 : result = or_result;		 // OR result 
			5'b0010 : result = not_result;	 // NOT result 
			default: result = 5'b0000;
		
		endcase
	
	end 
	
endmodule 