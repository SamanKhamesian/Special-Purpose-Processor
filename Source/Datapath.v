`timescale 1ns / 1ps

module Datapath
(
   input rst,
   input clk,
   input [7:0] x,
   input [7:0] y,
   input x_sel,
   input y_sel,
   input x_en,
   input y_en,
   input [1:0] x_op,
   input [1:0] y_op,
   input done_en,
   output x_gt_y,
   output x_eq_y,
   output x_ls_y,
   output [7:0] result
);

	wire [7:0]x_reg;
	wire [7:0]y_reg;
	wire [7:0]x_cal;
	wire [7:0]y_cal;
	wire [7:0]x_mux;
	wire [7:0]y_mux;
	wire [7:0]r_cam;
	
	Multiplexer X_MUX
	(
		.input_1(x[7:0]),
		.input_2(x_cal[7:0]),
		.sel(x_sel),
		.output_1(x_mux[7:0])
	);
	
	Multiplexer Y_MUX
	(
		.input_1(y[7:0]),
		.input_2(y_cal[7:0]),
		.sel(y_sel),
		.output_1(y_mux[7:0])
	);
	
	Register X_REG
	(
		.rst(rst),
		.clk(clk),
		.load(x_en),
		.d(x_mux[7:0]),
		.q(x_reg[7:0])
	);
 
	Register Y_REG
	(
		.rst(rst),
		.clk(clk),
		.load(y_en),
		.d(y_mux[7:0]),
		.q(y_reg[7:0])
	);
	
	Comparator CAM
	(
		.input_1(x_reg[7:0]),
		.input_2(y_reg[7:0]),
		.result(r_cam[7:0]),
		.output_1(x_gt_y),
		.output_2(x_eq_y),
		.output_3(x_ls_y)
	);
	
	ALU X_CAL
	(
		.input_1(x_reg[7:0]),
		.input_2(y_reg[7:0]),
		.input_3(x[7:0]),
		.op(x_op[1:0]),
		.output_1(x_cal[7:0])
	);
	
	ALU Y_CAL
	(
		.input_1(y_reg[7:0]),
		.input_2(x_reg[7:0]),
		.input_3(y[7:0]),
		.op(y_op[1:0]),
		.output_1(y_cal[7:0])
	);
	
	Register R_REG
	(
		.rst(rst),
		.clk(clk),
		.load(done_en),
		.d(r_cam[7:0]),
		.q(result[7:0])
	);
	
endmodule
