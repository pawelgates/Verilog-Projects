module up_down_counter_tb;
	reg up_down, clk, comp, rst_n;
	reg [1:0]sel;
	wire [7:0]y;
	
	up_down_counter dut(.up_down(up_down), .sel(sel), .clk(clk), .comp(comp), .rst_n(rst_n), .y(y));
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
		rst_n = 1;
	end
	
	initial begin
		#0 up_down = 0; sel = 2'b00; comp = 0; rst_n = 1;
		#20 up_down = 0; sel = 2'b00; comp = 0; rst_n = 0;
		#300 up_down = 0; sel = 2'b01; comp = 0; rst_n = 0;
		#300 up_down = 0; sel = 2'b10; comp = 0; rst_n = 0;
		#300 up_down = 0; sel = 2'b11; comp = 0; rst_n = 0;
		#300 up_down = 1; sel = 2'b00; comp = 0; rst_n = 0;
		#300 up_down = 0; sel = 2'b00; comp = 1; rst_n = 0;
	end
endmodule