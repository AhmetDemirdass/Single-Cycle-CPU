module ALU #(parameter W = 3)(A, B, I, F, C_out, OVF, Z, N);

	input [W-1:0] A;
	input [W-1:0] B;
	input [2:0] I;

	output reg C_out, OVF, Z, N;
	output reg [W-1:0] F;

always @(A, B, I)
	begin
	case(I)
		3'b000:	begin						// A + B, OVF and C_out are updated 
					{C_out, F} = A + B;
					if (A[W-1] ~^ B[W-1])
						OVF = F[W-1] ^ A[W-1];
					else
						OVF = 0;
					end
		3'b001:	begin						// A - B, OVF and C_out are updated 
					{C_out, F} = A - B;
					if ((A[W-1] ^ B[W-1]))
						OVF = F[W-1] ^ A[W-1];
					else
						OVF = 0;
					end
		3'b010:	begin						// B - A, OVF and C_out are updated  
					{C_out, F} = B - A;
					if ((A[W-1] ^ B[W-1]))
						OVF = F[W-1] ^ B[W-1];
					else
						OVF = 0;
					end
		3'b011:	begin					// Bit Clear
					F = A & ~B;
					C_out = 0;
					OVF = 0;
					end
		3'b100:	begin					// A and B
					F = A & B;
					C_out = 0;
					OVF = 0;
					end
		3'b101:	begin					// A or B
					F = A | B;
					C_out = 0;
					OVF = 0;
					end
		3'b110:	begin					// A exor B
					F = A ^ B;
					C_out = 0;
					OVF = 0;				
					end
		3'b111:	begin					// A exnor B
					F = A ~^ B;
					C_out = 0;
					OVF = 0;
					end
	endcase			
	N = F[W-1];
	Z = (F == 0);
	end
endmodule