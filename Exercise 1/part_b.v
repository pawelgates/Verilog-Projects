module part_b (a, b, y);
	input [7:0]a; 
	input [3:0]b;
	output [7:0]y;
	reg [7:0]y;
	
	always @(*)
		begin
			y[7:4] = a[3:0] & b[3:0];
			y[3:0] = y[7:4] ^ a[7:4];
		end
endmodule 
