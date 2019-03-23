`timescale 1ns / 1ps

module Controller
(
    input  rst,
	 input  clk,
	 input  op,
	 input  start,
    input  x_gt_y,
    input  x_eq_y,
    input  x_ls_y,
    output reg x_sel,
    output reg y_sel,
    output reg x_en,
    output reg y_en,
    output reg [1:0] x_op,
    output reg [1:0] y_op,
    output reg done_en
);
	
	reg [1:0]next_state = 0;
	reg [1:0]current_state = 0;
	
	always@(posedge clk or posedge rst) begin
			
		if (rst) begin
		
			next_state <= 0;
			
			current_state <= 0;
			
		end else begin
		
			case (current_state)
			
				0:
					if (!rst && start)
						next_state <= 1;
					else
						next_state <= current_state;
				
				1:
					if (done_en)
						next_state <= 2;
					else
						next_state <= current_state;
			
				2:
					if (rst)
						next_state <= 0;
					else
						next_state <= current_state;
			
			endcase
			
			current_state <= next_state;
			
		end
		
	end
	
	always@(posedge clk) begin
	
		case (next_state)
		
			0: begin
		
				x_sel <= 0;
				y_sel <= 0;
				x_en <= 1;
				y_en <= 1;
				x_op <= 0;
				y_op <= 0;
				done_en <= 0;
				
			end
			
			1: begin
			
				if (x_eq_y) begin
				
					x_sel <= 1;
					y_sel <= 1;
					x_en <= 0;
					y_en <= 0;
					x_op <= 0;
					y_op <= 0;
					done_en <= 1;
					
				end
				
				else if (x_gt_y && !op) begin
				
					x_sel <= 1;
					y_sel <= 1;
					x_en <= 1;
					y_en <= 1;
					x_op <= 2;
					y_op <= 0;
					done_en <= 0;
					
				end
				
				else if (x_gt_y && op) begin
				
					x_sel <= 1;
					y_sel <= 1;
					x_en <= 1;
					y_en <= 1;
					x_op <= 0;
					y_op <= 1;
					done_en <= 0;
					
				end
				
				else if (x_ls_y && !op) begin
				
					x_sel <= 1;
					y_sel <= 1;
					x_en <= 1;
					y_en <= 1;
					x_op <= 0;
					y_op <= 2;
					done_en <= 0;
					
				end
				
				else if (x_ls_y && op) begin
				
					x_sel <= 1;
					y_sel <= 1;
					x_en <= 1;
					y_en <= 1;
					x_op <= 1;
					y_op <= 0;
					done_en <= 0;
					
				end
				
				else begin
				
					x_sel <= 0;
					y_sel <= 0;
					x_en <= 1;
					y_en <= 1;
					x_op <= 0;
					y_op <= 0;
					done_en <= 0;				
				
				end
				
			end
			
			2: begin
				
				x_sel <= 1;
				y_sel <= 1;
				x_en <= 0;
				y_en <= 0;
				x_op <= 0;
				y_op <= 0;
				done_en <= 1;
				
			end
				
		endcase
		
	end
	
endmodule
