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
	
	wire [7:0] and_result;   // AND operation
	wire [7:0] or_result;	 // OR operation
	wire [7:0] not_result;	 // NOT operation
	wire [7:0] neg_result;	 // NEG operation
	
	// AND 
	and_op and_instance (A, B, and_result);
	
	// OR 
	or_op or_instance (A, B, or_result);
	
	// NOT 
	not_op not_instance (A, not_result);
	
	// NEG
	neg_op neg_instance (A, neg_result);
	
	// ADD
	
	
	// SUBTRACT
	
	// MULTIPLY
	
	// DIVIDE 
	
	// SHIFT RIGHT 
	
	// SHIFT RIGHT ARITHMETIC 
	
	// SHIFT LEFT 
	
	// ROTATE RIGHT 
	
	// ROTATE LEFT 
	
	
	always @ (*) begin 
	
		case (opcode)
		
			4'b0000 : result = and_result;   // AND result
			4'b0001 : result = or_result;	 // OR result 
			4'b0010 : result = not_result;	 // NOT result 
			4'b0011 : result = neg_result;	 // NEG  result
			// 4'b0100 : result = add_result;	 // ADD  result
			// 4'b0101 : result = sub_result;	 // SUB  result
			// 4'b0110 : result = mul_result;	 // MUL  result
			// 4'b0111 : result = div_result;	 // DIV  result
			// 4'b1000 : result = shr_result;	 // SHR  result
			// 4'b1001 : result = shra_result;	 // SHRA result
			// 4'b1010 : result = shl_result;	 // SHL  result
			// 4'b1011 : result = ror_result;	 // ROR  result
			// 4'b1100 : result = rol_result;	 // ROL  result
			default: result = 4'b0000;
		
		endcase
	
	end 
	
endmodule 
