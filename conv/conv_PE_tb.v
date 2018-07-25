`timescale 1ns / 1ps
`include "conv_PE.v"
// testbench for conv_PE.v

module conv_PE_testbench#(parameter WIDTH = 9);
reg clk;
reg rst_n;
reg init;

reg [WIDTH-1:0] data_in00;
reg [WIDTH-1:0] data_in01;
reg [WIDTH-1:0] data_in02;
reg [WIDTH-1:0] data_in03;
reg [WIDTH-1:0] data_in04;
reg [WIDTH-1:0] data_in05;
reg [WIDTH-1:0] data_in06;
reg [WIDTH-1:0] data_in07;
reg [WIDTH-1:0] data_in08;
reg [WIDTH-1:0] data_in09;
reg [WIDTH-1:0] data_in10;
reg [WIDTH-1:0] data_in11;
reg [WIDTH-1:0] data_in12;
reg [WIDTH-1:0] data_in13;
reg [WIDTH-1:0] data_in14;
reg [WIDTH-1:0] data_in15;
reg [WIDTH-1:0] data_in16;
reg [WIDTH-1:0] data_in17;
reg [WIDTH-1:0] data_in18;
reg [WIDTH-1:0] data_in19;
reg [WIDTH-1:0] data_in20;
reg [WIDTH-1:0] data_in21;
reg [WIDTH-1:0] data_in22;
reg [WIDTH-1:0] data_in23;
reg [WIDTH-1:0] data_in24;
reg [WIDTH-1:0] data_in25;
reg [WIDTH-1:0] data_in26;
reg [WIDTH-1:0] data_in27;
reg [WIDTH-1:0] data_in28;
reg [WIDTH-1:0] data_in29;
reg [WIDTH-1:0] data_in30;
reg [WIDTH-1:0] data_in31;

reg [WIDTH-1:0] weight_in00;
reg [WIDTH-1:0] weight_in01;
reg [WIDTH-1:0] weight_in02;
reg [WIDTH-1:0] weight_in03;
reg [WIDTH-1:0] weight_in04;
reg [WIDTH-1:0] weight_in05;
reg [WIDTH-1:0] weight_in06;
reg [WIDTH-1:0] weight_in07;
reg [WIDTH-1:0] weight_in08;
reg [WIDTH-1:0] weight_in09;
reg [WIDTH-1:0] weight_in10;
reg [WIDTH-1:0] weight_in11;
reg [WIDTH-1:0] weight_in12;
reg [WIDTH-1:0] weight_in13;
reg [WIDTH-1:0] weight_in14;
reg [WIDTH-1:0] weight_in15;
reg [WIDTH-1:0] weight_in16;
reg [WIDTH-1:0] weight_in17;
reg [WIDTH-1:0] weight_in18;
reg [WIDTH-1:0] weight_in19;
reg [WIDTH-1:0] weight_in20;
reg [WIDTH-1:0] weight_in21;
reg [WIDTH-1:0] weight_in22;
reg [WIDTH-1:0] weight_in23;
reg [WIDTH-1:0] weight_in24;
reg [WIDTH-1:0] weight_in25;
reg [WIDTH-1:0] weight_in26;

wire [WIDTH-1:0] data_out0;
wire [WIDTH-1:0] data_out1;
wire [WIDTH-1:0] data_out2;

reg [1:0] clk_counter;

