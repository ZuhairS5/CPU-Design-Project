// Zuhair Shaikh and Brant Lan Li
// Branch Instructions Testbench (BRZR, BRNZ, BRPL, BRMI)
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University

`timescale 1ns/10ps
module br_tb; // brzr, brnz, brpl, brmi
	reg	Clock, Clear;
	reg 	PCin, IRin, HIin, LOin, ZHighin, ZLowin, MARin, MDRin, OutPort, Yin;
	reg 	PCout, HIout, LOout, ZHighout, ZLowout, InPort, MDRout, Cout;
	reg 	Gra, Grb, Grc, Rin, Rout, BAout, Read, Write, IncPC;
	reg 	CON_In;
	reg 	[4:0] OP;
	wire  CON_Out;
	reg 	GLR;

parameter	Default = 6'b000000;
parameter   T0 = 6'b000001,   T1 = 6'b000010,   T2 = 6'b000011,   T3 = 6'b000100,   
				T4 = 6'b000101,   T5 = 6'b000110,   T6 = 6'b000111;

reg	[5:0] Present_state = Default;

initial Clear = 0;

datapath datapath_instance(
	Clock, Clear,
	PCin, IRin, HIin, LOin, ZHighin, ZLowin, MARin, MDRin, OutPort, Yin,
	PCout, HIout, LOout, ZHighout, ZLowout, InPort, MDRout, Cout,
	Gra, Grb, Grc, Rin, Rout, BAout, Read, Write, IncPC,
	CON_In, OP, CON_Out, GLR
	);
	
initial 
	begin
//		datapath_instance.ram_instance.memory[0] = 32'h9B000019; // brzr R6, 25 // [skip]
		
//		datapath_instance.ram_instance.memory[0] = 32'h9B080019; // brnz R6, 25 // [branch]
		
//		datapath_instance.ram_instance.memory[0] = 32'h9B100019; // brpl R6, 25 // [skip]
		
		datapath_instance.ram_instance.memory[0] = 32'h9B180019; // brmi R6, 25 // [branch]
		
		Clock = 0;
		forever #10 Clock = ~ Clock;
	end

always @(posedge Clock)
begin
	case (Present_state)
		Default      : #30 Present_state = T0;
		T0           : #30 Present_state = T1;
		T1           : #30 Present_state = T2;
		T2           : #30 Present_state = T3;
		T3           : #30 Present_state = T4;
		T4           : #30 Present_state = T5;
		T5           : #30 Present_state = T6;
		endcase
end

always @(Present_state)
begin
	case (Present_state)
		Default: begin
				{PCin, IRin, HIin, LOin, ZHighin, ZLowin, MARin, MDRin, OutPort, Yin} <= 0;
				{PCout, HIout, LOout, ZHighout, ZLowout, InPort, MDRout, Cout} <= 0;
				{Gra, Grb, Grc, Rin, Rout, BAout, Read, Write, IncPC, GLR} <= 0;
				CON_In <= 0;
				OP <= 5'b00000;
		end
		T0: begin
				PCout <= 1; MARin <= 1; Read <= 1; MDRin <= 1;
				#40 PCout <= 0; MARin <= 0; Read <= 0; MDRin <= 0;
		end
		T1: begin
				IncPC <= 1;
				#20 IncPC <= 0;
		end
		T2: begin
				MDRout <= 1; IRin <= 1;
				#40 MDRout <= 0; IRin <= 0;
		end
		T3: begin
				Gra <= 1; Rout <= 1; CON_In <= 1;
				#40 Gra <= 0; Rout <= 0; CON_In <= 0;
		end
		T4: begin
				PCout <= 1; Yin <= 1;
				#40 PCout <= 0; Yin <= 0;
		end
		T5: begin
				Cout <= 1; OP <= 5'b00100; ZLowin <= 1; ZHighin <= 1;
				#40 Cout <= 0; ZLowin <= 0; ZHighin <= 0;
		end
		T6: begin
				ZLowout <= 1; PCin <= CON_Out;
				#40 ZLowout <= 0; PCin <= 0;
		end
	endcase
end
endmodule