// Zuhair Shaikh and Brant Lan Li
// Arithemtic Logic Unit (ALU)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

`timescale 1ns/10ps 

module ALU(	
	input wire [31:0] A,
	input wire [31:0] B,
	input wire [4:0] opcode,
	output reg [63:0] result
	);
	
	parameter AND = 5'b00000;	// parameters for operations
	parameter OR =  5'b00001;
   parameter NOT = 5'b00010;
	parameter NEG = 5'b00011;
	parameter ADD = 5'b00100;
	parameter SUB = 5'b00101;
	parameter MUL = 5'b00110;
	parameter DIV = 5'b00111;
	parameter SHR = 5'b01000;
	parameter SHRA = 5'b01001;
	parameter SHL = 5'b01010; 
	parameter ROR = 5'b01011;
	parameter ROL = 5'b01100;
	
	wire [31:0] and_result;  // AND operation
	wire [31:0] or_result;	// OR operation
	wire [31:0] not_result;	// NOT operation
	wire [31:0] neg_result;	// NEG operation
	wire [31:0] add_sum; 		// ADD sum
	wire [31:0] add_result;	// ADD operation
	wire [31:0] sub_diff; 	// SUB difference
	wire [31:0] sub_result;  // SUB operation
	wire [63:0] mul_result;  // MUL operation
	wire [63:0] div_result;  // DIV operation
	wire [31:0] shr_result;  // SHR operation
	wire [31:0] shra_result; // SHRA operation
	wire [31:0] shl_result;  // SHL operation
	wire [31:0] ror_result;  // ROR operation
	wire [31:0] rol_result;  // ROL operation
	
	// AND 
	and_32 and_instance (A, B, and_result);
	
	// OR 
	or_32 or_instance (A, B, or_result);
	
	// NOT 
	not_32 not_instance (A, not_result);
	
	// NEG
	neg_32 neg_instance (A, neg_result);
	
	// ADD
	add_32 add_instance (A, B, 1'b0, add_sum, add_result);
	
	// SUBTRACT
	sub_32 sub_instance (A, B, sub_sum, 1'b0, sub_result);
	
	// MULTIPLY
	mul_32 mul_instance (A, B, mul_result);
	
	// DIVIDE 
	div_32 div_instance (A, B, div_result);
	
	// SHIFT RIGHT 
	shr_32 shr_instance (A, B, shr_result);
	
	// SHIFT RIGHT ARITHMETIC 
	//shra_32 shra_instance (A, B, shra_result);
	
	// SHIFT LEFT 
	shl_32 shl_instance (A, B, shl_result);
	
	// ROTATE RIGHT
	ror_32 ror_instance (A, B, ror_result);	
	
	// ROTATE LEFT 
	rol_32 rol_instance (A, B, rol_result);
	
	
	always @ (*) begin 
	
		case (opcode)
		
			AND : result <= and_result;  // AND result
			OR : result = or_result;	 // OR result 
			NOT : result = not_result;	 // NOT result 
			NEG : result = neg_result;	 // NEG  result
			ADD : result = add_result;	 // ADD  result
			SUB : result = sub_result;	 // SUB  result
			MUL : result = mul_result;	 // MUL  result
			DIV : result = div_result;	 // DIV  result
			SHR : result = shr_result;	 // SHR  result
			SHRA : result = shra_result; // SHRA result
			SHL : result = shl_result;	 // SHL  result
			ROR : result = ror_result;	 // ROR  result
			ROR : result = rol_result;	 // ROL  result
			default: result = 5'b00000; 
		
		endcase
	
	end 
	
endmodule 
