`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:03 06/09/2016 
// Design Name: 
// Module Name:    DFF 
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
module DFF_1bit
(
	 input  rst,
    input  clk,
    input  load,
    input  d,
    output reg q
);	
	 always @ (negedge clk or posedge rst)
	
	 if (rst)
	
		 q <= 0;
		
	 else if(load)
	
	  	 q <= d;

endmodule
