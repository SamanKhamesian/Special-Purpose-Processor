`timescale 1ns / 1ps

module processor
(
	input  rst,
    input  clk,
    input  start,
	input  op,
    input  [7:0] x,
    input  [7:0] y,
    output [7:0] result,
    output done,
	output [6:0] res,
	output [6:0] x_seg,
	output [6:0] y_seg
);

	wire x_sel;
	wire y_sel;
	wire x_en;
	wire y_en;
	wire [1:0]x_op;
	wire [1:0]y_op;
	wire x_gt_y;
	wire x_eq_y;
	wire x_ls_y;
	
	Datapath DATA_PATH
	(
		.rst(rst),
		.clk(clk),
		.x(x[7:0]),
		.y(y[7:0]),
		.x_sel(x_sel),
		.y_sel(y_sel),
		.x_en(x_en),
		.y_en(y_en),
		.x_op(x_op[1:0]),
		.y_op(y_op[1:0]),
		.done_en(done),
		.x_gt_y(x_gt_y),
		.x_eq_y(x_eq_y),
		.x_ls_y(x_ls_y),
		.result(result[7:0])
	);
	
	Controller CONTROLLER
	(
		.rst(rst),
		.clk(clk),
		.op(op),
		.start(start),
		.x_gt_y(x_gt_y),
		.x_eq_y(x_eq_y),
		.x_ls_y(x_ls_y),
		.x_sel(x_sel),
		.y_sel(y_sel),
		.x_en(x_en),
		.y_en(y_en),
		.x_op(x_op[1:0]),
		.y_op(y_op[1:0]),
		.done_en(done)
	);
	
	assign res = (result==4'd0) ? 7'b1000000 :
					 (result==4'd1) ? 7'b1111001 :
					 (result==4'd2) ? 7'b0100100 :
					 (result==4'd3) ? 7'b0110000 :
					 (result==4'd4) ? 7'b0011001 :
					 (result==4'd5) ? 7'b0010010 :
					 (result==4'd6) ? 7'b0000010 :
					 (result==4'd7) ? 7'b1111000 :
					 (result==4'd8) ? 7'b0000000 :
					 (result==4'd9) ? 7'b0010000 :
					 (result==4'd10)? 7'b0001000 :
					 (result==4'd11)? 7'b0000011 :
					 (result==4'd12)? 7'b1000110 :
					 (result==4'd13)? 7'b0100001 :
					 (result==4'd14)? 7'b0000110 :
					 (result==4'd15)? 7'b0001110 : 7'b0111111 ;

	assign x_seg = (x==4'd0) ? 7'b1000000 :
						(x==4'd1) ? 7'b1111001 :
						(x==4'd2) ? 7'b0100100 :
						(x==4'd3) ? 7'b0110000 :
						(x==4'd4) ? 7'b0011001 :
						(x==4'd5) ? 7'b0010010 :
						(x==4'd6) ? 7'b0000010 :
						(x==4'd7) ? 7'b1111000 :
						(x==4'd8) ? 7'b0000000 :
						(x==4'd9) ? 7'b0010000 :
						(x==4'd10)? 7'b0001000 :
						(x==4'd11)? 7'b0000011 :
						(x==4'd12)? 7'b1000110 :
						(x==4'd13)? 7'b0100001 :
						(x==4'd14)? 7'b0000110 :
						(x==4'd15)? 7'b0001110 : 7'b0111111 ;

	assign y_seg = (y==4'd0) ? 7'b1000000 :
						(y==4'd1) ? 7'b1111001 :
						(y==4'd2) ? 7'b0100100 :
						(y==4'd3) ? 7'b0110000 :
						(y==4'd4) ? 7'b0011001 :
						(y==4'd5) ? 7'b0010010 :
						(y==4'd6) ? 7'b0000010 :
						(y==4'd7) ? 7'b1111000 :
						(y==4'd8) ? 7'b0000000 :
						(y==4'd9) ? 7'b0010000 :
						(y==4'd10)? 7'b0001000 :
						(y==4'd11)? 7'b0000011 :
						(y==4'd12)? 7'b1000110 :
						(y==4'd13)? 7'b0100001 :
						(y==4'd14)? 7'b0000110 :
						(y==4'd15)? 7'b0001110 : 7'b0111111 ;

endmodule
