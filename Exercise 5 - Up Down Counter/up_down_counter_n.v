module up_down_counter_n(up_down, en, clk, comp, rst_n, y);
	parameter SIZE = 4;
	input up_down, en, clk, comp, rst_n;
	output [7:0]y;
	reg [7:0]y;
	integer i;
	
	always @(posedge clk or posedge rst_n) begin
		if(rst_n) begin
			y = 0;
		end
		
		else if(comp == 1'b1) begin
			for(i=0; i<8; i=i+1) begin
				y[i] = ~y[i];
			end
			y = y + 1;
		end
		
		else if(en == 1'b1) begin
			if(up_down == 1'b0) begin
				if(y == 2**SIZE-1) y = 0;
				y = y + 1;
			end
			if(up_down == 1'b1) begin
				if(y == 0) y = 2**SIZE;
				y = y - 1;
			end
		end
	end

endmodule
