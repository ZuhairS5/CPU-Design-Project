// Zuhair Shaikh and Brant Lan Li
// Datapath (Bus)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module datapath (
	// CPU signals
	input clk, clr,
	
	// Enable Signals
	input wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	input wire enable_PC,
	input wire enable_IR,
	input wire enable_HI, 
	input wire enable_LO,
	input wire enable_ZHI,
	input wire enable_ZLO,
	input wire enable_MAR,
	input wire enable_MDR,
	input wire enable_OutPort,
	input wire enable_C,
	input wire enable_Y,
	
	// Encoder Signals
	input wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	input wire select_PC,
	input wire select_HI,
	input wire select_LO,
	input wire select_ZHI,
	input wire select_ZLO,
	input wire select_InPort,
	input wire select_MDR,
	input wire select_MAR,
	input wire select_C,
	
	input wire [1:0] Read,
	input wire [31:0] MDAtain,
	input wire [31:0] IncPC,
	// ALU Operation Code
	input wire [4:0] OP
);
	
	// Bus Multiplexer Signals 
	wire [31:0] BusMux_R0;
	wire [31:0] BusMux_R1;
	wire [31:0] BusMux_R2;
	wire [31:0] BusMux_R3;
	wire [31:0] BusMux_R4;
	wire [31:0] BusMux_R5;
	wire [31:0] BusMux_R6;
	wire [31:0] BusMux_R7;
	wire [31:0] BusMux_R8;
	wire [31:0] BusMux_R9;
	wire [31:0] BusMux_R10;
	wire [31:0] BusMux_R11;
	wire [31:0] BusMux_R12;
	wire [31:0] BusMux_R13;
	wire [31:0] BusMux_R14;
	wire [31:0] BusMux_R15;
	wire [31:0] BusMux_HI;
	wire [31:0] BusMux_LO;
	wire [31:0] BusMux_ZHI;
	wire [31:0] BusMux_ZLO;
	wire [31:0] BusMux_PC;
	wire [31:0] BusMux_MDR;
	wire [31:0] BusMux_MAR;
	wire [31:0] BusMux_InPort;
	wire [31:0] BusMux_C;
	wire [31:0] BusMux_Y;
	wire [4:0] Mux_Select;
	wire [31:0] Mux_Out;		
	wire [63:0] ALU_Data;
	wire [31:0] MDR_MuxOut;
	
	// R0-R15 Registers
	gen_register R0 (Mux_Out, clk, clr, R0in, BusMux_R0);
	gen_register R1 (Mux_Out, clk, clr, R1in, BusMux_R1);
	gen_register R2 (Mux_Out, clk, clr, R2in, BusMux_R2);
	gen_register R3 (Mux_Out, clk, clr, R3in, BusMux_R3);
	gen_register R4 (Mux_Out, clk, clr, R4in, BusMux_R4);
	gen_register R5 (Mux_Out, clk, clr, R5in, BusMux_R5);
	gen_register R6 (Mux_Out, clk, clr, R6in, BusMux_R6);
	gen_register R7 (Mux_Out, clk, clr, R7in, BusMux_R7);
	gen_register R8 (Mux_Out, clk, clr, R8in, BusMux_R8);
	gen_register R9 (Mux_Out, clk, clr, R9in, BusMux_R9);
	gen_register R10 (Mux_Out, clk, clr, R10in, BusMux_R10);
	gen_register R11 (Mux_Out, clk, clr, R11in, BusMux_R11);
	gen_register R12 (Mux_Out, clk, clr, R12in, BusMux_R12);
	gen_register R13 (Mux_Out, clk, clr, R13in, BusMux_R13);
	gen_register R14 (Mux_Out, clk, clr, R14in, BusMux_R14);
	gen_register R15 (Mux_Out, clk, clr, R15in, BusMux_R15);
	
	// Registers
	gen_register InPort (Mux_Out, clk, clr, enable_OutPort, BusMux_InPort);		// InPort
	gen_register C (Mux_Out, clk, clr, enable_C, BusMux_C);			// C
	gen_register Y (Mux_Out, clk, clr, enable_Y, BusMux_Y);    	  // Y
	gen_register HI (Mux_Out, clk, clr, enable_HI, BusMux_HI); 	  // HIs
	gen_register LO (Mux_Out, clk, clr, enable_LO, BusMux_LO);    // LO
	gen_register ZHI (ALU_Data[63:32], clk, clr, enable_ZHI, BusMux_ZHI); // ZHI
	gen_register ZLO (ALU_Data[31:0], clk, clr, enable_ZLO, BusMux_ZLO); // ZLO
	gen_register MAR (Mux_Out, clk, clr, enable_MAR, BusMux_MAR);	// MAR
	
	// PC and IR Registers
	pc_register PC (Mux_Out, clk, clr, IncPC, enable_PC, BusMux_PC); // PC
	gen_register IR (Mux_Out, clk, clr, enable_IR, BusMux_IR); // IR
	
	// MDR Register
	mdr_mux MDR_MUX (Mux_Out, Read, MDAtain, MDR_MuxOut);
	mdr_register MDR (MDR_MuxOut, clk, clr, Read, enable_MDR, MDAtain, BusMux_MDR);
	
	encoder_32_5 encoder (R0out, R1out, R2out, R3out, R4out,
								 R5out, R6out, R7out, R8out, R9out,
								 R10out, R11out, R12out, R13out, R14out, R15out,
								 select_PC, select_HI, select_LO, select_ZHI, select_ZLO, 
								 select_InPort, select_MDR, select_MAR, select_C, Mux_Select);
	
	mux_32_1 multiplexer (BusMux_R0, BusMux_R1, BusMux_R2, 
								 BusMux_R3, BusMux_R4, BusMux_R5, BusMux_R6, 
								 BusMux_R7, BusMux_R8, BusMux_R9, BusMux_R10, 
								 BusMux_R11, BusMux_R12, BusMux_R13, BusMux_R14, 
								 BusMux_R15, BusMux_HI, BusMux_LO, BusMux_ZHI, 
								 BusMux_ZLO, BusMux_PC, BusMux_MDR, BusMux_MAR, BusMux_InPort, 
								 BusMux_C, Mux_Select, Mux_Out);							 
	
	// ALU
	
	ALU ALU_instance (BusMux_Y, Mux_Out, OP, ALU_Data);

endmodule 