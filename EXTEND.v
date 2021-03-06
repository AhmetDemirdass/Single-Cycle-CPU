module EXTEND(
input [23:0] ext_in,
input [1:0] imm_src,
output reg [31:0] ext_out
);

always
begin
case(imm_src)
2'b00: ext_out <= {24'b0, ext_in[7:0]};
2'b01: ext_out <= {20'b0, ext_in[11:0]};
endcase
end

endmodule
