module MAIN_DECODER(
input [5:0] FUNCT,
input [1:0] Op,
output reg [1:0] Result_Src,
output reg  Reg_Write, Mem_Write, ALU_Src, Reg_Src, ALU_Op, Shift_Dir
);


always @ (FUNCT, Op)
	begin
		//data processing instr.
		if(Op[1:0] == 2'b00) begin
			// ORR, SUB, AND, ADD
			if(FUNCT[5] == 0 & (FUNCT[4:1] == 4'b0100 | FUNCT[4:1] == 4'b0010 | FUNCT[4:1] == 4'b0000 | FUNCT[4:1] == 4'b1100)) 
			begin
				Result_Src = 2'b01;
				Mem_Write = 0;
				ALU_Src = 0; 
				Reg_Write = 1;
				Reg_Src = 0;
				ALU_Op = 1;
			//LSR
			end 
			else if(FUNCT[5] == 1 & FUNCT[4:1] == 4'b0001) 
			begin
				Result_Src = 2'b10;
				Mem_Write = 0; 
				Reg_Write = 1;
				ALU_Op = 0;
				Shift_Dir = 1;
			//LSL
			end 
			else if(FUNCT[5] == 1 & FUNCT[4:1] == 4'b0011) 
			begin
				Result_Src = 2'b10;
				Mem_Write = 0; 
				Reg_Write = 1;
				ALU_Op = 0;
				Shift_Dir = 0;

			//CMP
			end else if(FUNCT[5] == 0 & FUNCT[4:1] == 4'b1010) 
			begin
				Mem_Write = 0;
				ALU_Src = 0;
				Reg_Write = 0;
				Reg_Src = 0;
				ALU_Op = 1;
			end
		//Memory instructions
		end 
		else if(Op[1:0] == 2'b01) 
		begin
			//LDR
			if(FUNCT[0] == 1 & FUNCT[5] == 0) 
			begin
				Result_Src = 2'b00;
				Mem_Write = 0;
				ALU_Src = 1; 
				Reg_Write = 1;
				ALU_Op = 0;
			//STR
			end 
			else if(FUNCT[0] == 0 & FUNCT[5] == 0) 
			begin
				Mem_Write = 1;
				ALU_Src = 1; 
				Reg_Write = 1;
				Reg_Src = 1;
				ALU_Op = 0;
			end
		end
	end
		
endmodule