`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:37 06/11/2016 
// Design Name: 
// Module Name:    DFF_1bit_8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register
(
   input rst,
   input clk,
   input load,
   input [7:0] d,
   output[7:0] q
);

	DFF_1bit u0
	(
		.rst(rst),
		.clk(clk),
		.load(load),
		.d(d[0]),
		.q(q[0])
	);

	DFF_1bit u1
	(
		rst,
		clk,
		load,
		d[1],
		q[1]
	);
	
	DFF_1bit u2
	(
		rst,
		clk,
		load,
		d[2],
		q[2]
	);
	
	DFF_1bit u3
	(
		rst,
		clk,
		load,
		d[3],
		q[3]
	);
	
	DFF_1bit u4
	(
		rst,
		clk,
		load,
		d[4],
		q[4]
	);
	
	DFF_1bit u5
	(
		rst,
		clk,
		load,
		d[5],
		q[5]
	);
	
	DFF_1bit u6
	(
		rst,
		clk,
		load,
		d[6],
		q[6]
	);
	
	DFF_1bit u7
	(
		rst,
		clk,
		load,
		d[7],
		q[7]
	);
	
endmodule
