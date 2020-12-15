module logic_unit(A, B, D, out);
	input A, B;
	input [2:0]D;
	output [2:0]out;
	reg [2:0]out;
	
	always @(*) begin
		out[0] = (A & B) & D[0];
		out[1] = (A | B) & D[1];
		out[2] = ~B & D[2];
	end
endmodule
	