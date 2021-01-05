module clock_divider_tb;
	reg clk, reset;
	reg [1:0]Div;
	wire Div_clk;
	
	clock_divider dut (.clk(clk), .reset(reset), .Div(Div), .Div_clk(Div_clk));
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
		
	end
	
	initial begin
		#0 reset = 0; Div = 2'b00;
		#1000000 reset = 0; Div = 2'b01;
		#1000000 reset = 0; Div = 2'b10;
		#1000000 reset = 0; Div = 2'b11;
	end
endmodule
