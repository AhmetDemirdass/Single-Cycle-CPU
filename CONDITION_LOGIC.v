module CONDITION_LOGIC(
input [3:0] cond, 
input [3:0] ALU_Flags,
input [1:0] FlagW,
input clk, Memory_Wr, NoWrite, PCS, Register_Wr, 
output wire PCSrc, Register_Write, Memory_Write
);
	

wire [1:0] Flags_NZ, Flags_CV, FW;
reg CondEx;
	

always @ (cond or Flags_NZ[0]) 
begin
	if(cond[3:0] == 4'b1110) 
	begin
		CondEx = 1;
	end 
	else if((cond[3:0] == 4'b0000) & Flags_NZ[0] == 1) 
	begin
		CondEx = 1;
		end 
		else 
		begin
		CondEx = 0;
	end
end

and a1(FW[1], FlagW[1], CondEx);
and a2(FW[0], FlagW[0], CondEx);
	
register_wen #(2) Flags_NZ_reg(clk, 0, FW[1], ALU_Flags[3:2], Flags_NZ[1:0]);
register_wen #(2) Flags_CV_reg(clk, 0, FW[0], ALU_Flags[1:0], Flags_CV[1:0]);
	
and a3(PCSrc, PCS, CondEx);
and a4(Memory_Write, Memory_Wr, CondEx);
and a5(Register_Write, ~NoWrite, Register_Wr, CondEx);
	



endmodule