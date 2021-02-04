module INSTRUCTION_MEMORY(
input [31:0] A,
output [31:0] RD
);
reg [7:0] Memory[35:0] ;

initial 
begin
// for data processing instructions(ADD,SUB,AND,ORR,LSR,LSL,CMP) 
//the instruction format is {cond,op,I,cmd,S,Rn,Rd,Src2}
{Memory[3],Memory[2],Memory[1],Memory[0]} 		= 32'b11100000100000010000000000000010;  //ADD
{Memory[7],Memory[6],Memory[5],Memory[4]} 		= 32'b11100000010000010000000000000010;  //SUB
{Memory[11],Memory[10],Memory[9],Memory[8]} 		= 32'b11100000000000010000000000000010;	//AND
{Memory[15],Memory[14],Memory[13],Memory[12]} 	= 32'b11100001100000010000000000000010;	//ORR
{Memory[19],Memory[18],Memory[17],Memory[16]} 	= 32'b11100010001000010000000000000001;   //LSR
{Memory[23],Memory[22],Memory[21],Memory[20]} 	= 32'b11100010011000010000000000000001;   //LSL
{Memory[27],Memory[26],Memory[25],Memory[24]} 	= 32'b11100001010000010000000000000010;   //CMP
// for memory instructions(LDR and STR) the instruction format is 
//{cond,op,I,P,U,B,W,Rn,Rd,Src2}
{Memory[31],Memory[30],Memory[29],Memory[28]} 	= 32'b11100100000100010001000000000100;	//STR
{Memory[35],Memory[34],Memory[33],Memory[32]} 	= 32'b11100100000100110010000000001000;	//LDR
end


assign RD = {Memory[A+3],Memory[A+2],Memory[A+1],Memory[A]};

endmodule