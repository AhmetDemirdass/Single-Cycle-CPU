module DECODER(
input [1:0] decoder_in,
output [3:0] decoder_out
);

assign 	decoder_out[3] = decoder_in[1] & decoder_in[0],  
			decoder_out[2] = decoder_in[1] & ~decoder_in[0], 
			decoder_out[1] = ~decoder_in[1] & decoder_in[0], 
			decoder_out[0] = ~decoder_in[1] & ~decoder_in[0] ; 

endmodule
