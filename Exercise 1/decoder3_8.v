module decoder3_8 (a, b, c, D);
	input a, b, c;
	output [7:0]D;
		
	assign D[0] = ~a & ~b & ~c;
	assign D[1] = ~a & ~b & c;
	assign D[2] = ~a & b & ~c;
	assign D[3] = ~a & b & c;
	assign D[4] = a & ~b & ~c;
	assign D[5] = a & ~b & c;
	assign D[6] = a & b & ~c;
	assign D[7] = a & b & c;
	
endmodule 