module MUX16to1 #(parameter W = 32)(
input [3:0] select,
input wire [W-1:0] mux_in_0,
input wire [W-1:0] mux_in_1,
input wire [W-1:0] mux_in_2,
input wire [W-1:0] mux_in_3,
input wire [W-1:0] mux_in_4,
input wire [W-1:0] mux_in_5,
input wire [W-1:0] mux_in_6,
input wire [W-1:0] mux_in_7,
input wire [W-1:0] mux_in_8,
input wire [W-1:0] mux_in_9,
input wire [W-1:0] mux_in_10,
input wire [W-1:0] mux_in_11,
input wire [W-1:0] mux_in_12,
input wire [W-1:0] mux_in_13,
input wire [W-1:0] mux_in_14,
input wire [W-1:0] mux_in_15,
output [W-1:0] mux_out
);

assign mux_out[W-1:0] = (select == 4'b0000)? mux_in_0[W-1:0] : 32'bz,
       mux_out[W-1:0] = (select == 4'b0001)? mux_in_1[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b0010)? mux_in_2[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b0011)? mux_in_3[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b0100)? mux_in_4[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b0101)? mux_in_5[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b0110)? mux_in_6[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b0111)? mux_in_7[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1000)? mux_in_8[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1001)? mux_in_9[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1010)? mux_in_10[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1011)? mux_in_11[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1100)? mux_in_12[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1101)? mux_in_13[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1110)? mux_in_14[W-1:0] : 32'bz,
		 mux_out[W-1:0] = (select == 4'b1111)? mux_in_15[W-1:0] : 32'bz;



endmodule