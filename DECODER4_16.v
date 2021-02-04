module DECODER4_16(
input wire [3:0] dec_in,
output [15:0] dec_out
);

assign dec_out[15] = dec_in[3] & dec_in[2] & dec_in[1] & dec_in[0],
		 dec_out[14] = dec_in[3] & dec_in[2] & dec_in[1] & ~dec_in[0],
		 dec_out[13] = dec_in[3] & dec_in[2] & ~dec_in[1] & dec_in[0],
		 dec_out[12] = dec_in[3] & dec_in[2] & ~dec_in[1] & ~dec_in[0],
		 dec_out[11] = dec_in[3] & ~dec_in[2] & dec_in[1] & dec_in[0],
		 dec_out[10] = dec_in[3] & ~dec_in[2] & dec_in[1] & ~dec_in[0],
		 dec_out[9] = dec_in[3] & ~dec_in[2] & ~dec_in[1] & dec_in[0],
		 dec_out[8] = dec_in[3] & ~dec_in[2] & ~dec_in[1] & ~dec_in[0],
		 dec_out[7] = ~dec_in[3] & dec_in[2] & dec_in[1] & dec_in[0],
		 dec_out[6] = ~dec_in[3] & dec_in[2] & dec_in[1] & ~dec_in[0],
		 dec_out[5] = ~dec_in[3] & dec_in[2] & ~dec_in[1] & dec_in[0],
		 dec_out[4] = ~dec_in[3] & dec_in[2] & ~dec_in[1] & ~dec_in[0],
		 dec_out[3] = ~dec_in[3] & ~dec_in[2] & dec_in[1] & dec_in[0],
		 dec_out[2] = ~dec_in[3] & ~dec_in[2] & dec_in[1] & ~dec_in[0],
		 dec_out[1] = ~dec_in[3] & ~dec_in[2] & ~dec_in[1] & dec_in[0],
		 dec_out[0] = ~dec_in[3] & ~dec_in[2] & ~dec_in[1] & ~dec_in[0];
		 
endmodule