initial
begin
    clk = 1'b0;
    rst_n = 1'b1;
    clk_counter = 0;
    init = 1;
    
    data_in00 = 0;	data_in01 = 0;	data_in02 = 0;	data_in03 = 0;	
    data_in04 = 0;	data_in05 = 0;	data_in06 = 0;	data_in07 = 0;	
    data_in08 = 0;	data_in09 = 0;	data_in10 = 0;	data_in11 = 0;	
    data_in12 = 0;	data_in13 = 0;	data_in14 = 0;	data_in15 = 0;	
    data_in16 = 0;	data_in17 = 0;	data_in18 = 0;	data_in19 = 0;	
    data_in20 = 0;	data_in21 = 0;	data_in22 = 0;	data_in23 = 0;	
    data_in24 = 0;	data_in25 = 0;	data_in26 = 0;	data_in27 = 0;	
    data_in28 = 0;	data_in29 = 0;	data_in30 = 0;	data_in31 = 0;	
    

    weight_in00 = 0;	weight_in01 = 1;	weight_in02 = 2;	
    weight_in03 = 1;	weight_in04 = 2;	weight_in05 = 3;	
    weight_in06 = 2;	weight_in07 = 3;	weight_in08 = 4;

    weight_in09 = 1;	weight_in10 = 2;	weight_in11 = 3;	
    weight_in12 = 2;	weight_in13 = 3;	weight_in14 = 4;	
    weight_in15 = 3;	weight_in16 = 4;	weight_in17 = 5;	

    weight_in18 = 2;	weight_in19 = 3;	weight_in20 = 4;	
    weight_in21 = 3;	weight_in22 = 4;	weight_in23 = 5;	
    weight_in24 = 4;	weight_in25 = 5;	weight_in26 = 6;
end

always@(*)
begin
    #1
    clk <= ~clk;
    #1
    clk_counter <= clk_counter + 1;
end

always@(posedge clk)
begin
    if(rst_n)
    begin
        case (clk_counter)
/*
1	0	0	1	1	1	2	2	1	1	0	0	1	1	2	2	1	1	0	0	1	1	2	2	1	1	0	0	1	1	2	2
0	0	1	1	1	2	2	1	1	0	0	1	1	2	2	1	1	0	0	1	1	2	2	1	1	0	0	1	1	2	2	1
0	1	1	0	2	2	1	1	0	0	1	1	2	2	1	1	0	0	1	1	2	2	1	1	0	0	1	1	2	2	1	0
*/
            0: begin
                init = 1;
                data_in00 = 1;	data_in01 = 0;	data_in02 = 0;	data_in03 = 1;	
                data_in04 = 1;	data_in05 = 1;	data_in06 = 2;	data_in07 = 2;	
                data_in08 = 1;	data_in09 = 1;	data_in10 = 0;	data_in11 = 0;	
                data_in12 = 1;	data_in13 = 1;	data_in14 = 2;	data_in15 = 2;	
                data_in16 = 1;	data_in17 = 1;	data_in18 = 0;	data_in19 = 0;	
                data_in20 = 1;	data_in21 = 1;	data_in22 = 2;	data_in23 = 2;	
                data_in24 = 1;	data_in25 = 1;	data_in26 = 0;	data_in27 = 0;	
                data_in28 = 1;	data_in29 = 1;	data_in30 = 2;	data_in31 = 2;	
            end
            1: begin
                init = 1;
                data_in00 = 0;	data_in01 = 0;	data_in02 = 1;	data_in03 = 1;	
                data_in04 = 1;	data_in05 = 2;	data_in06 = 2;	data_in07 = 1;	
                data_in08 = 1;	data_in09 = 0;	data_in10 = 0;	data_in11 = 1;	
                data_in12 = 1;	data_in13 = 2;	data_in14 = 2;	data_in15 = 1;	
                data_in16 = 1;	data_in17 = 0;	data_in18 = 0;	data_in19 = 1;	
                data_in20 = 1;	data_in21 = 2;	data_in22 = 2;	data_in23 = 1;	
                data_in24 = 1;	data_in25 = 0;	data_in26 = 0;	data_in27 = 1;	
                data_in28 = 1;	data_in29 = 2;	data_in30 = 2;	data_in31 = 1;	
            end
            2: begin
                init = 1;
                data_in00 = 0;	data_in01 = 1;	data_in02 = 1;	data_in03 = 0;	
                data_in04 = 2;	data_in05 = 2;	data_in06 = 1;	data_in07 = 1;	
                data_in08 = 0;	data_in09 = 0;	data_in10 = 1;	data_in11 = 1;	
                data_in12 = 2;	data_in13 = 2;	data_in14 = 1;	data_in15 = 1;	
                data_in16 = 0;	data_in17 = 0;	data_in18 = 1;	data_in19 = 1;	
                data_in20 = 2;	data_in21 = 2;	data_in22 = 1;	data_in23 = 1;	
                data_in24 = 0;	data_in25 = 0;	data_in26 = 1;	data_in27 = 1;	
                data_in28 = 2;	data_in29 = 2;	data_in30 = 1;	data_in31 = 0;	
            end
            default: begin
                init = 0;
                data_in00 = 0;	data_in01 = 0;	data_in02 = 0;	data_in03 = 0;	
                data_in04 = 0;	data_in05 = 0;	data_in06 = 0;	data_in07 = 0;	
                data_in08 = 0;	data_in09 = 0;	data_in10 = 0;	data_in11 = 0;	
                data_in12 = 0;	data_in13 = 0;	data_in14 = 0;	data_in15 = 0;	
                data_in16 = 0;	data_in17 = 0;	data_in18 = 0;	data_in19 = 0;	
                data_in20 = 0;	data_in21 = 0;	data_in22 = 0;	data_in23 = 0;	
                data_in24 = 0;	data_in25 = 0;	data_in26 = 0;	data_in27 = 0;	
                data_in28 = 0;	data_in29 = 0;	data_in30 = 0;	data_in31 = 0;
            end
        endcase
    end
