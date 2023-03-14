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
	
	parameter AND = 5'b00000;
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
	wire [31:0] sub_diff; 	 // SUB difference
	wire [31:0] sub_result;  // SUB operation
	wire [63:0] mul_result;  // MUL operation
	wire [63:0] div_result;  // DIV operation
	wire [31:0] shr_result;  // SHR operation
	wire [31:0] shra_result; // SHRA operation
	wire [31:0] shl_result;  // SHL operation
	wire [31:0] ror_result;  // ROR operation
	wire [31:0] rol_result;  // ROL operation
	
	
	always @ (*) begin 
	
		case (opcode)
		
			AND : begin
						result[31:0] <= and_result[31:0];  // AND result
						result[63:32] <= 32'd0;
					end
					
			OR : begin
						result[31:0] <= or_result[31:0];   // OR result
						result[63:32] <= 32'd0; 
				  end
					
			NOT : begin
						result[31:0] <= not_result[31:0];  // NOT result
						result[63:32] <= 32'd0;
					end
					
			NEG : begin
						result[31:0] <= neg_result[31:0];  // NEG result
						result[63:32] <= 32'd0;
					end
					
			ADD : begin
						result[31:0] <= add_result[31:0];  // ADD result
						result[63:32] <= 32'd0;
					end
					
			SUB : begin
						result[31:0] <= sub_result[31:0];  // SUB result
						result[63:32] <= 32'd0;
					end
					
			MUL : begin
						result[63:0] <= mul_result[63:0];  // MUL result
					end
					
			DIV : begin
						result[63:0] <= div_result[63:0];  // DIV result
					end
					
			SHR : begin
						result[31:0] <= shr_result[31:0];  // SHR result
						result[63:32] <= 32'd0;
					end
					
			SHRA : begin
						result[31:0] <= shra_result[31:0]; // SHRA result
						result[63:32] <= 32'd0;
					 end
					
			SHL : begin
						result[31:0] <= shl_result[31:0];  // SHL result
						result[63:32] <= 32'd0;
					end
					
			ROR : begin
						result[31:0] <= ror_result[31:0];  // ROR result
						result[63:32] <= 32'd0;
					end
					
			ROL : begin
						result[31:0] <= rol_result[31:0];  // ROL result
						result[63:32] <= 32'd0;
					end
					
			default: begin
							result[63:0] <= 64'd0; 
						end
		endcase
	
	end 
	
	// ALU Operations 
	and_32 and_instance (A, B, and_result); 
	or_32 or_instance (A, B, or_result);
	not_32 not_instance (B, not_result);
	neg_32 neg_instance (B, neg_result);
	add_32 add_instance (A, B, 1'd0, add_result, add_sum);
	sub_32 sub_instance (A, B, 1'd0, sub_result, sub_diff);
	mul_32 mul_instance (A, B, mul_result);
	div_32 div_instance (A, B, div_result);
	shr_32 shr_instance (A, B, shr_result);
	shra_32 shra_instance (A, B, shra_result);
	shl_32 shl_instance (A, B, shl_result);
	ror_32 ror_instance (A, B, ror_result);	
	rol_32 rol_instance (A, B, rol_result);
	
endmodule 
