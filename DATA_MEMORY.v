module DATA_MEMORY(
input clock,
input WE,
input [31:0] WD,
input [31:0] A,
output [31:0] RD
);

reg [7:0] Memory [15:0];
//read operation is combinational.
assign RD = {Memory[A+3],Memory[A+2],Memory[A+1],Memory[A]};

initial
begin
Memory[0] = 8'b0;
Memory[1] = 8'b0;
Memory[2] = 8'b0;
Memory[3] = 8'b0;
Memory[4] = 8'b1;
Memory[5] = 8'b0;
Memory[6] = 8'b0;
Memory[7] = 8'b0;
Memory[8] = 8'b10;
Memory[9] = 8'b0;
Memory[10] = 8'b0;
Memory[11] = 8'b0;
Memory[12] = 8'b11;
Memory[13] = 8'b10;
Memory[14] = 8'b0;
Memory[15] = 8'b0;
end


always @(posedge clock) // write operation is sequential
begin
if(WE)
	{Memory[A+3],Memory[A+2],Memory[A+1],Memory[A]} <= WD;
end

endmodule
