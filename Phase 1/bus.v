// Zuhair Shaikh and Brant Lan Li
// Bidirectional Bus 
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 

module bus (BusMuxOut, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,								// 32:1 mulitplexer ports
				BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,
				BusMuxInHI, BusMuxInLO, BuxMuxInZHI, BusMuxInZLO, BusMuxInPC, BusMuxInMDR, BusMuxInPort, BusMuxInC, BusMuxInR24, 
				BusMuxInR25, BusMuxInR26, BusMuxInR27, BusMuxInR28, BusMuxInR29, BusMuxInR30, BusMuxInR31, select_out_signal);


      	output reg [31:0] BusMuxOut;		// Multitplexer inputs
	input wire [31:0] BusMuxInR0; 
	input wire [31:0] BusMuxInR1;
	input wire [31:0] BusMuxInR2; 
	input wire [31:0] BusMuxInR3; 
	input wire [31:0] BusMuxInR4; 
	input wire [31:0] BusMuxInR5; 
	input wire [31:0] BusMuxInR6; 
	input wire [31:0] BusMuxInR7;								
	input wire [31:0] BusMuxInR8; 
	input wire [31:0] BusMuxInR9; 
	input wire [31:0] BusMuxInR10; 
	input wire [31:0] BusMuxInR11; 
	input wire [31:0] BusMuxInR12; 
	input wire [31:0] BusMuxInR13; 
	input wire [31:0] BusMuxInR14; 
	input wire [31:0] BusMuxInR15;
	input wire [31:0] BusMuxInHI; 
	input wire [31:0] BusMuxInLO; 
	input wire [31:0] BuxMuxInZHI; 
	input wire [31:0] BusMuxInZLO; 
	input wire [31:0] BusMuxInPC; 
	input wire [31:0] BusMuxInMDR; 
	input wire [31:0] BusMuxInPort; 
	input wire [31:0] BusMuxInC;
	input wire [31:0] BusMuxInR24;
	input wire [31:0] BusMuxInR25;
	input wire [31:0] BusMuxInR26;
	input wire [31:0] BusMuxInR27;
	input wire [31:0] BusMuxInR28;
	input wire [31:0] BusMuxInR29;
	input wire [31:0] BusMuxInR30;
	input wire [31:0] BusMuxInR31;


	output reg [4:0] select_out_signal;	// Bus Output 

	encoder_32_5 encode (BusR0Out, BusR1Out, BusR2Out, BusR3Out, BusR4Out, BusR5Out, BusR6Out, BusR7Out, 					// encoding 
			     BusR8Out, BusR9Out, BusR10Out, BusR11Out, BusR12Out, BusR13Out, BusR14Out, BusR15Out,											 
			     BusHIOut, BusLOOut, BusZHIOut, BusZLOOut, BusPCOut, BusMDROut, BusInPortOut, BusCOut, 
		             BusR24Out, BusR25Out, BusR26Out, BusR27Out, BusR28Out, BusR29Out, BusR30Out, BusR31Out, BusEncoderSelect);

	mux_31_1 muxing (BusMuxOut, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,		// multiplexing (associate each encoding with MUX input to get BUS output)
			 BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,
		         BusMuxInHI, BusMuxInLO, BuxMuxInZHI, BusMuxInZLO, BusMuxInPC, BusMuxInMDR, BusMuxInPort, BusMuxInC, BusMuxIn24, 
			 BusMuxIn25, BusMuxIn26, BusMuxIn27, BusMuxIn28, BusMuxIn29, BusMuxIn30, BusMuxIn31, select_out_signal);
				
endmodule	
