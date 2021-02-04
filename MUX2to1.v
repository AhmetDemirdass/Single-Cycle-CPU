module MUX2to1 #(parameter W = 2)(
input wire [W-1:0] mux_in_1,
input select,
input wire [W-1:0] mux_in_0,
output reg [W-1:0] mux_out
);

always@(mux_in_1 or mux_in_0 or select)
begin
	if(select)
		mux_out[W-1:0] = mux_in_1[W-1:0];
	else
		mux_out[W-1:0] = mux_in_0[W-1:0];
end

endmodule
