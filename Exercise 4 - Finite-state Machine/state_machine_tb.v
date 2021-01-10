module state_machine_tb;

	reg    clk, reset, req_0, req_1, req_2, req_3;
	wire     gnt_0, gnt_1, gnt_2, gnt_3;
	
	
	state_machine dut (.clk(clk), .reset(reset), .req_0(req_0), .req_1(req_1), .req_2(req_2), .req_3(req_3), .gnt_0(gnt_0), .gnt_1(gnt_1), .gnt_2(gnt_2), .gnt_3(gnt_3));
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
		reset = 1;
	end
	
	initial begin
		reset = 0;
		req_0 = 0; req_1 = 0; req_2 = 0; req_3 = 0;
		#10 req_0 = 1; req_1 = 0; req_2 = 0; req_3 = 0;
		#10 req_0 = 0; req_1 = 1; req_2 = 0; req_3 = 0;
		#10 req_0 = 0; req_1 = 0; req_2 = 1; req_3 = 0;
		#10 req_0 = 0; req_1 = 0; req_2 = 0; req_3 = 1;
		
	end
	
endmodule

