module up_down_counter(up_down, sel, clk, comp, rst_n, y);
	input up_down, clk, comp, rst_n;
	input [1:0]sel;
	output [7:0]y;
	reg [3:0]en;
	wire [7:0]y0, y1, y2, y3;
	reg [7:0]y;
	
	always @(posedge clk) begin
		case (sel) 
			2'b00: en = 4'b0001;
			2'b01: en = 4'b0010;
			2'b10: en = 4'b0100;
			2'b11: en = 4'b1000;
			default en = 4'bxxxx;
		endcase
	end
	
	always @(posedge clk) begin
		case (sel) 
			2'b00: y = y0;
			2'b01: y = y1;
			2'b10: y = y2;
			2'b11: y = y3;
			default y = 8'bxxxxxxxx;
		endcase
	end
	
	up_down_counter_n bit5(.up_down(up_down), .en(en[0]), .clk(clk), .comp(comp), .rst_n(rst_n), .y(y0));
	defparam bit5.SIZE = 5;
	up_down_counter_n bit6(.up_down(up_down), .en(en[1]), .clk(clk), .comp(comp), .rst_n(rst_n), .y(y1));
	defparam bit6.SIZE = 6;
	up_down_counter_n bit7(.up_down(up_down), .en(en[2]), .clk(clk), .comp(comp), .rst_n(rst_n), .y(y2));
	defparam bit7.SIZE = 7;
	up_down_counter_n bit8(.up_down(up_down), .en(en[3]), .clk(clk), .comp(comp), .rst_n(rst_n), .y(y3));
	defparam bit8.SIZE = 8;
	
	
endmodule 