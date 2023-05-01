// Zuhair Shaikh and Brant Lan Li
// CON FF Logic
// ELEC374 - Digital Systems Engineering
// Department of Electrical and Computer Engineering
// Queen's University 


module con_ff(
	input wire [1:0] IR_Bits,
	input wire [31:0] Bus_Data,
	input wire CON_In,
	output wire CON_Out
	);
		
	wire [3:0] dOut;
	wire flag;
	
	decoder_2_4 decoder_2_4_instance (IR_Bits, dOut);
	
	assign zero = (Bus_Data == 32'b0) ? 1 : 0;
	assign nzero = !zero;
	assign pos = (Bus_Data[31] == 1'b0) ? 1 : 0;
	assign neg = !pos;
	assign flag = ((zero & dOut[0]) | (nzero & dOut[1]) | (pos & dOut[2]) | (neg & dOut[3]));
	
	d_ff d_ff_instance (flag, CON_In, CON_Out);
	
endmodule