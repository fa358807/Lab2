`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:23 07/28/2015 
// Design Name: 
// Module Name:    digit_adder 
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
module digit_adder( 
    input [3:0] IN_A,
    input [3:0] IN_B,
    input CIN,
    output COUT,
    output [3:0] SUM
	 output [14:0]display;
	 output [3:0]ftsegdec_ctrl;
    );
	 
reg [14:0]display;	 
reg [4:0] s2;

assign SUM = s2[3:0];
assign COUT = s2[4];

always @ ( * )
begin
    s2 = IN_A + IN_B + CIN;
    if (s2 > 9)
    begin
        s2 = s2 + 6;
    end
end

always @(IN_A)
begin
	assign ftsegdec_ctrl = 4'b0111;
	case(IN_A)
		4'd0:	display=15'b0000_0011_1111_111;//0
		4'd1:	display=15'b1111_1111_1011_011;//1
		4'd2:	display=15'b0010_0100_1111_111;//2
		4'd3:	display=15'b0000_1100_1111_111;//3
		4'd4:	display=15'b1001_1000_1111_111;//4
		4'd5:	display=15'b0100_1000_1111_111;//5
		4'd6:	display=15'b0100_0000_1111_111;//6
		4'd7:	display=15'b0001_1111_1111_111;//7
		4'd8:	display=15'b0000_0000_1111_111;//8
		4'd9:	display=15'b0000_1000_1111_111;//9
		default:	display=15'b0111_0000_1111_111;//F
	endcase
end

always @(IN_B)
begin
	assign ftsegdec_ctrl = 4'b1011;
	case(IN_B)
		4'd0:	display=15'b0000_0011_1111_111;//0
		4'd1:	display=15'b1111_1111_1011_011;//1
		4'd2:	display=15'b0010_0100_1111_111;//2
		4'd3:	display=15'b0000_1100_1111_111;//3
		4'd4:	display=15'b1001_1000_1111_111;//4
		4'd5:	display=15'b0100_1000_1111_111;//5
		4'd6:	display=15'b0100_0000_1111_111;//6
		4'd7:	display=15'b0001_1111_1111_111;//7
		4'd8:	display=15'b0000_0000_1111_111;//8
		4'd9:	display=15'b0000_1000_1111_111;//9
		default:	display=15'b0111_0000_1111_111;//F
	endcase
end

always @(COUT)
begin
	assign ftsegdec_ctrl = 4'b1101;
	case(COUT)
		4'd0:	display=15'b0000_0011_1111_111;//0
		4'd1:	display=15'b1111_1111_1011_011;//1
		4'd2:	display=15'b0010_0100_1111_111;//2
		4'd3:	display=15'b0000_1100_1111_111;//3
		4'd4:	display=15'b1001_1000_1111_111;//4
		4'd5:	display=15'b0100_1000_1111_111;//5
		4'd6:	display=15'b0100_0000_1111_111;//6
		4'd7:	display=15'b0001_1111_1111_111;//7
		4'd8:	display=15'b0000_0000_1111_111;//8
		4'd9:	display=15'b0000_1000_1111_111;//9
		default:	display=15'b0111_0000_1111_111;//F
	endcase
end

always @(SUM)
begin
	assign ftsegdec_ctrl = 4'b1110;
	case(SUM)
		4'd0:	display=15'b0000_0011_1111_111;//0
		4'd1:	display=15'b1111_1111_1011_011;//1
		4'd2:	display=15'b0010_0100_1111_111;//2
		4'd3:	display=15'b0000_1100_1111_111;//3
		4'd4:	display=15'b1001_1000_1111_111;//4
		4'd5:	display=15'b0100_1000_1111_111;//5
		4'd6:	display=15'b0100_0000_1111_111;//6
		4'd7:	display=15'b0001_1111_1111_111;//7
		4'd8:	display=15'b0000_0000_1111_111;//8
		4'd9:	display=15'b0000_1000_1111_111;//9
		default:	display=15'b0111_0000_1111_111;//F
	endcase
end



endmodule
