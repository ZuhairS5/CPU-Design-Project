// Zuhair Shaikh and Brant Lan Li
// Datapath (Bus)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

module datapath (
	// CPU signals
	input clk, clr,
	
	// Enable Signals
	input wire [15:0] enable_GPR,
	input wire enable_PC,
	input wire enable_IR,
	input wire enable_HI, 
	input wire enable_LO,
	input wire enable_ZHI,
	input wire enable_ZLO
	input wire enable_MAR,
	input wire enable_MDR,
	input wire enable_OutPort,
	input wire enable_C,
	input wire enable_Y,
	
	// Encoder Signals
	input wire [15:0] select_E,
	input wire select_PC,
	input wire select_HI,
	input wire select_LO,
	input wire select_ZHI,
	input wire select_ZLO,
	input wire select_MDR,
	input wire select_InPort,
	input wire select_C,
	
	input wire [1:0] Read,
	input wire [31:0] MDAtain
	input	wire [31:0] IncPC;
	
	// ALU Operation Code
	input wire [4:0] alu_op,
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
	wire [31:0] BusMux_InPort;
	wire [31:0] BusMux_C;
	wire [31:0] BusMux_Y;
	wire [4:0] encoder_select,
	
	// Bus Signals
	wire [31:0] Bus_Data;		
	wire [31:0] MDR_Out;
	wire [8:0] MAR_Out;
	wire [63:0] ALU_Data;
	
	// R0-R15 Registers
	gen_register R0 (Bus_Data, clk, clr, enable_GPR[0], BusMux_R0);
	gen_register R1 (Bus_Data, clk, clr, enable_GPR[1], BusMux_R1);
	gen_register R2 (Bus_Data, clk, clr, enable_GPR[2], BusMux_R2);
	gen_register R3 (Bus_Data, clk, clr, enable_GPR[3], BusMux_R3);
	gen_register R4 (Bus_Data, clk, clr, enable_GPR[4], BusMux_R4);
	gen_register R5 (Bus_Data, clk, clr, enable_GPR[5], BusMux_R5);
	gen_register R6 (Bus_Data, clk, clr, enable_GPR[6], BusMux_R6);
	gen_register R7 (Bus_Data, clk, clr, enable_GPR[7], BusMux_R7);
	gen_register R8 (Bus_Data, clk, clr, enable_GPR[8], BusMux_R8);
	gen_register R9 (Bus_Data, clk, clr, enable_GPR[9], BusMux_R9);
	gen_register R10 (Bus_Data, clk, clr, enable_GPR[10], BusMux_R10);
	gen_register R11 (Bus_Data, clk, clr, enable_GPR[11], BusMux_R11);
	gen_register R12 (Bus_Data, clk, clr, enable_GPR[12], BusMux_R12);
	gen_register R13 (Bus_Data, clk, clr, enable_GPR[13], BusMux_R13);
	gen_register R14 (Bus_Data, clk, clr, enable_GPR[14], BusMux_R14);
	gen_register R15 (Bus_Data, clk, clr, enable_GPR[15], BusMux_R15);
	
	// Registers
	gen_register InPort (Bus_Data, clk, clr, enable_OutPort, BusMux_InPort);		// InPort
	gen_register C (Bus_Data, clk, clr, enable_C, BusMux_C);			// C
	gen_register Y (Bus_Data, clk, clr, enable_Y, BusMux_Y);    	  // Y
	gen_register HI (Bus_Data, clk, clr, enable_HI, BusMux_HI); 	  // HIs
	gen_register LO (Bus_Data, clk, clr, enable_LO, BusMux_LO);    // LO
	gen_register ZHI (ALU_Data[63:32], clk, clr, enable_ZHI, BusMux_ZHI); // ZHI
	gen_register ZLO (ALU_Data[31:0], clk, clr, enable_ZLO, BusMux_ZLO); // ZLO
	
	// PC and IR Registers
	pc_register PC (Bus_Data, clk, clr, IncPC, enable_PC, BusMux_PC); // PC
	gen_register IR (Bus_Data, clk, clr, enable_IR, BusMux_IR); // IR
	
	// MDR Register
	mdr_register MDR(clr, clk, enable_MDR, Bus_Data, BusMux_MDR, Read, MDR_Out, MDAtain);
	
	// MAR Register
	mar_register MAR(enable_MAR, MAR_Out);
	
	encoder_32_5 encoder (select_E[0], select_E[1], select_E[2], select_E[3],
								 select_E[4], select_E[5], select_E[6], select_E[7],
								 select_E[8], select_E[9], select_E[10], select_E[11],
								 select_E[12], select_E[13], select_E[14], select_E[15],
								  select_HI, select_LO, select_ZHI, select_ZLO, 
								  select_PC, select_MDR, select_InPort, 
								  select_C, encoder_select);
	
	mux_32_1 multiplexer (BusMux_R0, BusMux_R1, BusMux_R2, 
								 BusMux_R3, BusMux_R4, BusMux_R5, BusMux_R6, 
								 BusMux_R7, BusMux_R8, BusMux_R9, BusMux_R10, 
								 BusMux_R11, BusMux_R12, BusMux_R13, BusMux_R14, 
								 BusMux_R15, BusMux_HI, BusMux_LO, BusMux_ZHI, 
								 BusMux_ZLO, BusMux_PC, BusMux_MDR, BusMux_InPort, 
								 BusMux_C, encoder_select, Bus_Data);							 
	
	// ALU
	
	ALU ALU_instance (BusMux_Y, Bus_Data, alu_op, ALU_Data);

endmodule 