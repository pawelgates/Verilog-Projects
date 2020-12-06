module decoder3_8_Beh (a, b, c, D_BEH);
	
	input a, b, c;
	output [7:0]D_BEH;
	reg [7:0]D_BEH;
	wire [2:0] in;
	
	assign in = {a, b, c};
	
	always @(a or b or c) 
		begin
			
			case(in)
				3'd0 : D_BEH = 8'd1;
				3'd1 : D_BEH = 8'd2;
				3'd2 : D_BEH = 8'd4;
				3'd3 : D_BEH = 8'd8;
				3'd4 : D_BEH = 8'd16;
				3'd5 : D_BEH = 8'd32;
				3'd6 : D_BEH = 8'd64;
				3'd7 : D_BEH = 8'd128;
				default: D_BEH = 8'd0;
			endcase
		end	
endmodule 