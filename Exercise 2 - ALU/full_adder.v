module full_adder(D3, A, B, Cin, Cout, SUM);
	input D3, A, B, Cin;
	output Cout, SUM;
	reg Cout, SUM;
	
	always @(*) begin
		SUM = (A ^ B ^ Cin) & D3;
		Cout = (A & B & D3) | ((A ^ B) & Cin & D3);
	end
endmodule
	