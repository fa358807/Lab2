`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:32 08/19/2015 
// Design Name: 
// Module Name:    lab2_3 
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
module lab2_3(
	input clk,
	input rst_n,
	input [3:0]A,
	input [3:0]B,
	//input Cin,
	//output [3:0]S,
	//output Cout,	 
	output [3:0] ftsd_ctl,
	output [14:0] display
	
    );
	 
	wire [3:0] bcd;
	wire [1:0] clk_ctl;
	//wire [3:0] ina,inb,inc,ind;
	wire clk_out;
	wire [3:0]S;
	wire Cout;
	
freq_div f1(
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n), // active low reset
	.clk_out(clk_out)
	);

bcd2ftsegdec b1( 
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(A), // 1st input
	.in1(B), // 2nd input
	.in2(Cout), // 3rd input
	.in3(S), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
	
decimal_adder a1(
	.A(A),
	.B(B),
	//.Cin(Cin),
	.S(S),
	.Cout(Cout)	 
);
endmodule
