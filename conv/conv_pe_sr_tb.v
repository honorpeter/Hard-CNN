`timescale 1ns / 1ps

module conv_pe_sr_tb#(parameter WIDTH = 9);
reg clk;
reg rst_n;

reg [WIDTH-1:0] data_in;
reg [WIDTH-1:0] weight_in;

wire [2*WIDTH-1:0] data_out;

reg [6:0] clk_counter;

initial
begin
    clk = 1'b0;
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;
    clk_counter = 6'b0;
end

always@(*)
begin
    #1
    clk <= ~clk;
end

always@(posedge clk)
begin
    clk_counter <= (rst_n && (clk_counter < 96)) ? (clk_counter + 1) : 0;
end

/*
2	1	1	2	2	2	3	3	2	2	1	1	2	2	3	3	2	2	1	1	2	2	3	3	2	2	1	1	2	2	3	3
1	1	2	2	2	3	3	2	2	1	1	2	2	3	3	2	2	1	1	2	2	3	3	2	2	1	1	2	2	3	3	2
1	2	2	1	3	3	2	2	1	1	2	2	3	3	2	2	1	1	2	2	3	3	2	2	1	1	2	2	3	3	2	1
*/
always@(posedge clk)
begin
    if(rst_n)
    begin
        case (clk_counter)
            0: data_in <= 2;
            1: data_in <= 1;
			2: data_in <= 1;
			3: data_in <= 2;
			4: data_in <= 2;
			5: data_in <= 2;
			6: data_in <= 3;
			7: data_in <= 3;
			8: data_in <= 2;
			9: data_in <= 2;
			10: data_in <= 1;
			11: data_in <= 1;
			12: data_in <= 2;
			13: data_in <= 2;
			14: data_in <= 3;
			15: data_in <= 3;
			16: data_in <= 2;
			17: data_in <= 2;
			18: data_in <= 1;
			19: data_in <= 1;
			20: data_in <= 2;
			21: data_in <= 2;
			22: data_in <= 3;
			23: data_in <= 3;
			24: data_in <= 2;
			25: data_in <= 2;
			26: data_in <= 1;
			27: data_in <= 1;
			28: data_in <= 2;
			29: data_in <= 2;
			30: data_in <= 3;
			31: data_in <= 3;
			32: data_in <= 1;
			33: data_in <= 1;
			34: data_in <= 2;
			35: data_in <= 2;
			36: data_in <= 2;
			37: data_in <= 3;
			38: data_in <= 3;
			39: data_in <= 2;
			40: data_in <= 2;
			41: data_in <= 1;
			42: data_in <= 1;
			43: data_in <= 2;
			44: data_in <= 2;
			45: data_in <= 3;
			46: data_in <= 3;
			47: data_in <= 2;
			48: data_in <= 2;
			49: data_in <= 1;
			50: data_in <= 1;
			51: data_in <= 2;
			52: data_in <= 2;
			53: data_in <= 3;
			54: data_in <= 3;
			55: data_in <= 2;
			56: data_in <= 2;
			57: data_in <= 1;
			58: data_in <= 1;
			59: data_in <= 2;
			60: data_in <= 2;
			61: data_in <= 3;
			62: data_in <= 3;
			63: data_in <= 2;
			64: data_in <= 1;
			65: data_in <= 2;
			66: data_in <= 2;
			67: data_in <= 1;
			68: data_in <= 3;
			69: data_in <= 3;
			70: data_in <= 2;
			71: data_in <= 2;
			72: data_in <= 1;
			73: data_in <= 1;
			74: data_in <= 2;
			75: data_in <= 2;
			76: data_in <= 3;
			77: data_in <= 3;
			78: data_in <= 2;
			79: data_in <= 2;
			80: data_in <= 1;
			81: data_in <= 1;
			82: data_in <= 2;
			83: data_in <= 2;
			84: data_in <= 3;
			85: data_in <= 3;
			86: data_in <= 2;
			87: data_in <= 2;
			88: data_in <= 1;
			89: data_in <= 1;
			90: data_in <= 2;
			91: data_in <= 2;
			92: data_in <= 3;
			93: data_in <= 3;
			94: data_in <= 2;
			95: data_in <= 2;
			96: data_in <= 1; 
            default: data_in <= 0;
        endcase
    end
end

/*
1	2	3
2	3	4
3	4	5
*/
always@(posedge clk)
begin
    if(rst_n)
    begin
        case (clk_counter)
            0: weight_in <= 1;
            1: weight_in <= 2;
			2: weight_in <= 3;
			3: weight_in <= 2;
			4: weight_in <= 3;
			5: weight_in <= 4;
			6: weight_in <= 3;
			7: weight_in <= 4;
			8: weight_in <= 5;
            default:  weight_in <= 0;
        endcase
    end
end

conv_pe_sr pe0(.clk(clk),
               .rst_n(rst_n),
               .data_in(data_in),
               .weight_in(weight_in),
               .data_out(data_out));

endmodule