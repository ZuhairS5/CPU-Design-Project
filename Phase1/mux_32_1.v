// Zuhair Shaikh and Brant Lan Li
// 32 to 1 Multiplexer (32:1 MUX) 
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module mux_32_1 (MuxOut, MuxInR0, MuxInR1, MuxInR2, MuxInR3, MuxInR4, MuxInR5, MuxInR6, MuxInR7,								// 32:1 mulitplexer ports
						MuxInR8, MuxInR9, MuxInR10, MuxInR11, MuxInR12, MuxInR13, MuxInR14, MuxInR15,
						MuxInHI, MuxInLO, MuxInZHI, MuxInZLO, MuxInPC, MuxInMDR, MuxInPort, MuxInC, 
						MuxInR24, MuxInR25, MuxInR26, MuxInR27, MuxInR28, MuxInR29, MuxInR30, MuxInR31, MuxSelect);
						
						
						
		output reg [31:0] MuxOut;		// 32:1 mulitplexer wires
		input wire [31:0] MuxInR0; 
		input wire [31:0] MuxInR1;
		input wire [31:0] MuxInR2; 
		input wire [31:0] MuxInR3; 
		input wire [31:0] MuxInR4; 
		input wire [31:0] MuxInR5; 
		input wire [31:0] MuxInR6; 
		input wire [31:0] MuxInR7;								
		input wire [31:0] MuxInR8; 
		input wire [31:0] MuxInR9; 
		input wire [31:0] MuxInR10; 
		input wire [31:0] MuxInR11; 
		input wire [31:0] MuxInR12; 
		input wire [31:0] MuxInR13; 
		input wire [31:0] MuxInR14; 
		input wire [31:0] MuxInR15;
		input wire [31:0] MuxInHI; 
		input wire [31:0] MuxInLO; 
		input wire [31:0] MuxInZHI; 
		input wire [31:0] MuxInZLO; 
		input wire [31:0] MuxInPC; 
		input wire [31:0] MuxInMDR; 
		input wire [31:0] MuxInPort; 
		input wire [31:0] MuxInC;
		input wire [31:0] MuxInR24;
		input wire [31:0] MuxInR25;
		input wire [31:0] MuxInR26;
		input wire [31:0] MuxInR27;
		input wire [31:0] MuxInR28;
		input wire [31:0] MuxInR29;
		input wire [31:0] MuxInR30;
		input wire [31:0] MuxInR31;
		input wire [4:0] MuxSelect;
		
		always @ (*) begin
		
			case (MuxSelect)
			
				5'b00000: MuxOut <= MuxInR0;	// multiplexer logic 
				5'b00001: MuxOut <= MuxInR1;
				5'b00010: MuxOut <= MuxInR2;
				5'b00011: MuxOut <= MuxInR3;
				5'b00100: MuxOut <= MuxInR4;
				5'b00101: MuxOut <= MuxInR5;
				5'b00110: MuxOut <= MuxInR6;
				5'b00111: MuxOut <= MuxInR7;
				5'b01000: MuxOut <= MuxInR8;
				5'b01001: MuxOut <= MuxInR9;
				5'b01010: MuxOut <= MuxInR10;
				5'b01011: MuxOut <= MuxInR11;
				5'b01100: MuxOut <= MuxInR12;
				5'b01101: MuxOut <= MuxInR13;
				5'b01110: MuxOut <= MuxInR14;
				5'b01111: MuxOut <= MuxInR15;
				5'b10000: MuxOut <= MuxInHI; 		// R16
				5'b10001: MuxOut <= MuxInLO; 		// R17
				5'b10010: MuxOut <= MuxInZHI; 	// R18
				5'b10011: MuxOut <= MuxInZLO; 	// R19
				5'b10100: MuxOut <= MuxInPC; 		// R20
				5'b10101: MuxOut <= MuxInMDR; 	// R21
				5'b10110: MuxOut <= MuxInPort; 	// R22
				5'b10111: MuxOut <= MuxInC;		// R23
				5'b11000: MuxOut <= MuxInR24;
				5'b11001: MuxOut <= MuxInR25;
				5'b11010: MuxOut <= MuxInR26;
				5'b11011: MuxOut <= MuxInR27;
				5'b11100: MuxOut <= MuxInR28;
				5'b11101: MuxOut <= MuxInR29;
				5'b11110: MuxOut <= MuxInR30;
				5'b11111: MuxOut <= MuxInR31;
				default: MuxOut <= 5'b00000;
				
			endcase
			
		end 
				
endmodule 

						
