module register_file #(parameter W=32)(
input clock,
input rst,
input [3:0] A3,
input [3:0] A2,
input [3:0] A1,
input [W-1:0] WD3,
input [W-1:0] R15,
input enable,
output [W-1:0] RD1,
output [W-1:0] RD2
); 

wire [15:0] decoder_out;
wire wen_0,wen_1,wen_2,wen_3,wen_4,wen_5,wen_6,wen_7,wen_8,wen_9,wen_10,wen_11,wen_12,wen_13,wen_14,wen_15;
wire register0,register1,register2,register3,register4,register5,register6,register7,register8,register9,register10,register11,register12,register13,register14,register15;

assign wen_0 = decoder_out[0] & enable,
		 wen_1 = decoder_out[1] & enable,
		 wen_2 = decoder_out[2] & enable,
		 wen_3 = decoder_out[3] & enable,
		 wen_4 = decoder_out[4] & enable,
		 wen_5 = decoder_out[5] & enable,
		 wen_6 = decoder_out[6] & enable,
		 wen_7 = decoder_out[7] & enable,
		 wen_8 = decoder_out[8] & enable,
		 wen_9 = decoder_out[9] & enable,
		 wen_10 = decoder_out[10] & enable,
		 wen_11 = decoder_out[11] & enable,
		 wen_12 = decoder_out[12] & enable,
		 wen_13 = decoder_out[13] & enable,
		 wen_14 = decoder_out[14] & enable,
		 wen_15 = decoder_out[15] & enable;

		 
MUX16to1 mux1(A1,register0,register1,register2,register3,register4,register5,register6,register7,register8,register9,register10,register11,register12,register13,register14,register15,RD1);
MUX16to1 mux2(A2,register0,register1,register2,register3,register4,register5,register6,register7,register8,register9,register10,register11,register12,register13,register14,register15,RD2);

register_wen  #(W) register_0(clock,rst,wen_0,WD3,register0);
register_wen  #(W) register_1(clock,rst,wen_1,WD3,register1);
register_wen  #(W) register_2(clock,rst,wen_2,WD3,register2);
register_wen  #(W) register_3(clock,rst,wen_3,WD3,register3);
register_wen  #(W) register_4(clock,rst,wen_4,WD3,register4);
register_wen  #(W) register_5(clock,rst,wen_5,WD3,register5);
register_wen  #(W) register_6(clock,rst,wen_6,WD3,register6);
register_wen  #(W) register_7(clock,rst,wen_7,WD3,register7);
register_wen  #(W) register_8(clock,rst,wen_8,WD3,register8);
register_wen  #(W) register_9(clock,rst,wen_9,WD3,register9);
register_wen  #(W) register_10(clock,rst,wen_10,WD3,register10);
register_wen  #(W) register_11(clock,rst,wen_11,WD3,register11);
register_wen  #(W) register_12(clock,rst,wen_12,WD3,register12);
register_wen  #(W) register_13(clock,rst,wen_13,WD3,register13);
register_wen  #(W) register_14(clock,rst,wen_14,WD3,register14);
register_wen  #(W) register_15(clock,rst,wen_15,R15,register15);

DECODER4_16 dec(A3,decoder_out);

endmodule