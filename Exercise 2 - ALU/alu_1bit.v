module alu_1bit(invA, A, enA, B, enB, Cin, f1, f0, Cout, out);

	input invA, A, enA, B, enB, Cin, f1, f0;
	output Cout, out;
	reg out;
	wire A1 = invA ^ (A & enA);
	wire B1 = B & enB;
	wire [3:0]d;
	wire sum;
	wire [2:0]out_logic;
	
	decoder_2x4 dut(.f1(f1), .f0(f0), .d(d));
	full_adder dut1(.D3(d[3]), .A(A1), .B(B1), .Cin(Cin), .Cout(Cout), .SUM(sum));
	logic_unit dut2(.A(A1), .B(B1), .D(d), .out(out_logic));
	
	always @(*) begin
		case(d)
			4'b0001: out = out_logic[0];
			4'b0010: out = out_logic[1];
			4'b0100: out = out_logic[2];
			4'b1000: out = sum;
			default: out = 4'bxxxx;
		endcase
	end
endmodule
