module clock_divider(clk, reset, Div, Div_clk);
	input clk, reset;
	input [1:0]Div;
	output Div_clk;
	reg new_clk;
	reg [18:0]counter_var;
	reg [18:0]count;
	wire status;
	
	always @(posedge clk or posedge reset) begin
		case(Div)
			2'b00:	counter_var = 19'd250000; 
			2'b01:	counter_var = 19'd25000;
			2'b10:	counter_var = 19'd2500;
			2'b11:	counter_var = 19'd250;
			default:	counter_var = 19'd1;
		endcase
	end
	
	assign status = (count == counter_var);
	
	always @(posedge clk or posedge reset) begin
		if (reset)
			count <= 0;
		else if (status)
			count <= 0;
		else
			count <= count + 1;
	end
	
	always @(posedge clk or posedge reset) begin
		if (reset)
			new_clk <= 0;
		else if (status)
			new_clk <= ~new_clk;
		else
			new_clk <= new_clk;
	end
	
	always @(Div) begin
		count <= 0;
		new_clk <= 0;
	end
	
	assign Div_clk = new_clk;
	
endmodule	