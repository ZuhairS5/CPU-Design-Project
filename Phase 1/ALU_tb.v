// Zuhair Shaikh and Brant Lan Li
// ALU Testbench File 
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

`timescale 1ns/10ps 
module ALU_tb;

	reg [7:0] input_a; 
	reg [7:0] input_b;
	reg [3:0] opcode;             // used to select operation
	wire [7:0] ALU_result;
	
	ALU ALU_instance(input_a, input_b, opcode, ALU_result);
	
	initial 
		begin 
			input_a <= 16;
			input_b <= 3;
			
			opcode <= 5'b0000;      // check AND operation 
			
			# 200 
			
			opcode <= 5'b0001;		// check OR operation 
			
			# 200 
			
			opcode <= 5'b0010;		// check NOT operation 
			
		end 
		
endmodule 