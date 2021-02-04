module SHIFTER(
input [31:0] data_in, 
input [31:0] shift_amount, 
input shift_direction, 
output reg [31:0] shifter_output 
);
always @(data_in)
begin
//shift right operation
if(shift_direction) 
	shifter_output <= data_in >> shift_amount;
else
	shifter_output <= data_in << shift_amount;
end

endmodule