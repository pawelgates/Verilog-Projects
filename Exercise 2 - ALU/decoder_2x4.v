module decoder_2x4(f1, f0, d);
	input f1, f0;
	output [3:0]d;
	reg [3:0]d;
	
	always @(*) begin
		case({f1,f0})
			2'b00: d = 4'b0001;
			2'b01: d = 4'b0010;
			2'b10: d = 4'b0100;
			2'b11: d = 4'b1000;
			default: d = 4'bxxxx;
		endcase
	end
endmodule