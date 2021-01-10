module state_machine (clk, reset, req_0, req_1, req_2, req_3, gnt_0, gnt_1, gnt_2, gnt_3);

	input   clk, reset, req_0, req_1, req_2, req_3;
	output  gnt_0, gnt_1, gnt_2, gnt_3;
	
	wire    clk, reset, req_0, req_1, req_2, req_3;
	reg     gnt_0, gnt_1, gnt_2, gnt_3;
	
	parameter SIZE = 5;
	parameter IDLE  = 5'b00001, GNT0 = 5'b00010, GNT1 = 5'b00100, GNT2 = 5'b01000, GNT3 = 5'b10000;
	
	reg [SIZE-1:0]state;
	reg [SIZE-1:0]next_state;

	always @ (state or req_0 or req_1 or req_2 or req_3) begin : FSM_COMBO
		 next_state = 5'b00000;
		 case(state)
			IDLE : if (req_0 == 1'b1) begin
							 next_state = GNT0;
						  end else if (req_1 == 1'b1) begin
							 next_state= GNT1;
						  end else if (req_2 == 1'b1) begin
							 next_state= GNT2;
						  end else if (req_3 == 1'b1) begin
							 next_state= GNT3;
						  end else begin
							 next_state = IDLE;
						  end
			GNT0 : if (req_0 == 1'b1) begin
							 next_state = GNT0;
						  end else begin
							 next_state = IDLE;
						  end
			GNT1 : if (req_1 == 1'b1) begin
							 next_state = GNT1;
						  end else begin
							 next_state = IDLE;
						  end
			GNT2 : if (req_2 == 1'b1) begin
							 next_state = GNT2;
						  end else begin
							 next_state = IDLE;
						  end
			GNT3 : if (req_3 == 1'b1) begin
							 next_state = GNT3;
						  end else begin
							 next_state = IDLE;
						  end
			default : next_state = IDLE;
		  endcase
	end

	always @ (posedge clk) begin : FSM_SEQ
		 if (reset == 1'b1) begin
			state <= IDLE;
		 end else begin
			state <= next_state;
		 end
	end
	
	always @ (posedge clk) begin : OUTPUT_LOGIC
		if (reset == 1'b1) begin
		  gnt_0 <= 1'b0;
		  gnt_1 <= 1'b0;
		  gnt_2 <= 1'b0;
		  gnt_3 <= 1'b0;
		end
		
		else begin
		  case(state)
			 IDLE: begin
							gnt_0 <= #1 1'b0;
							gnt_1 <= #1 1'b0;
							gnt_2 <= #1 1'b0;
							gnt_3 <= #1 1'b0;
					 end
			 GNT0: begin
							gnt_0 <= #1 1'b1;
							gnt_1 <= #1 1'b0;
							gnt_2 <= #1 1'b0;
							gnt_3 <= #1 1'b0;
					 end
			 GNT1: begin
							gnt_0 <= #1 1'b0;
							gnt_1 <= #1 1'b1;
							gnt_2 <= #1 1'b0;
							gnt_3 <= #1 1'b0;
					 end
			 GNT2: begin
							gnt_0 <= #1 1'b0;
							gnt_1 <= #1 1'b0;
							gnt_2 <= #1 1'b1;
							gnt_3 <= #1 1'b0;
					 end
			 GNT3: begin
							gnt_0 <= #1 1'b0;
							gnt_1 <= #1 1'b0;
							gnt_2 <= #1 1'b0;
							gnt_3 <= #1 1'b1;
					 end
			 default: begin
								gnt_0 <= #1 1'b0;
								gnt_1 <= #1 1'b0;
								gnt_2 <= #1 1'b0;
							   gnt_3 <= #1 1'b0;
						 end
		  endcase
		end
	end 

endmodule 