end

conv_PE conv_PE_t(
                  .clk(clk),
                  .rst_n(rst_n),
                  .init(init),
                  .data_in00(data_in00),
				  .data_in01(data_in01),
				  .data_in02(data_in02),
				  .data_in03(data_in03),
				  .data_in04(data_in04),
				  .data_in05(data_in05),
				  .data_in06(data_in06),
				  .data_in07(data_in07),
				  .data_in08(data_in08),
				  .data_in09(data_in09),
				  .data_in10(data_in10),
				  .data_in11(data_in11),
				  .data_in12(data_in12),
				  .data_in13(data_in13),
				  .data_in14(data_in14),
				  .data_in15(data_in15),
				  .data_in16(data_in16),
				  .data_in17(data_in17),
				  .data_in18(data_in18),
				  .data_in19(data_in19),
				  .data_in20(data_in20),
				  .data_in21(data_in21),
				  .data_in22(data_in22),
				  .data_in23(data_in23),
				  .data_in24(data_in24),
				  .data_in25(data_in25),
				  .data_in26(data_in26),
				  .data_in27(data_in27),
				  .data_in28(data_in28),
				  .data_in29(data_in29),
				  .data_in30(data_in30),
				  .data_in31(data_in31),
                  .weight_in00(weight_in00),
				  .weight_in01(weight_in01),
				  .weight_in02(weight_in02),
				  .weight_in03(weight_in03),
				  .weight_in04(weight_in04),
				  .weight_in05(weight_in05),
				  .weight_in06(weight_in06),
				  .weight_in07(weight_in07),
				  .weight_in08(weight_in08),
				  .weight_in09(weight_in09),
				  .weight_in10(weight_in10),
				  .weight_in11(weight_in11),
				  .weight_in12(weight_in12),
				  .weight_in13(weight_in13),
				  .weight_in14(weight_in14),
				  .weight_in15(weight_in15),
				  .weight_in16(weight_in16),
				  .weight_in17(weight_in17),
				  .weight_in18(weight_in18),
				  .weight_in19(weight_in19),
				  .weight_in20(weight_in20),
				  .weight_in21(weight_in21),
				  .weight_in22(weight_in22),
				  .weight_in23(weight_in23),
				  .weight_in24(weight_in24),
				  .weight_in25(weight_in25),
				  .weight_in26(weight_in26),
                  .data_out0(data_out0),
                  .data_out1(data_out1),
                  .data_out2(data_out2)
);

endmodule