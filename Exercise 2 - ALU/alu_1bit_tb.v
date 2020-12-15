module alu_1bit_tb;
	reg invA, A, enA, B, enB, Cin, f1, f0;
	wire Cout, out;
	
	alu_1bit dut(.invA(invA), .A(A), .enA(enA), .B(B), .enB(enB), .Cin(Cin), .f1(f1), .f0(f0), .Cout(Cout), .out(out));
	
	initial begin
	#0
	f1 = 0; f0 = 1; enA = 1; enB = 0; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 0; f0 = 1; enA = 0; enB = 1; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 0; f0 = 1; enA = 1; enB = 0; invA = 1; Cin = 0; A = 1; B = 1;
	#50
	f1 = 1; f0 = 0; enA = 0; enB = 1; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 1; enB = 1; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 1; enB = 1; invA = 0; Cin = 1; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 1; enB = 0; invA = 0; Cin = 1; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 0; enB = 1; invA = 0; Cin = 1; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 1; enB = 1; invA = 1; Cin = 1; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 0; enB = 1; invA = 1; Cin = 0; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 1; enB = 0; invA = 1; Cin = 1; A = 1; B = 1;
	#50
	f1 = 0; f0 = 0; enA = 1; enB = 1; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 0; f0 = 1; enA = 1; enB = 1; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 0; enB = 0; invA = 0; Cin = 0; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 0; enB = 0; invA = 0; Cin = 1; A = 1; B = 1;
	#50
	f1 = 1; f0 = 1; enA = 0; enB = 0; invA = 1; Cin = 0; A = 1; B = 1;
	end
endmodule
