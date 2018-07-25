`timescale 1ns / 1ps
// convolution PE unit
// function: parallel executing 3 sets of convolutional calculation,
//			 matrix size is 3*3

module conv_PE#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    // initial signal init为高进入初始化状态，为低进入正常运行状态
    input init,
    // data input
	input [WIDTH-1:0] data_in00,
	input [WIDTH-1:0] data_in01,
	input [WIDTH-1:0] data_in02,
	input [WIDTH-1:0] data_in03,
	input [WIDTH-1:0] data_in04,
	input [WIDTH-1:0] data_in05,
	input [WIDTH-1:0] data_in06,
	input [WIDTH-1:0] data_in07,
	input [WIDTH-1:0] data_in08,
	input [WIDTH-1:0] data_in09,
	input [WIDTH-1:0] data_in10,
	input [WIDTH-1:0] data_in11,
	input [WIDTH-1:0] data_in12,
	input [WIDTH-1:0] data_in13,
	input [WIDTH-1:0] data_in14,
	input [WIDTH-1:0] data_in15,
	input [WIDTH-1:0] data_in16,
	input [WIDTH-1:0] data_in17,
	input [WIDTH-1:0] data_in18,
	input [WIDTH-1:0] data_in19,
	input [WIDTH-1:0] data_in20,
	input [WIDTH-1:0] data_in21,
	input [WIDTH-1:0] data_in22,
	input [WIDTH-1:0] data_in23,
	input [WIDTH-1:0] data_in24,
	input [WIDTH-1:0] data_in25,
	input [WIDTH-1:0] data_in26,
	input [WIDTH-1:0] data_in27,
	input [WIDTH-1:0] data_in28,
	input [WIDTH-1:0] data_in29,
	input [WIDTH-1:0] data_in30,
	input [WIDTH-1:0] data_in31,
    // weight input: three 3*3 size weights(conv kernel)
	input [WIDTH-1:0] weight_in00,
	input [WIDTH-1:0] weight_in01,
	input [WIDTH-1:0] weight_in02,
	input [WIDTH-1:0] weight_in03,
	input [WIDTH-1:0] weight_in04,
	input [WIDTH-1:0] weight_in05,
	input [WIDTH-1:0] weight_in06,
	input [WIDTH-1:0] weight_in07,
	input [WIDTH-1:0] weight_in08,
	input [WIDTH-1:0] weight_in09,
	input [WIDTH-1:0] weight_in10,
	input [WIDTH-1:0] weight_in11,
	input [WIDTH-1:0] weight_in12,
	input [WIDTH-1:0] weight_in13,
	input [WIDTH-1:0] weight_in14,
	input [WIDTH-1:0] weight_in15,
	input [WIDTH-1:0] weight_in16,
	input [WIDTH-1:0] weight_in17,
	input [WIDTH-1:0] weight_in18,
	input [WIDTH-1:0] weight_in19,
	input [WIDTH-1:0] weight_in20,
	input [WIDTH-1:0] weight_in21,
	input [WIDTH-1:0] weight_in22,
	input [WIDTH-1:0] weight_in23,
	input [WIDTH-1:0] weight_in24,
	input [WIDTH-1:0] weight_in25,
	input [WIDTH-1:0] weight_in26,
	// data output
    output [WIDTH-1:0] data_out0,
    output [WIDTH-1:0] data_out1,
    output [WIDTH-1:0] data_out2
);
// 3*32 input buffer
reg [WIDTH-1:0] input_buffer0 [31:0];
reg [WIDTH-1:0] input_buffer1 [31:0];
reg [WIDTH-1:0] input_buffer2 [31:0];
// 3*3 mem to get block from input_buffer
reg [WIDTH-1:0] mem0 [2:0];
reg [WIDTH-1:0] mem1 [2:0];
reg [WIDTH-1:0] mem2 [2:0];
// clock count
reg [5:0] counter;

initial
begin
    counter = 0;
end

always@(posedge clk)
begin
    if(init)
    begin
        case (counter)
            0:begin
				input_buffer0[0] <= data_in00;
				input_buffer0[1] <= data_in01;
				input_buffer0[2] <= data_in02;
				input_buffer0[3] <= data_in03;
				input_buffer0[4] <= data_in04;
				input_buffer0[5] <= data_in05;
				input_buffer0[6] <= data_in06;
				input_buffer0[7] <= data_in07;
				input_buffer0[8] <= data_in08;
				input_buffer0[9] <= data_in09;
				input_buffer0[10] <= data_in10;
				input_buffer0[11] <= data_in11;
				input_buffer0[12] <= data_in12;
				input_buffer0[13] <= data_in13;
				input_buffer0[14] <= data_in14;
				input_buffer0[15] <= data_in15;
				input_buffer0[16] <= data_in16;
				input_buffer0[17] <= data_in17;
				input_buffer0[18] <= data_in18;
				input_buffer0[19] <= data_in19;
				input_buffer0[20] <= data_in20;
				input_buffer0[21] <= data_in21;
				input_buffer0[22] <= data_in22;
				input_buffer0[23] <= data_in23;
				input_buffer0[24] <= data_in24;
				input_buffer0[25] <= data_in25;
				input_buffer0[26] <= data_in26;
				input_buffer0[27] <= data_in27;
				input_buffer0[28] <= data_in28;
				input_buffer0[29] <= data_in29;
				input_buffer0[30] <= data_in30;
				input_buffer0[31] <= data_in31;
                counter <= counter + 6'b000001;
            end
            1:begin
				input_buffer1[0] <= data_in00;
				input_buffer1[1] <= data_in01;
				input_buffer1[2] <= data_in02;
				input_buffer1[3] <= data_in03;
				input_buffer1[4] <= data_in04;
				input_buffer1[5] <= data_in05;
				input_buffer1[6] <= data_in06;
				input_buffer1[7] <= data_in07;
				input_buffer1[8] <= data_in08;
				input_buffer1[9] <= data_in09;
				input_buffer1[10] <= data_in10;
				input_buffer1[11] <= data_in11;
				input_buffer1[12] <= data_in12;
				input_buffer1[13] <= data_in13;
				input_buffer1[14] <= data_in14;
				input_buffer1[15] <= data_in15;
				input_buffer1[16] <= data_in16;
				input_buffer1[17] <= data_in17;
				input_buffer1[18] <= data_in18;
				input_buffer1[19] <= data_in19;
				input_buffer1[20] <= data_in20;
				input_buffer1[21] <= data_in21;
				input_buffer1[22] <= data_in22;
				input_buffer1[23] <= data_in23;
				input_buffer1[24] <= data_in24;
				input_buffer1[25] <= data_in25;
				input_buffer1[26] <= data_in26;
				input_buffer1[27] <= data_in27;
				input_buffer1[28] <= data_in28;
				input_buffer1[29] <= data_in29;
				input_buffer1[30] <= data_in30;
				input_buffer1[31] <= data_in31;
                counter <= counter + 6'b000001;
            end
            2: begin
				input_buffer2[0] <= data_in00;
				input_buffer2[1] <= data_in01;
				input_buffer2[2] <= data_in02;
				input_buffer2[3] <= data_in03;
				input_buffer2[4] <= data_in04;
				input_buffer2[5] <= data_in05;
				input_buffer2[6] <= data_in06;
				input_buffer2[7] <= data_in07;
				input_buffer2[8] <= data_in08;
				input_buffer2[9] <= data_in09;
				input_buffer2[10] <= data_in10;
				input_buffer2[11] <= data_in11;
				input_buffer2[12] <= data_in12;
				input_buffer2[13] <= data_in13;
				input_buffer2[14] <= data_in14;
				input_buffer2[15] <= data_in15;
				input_buffer2[16] <= data_in16;
				input_buffer2[17] <= data_in17;
				input_buffer2[18] <= data_in18;
				input_buffer2[19] <= data_in19;
				input_buffer2[20] <= data_in20;
				input_buffer2[21] <= data_in21;
				input_buffer2[22] <= data_in22;
				input_buffer2[23] <= data_in23;
				input_buffer2[24] <= data_in24;
				input_buffer2[25] <= data_in25;
				input_buffer2[26] <= data_in26;
				input_buffer2[27] <= data_in27;
				input_buffer2[28] <= data_in28;
				input_buffer2[29] <= data_in29;
				input_buffer2[30] <= data_in30;
				input_buffer2[31] <= data_in31;
                counter <= counter + 6'b000001;
            end
            default:counter <= 6'b000000;
        endcase
    end
    if((rst_n)&&(!init))
    begin
        case (counter)
            0:begin
				mem0[0] <= input_buffer0[0];mem0[1] <= input_buffer0[1];mem0[2] <= input_buffer0[2];
				mem1[0] <= input_buffer1[0];mem1[1] <= input_buffer1[1];mem1[2] <= input_buffer1[2];
				mem2[0] <= input_buffer2[0];mem2[1] <= input_buffer2[1];mem2[2] <= input_buffer2[2];
				counter <= counter + 6'b000001;
			end
			1:begin
				mem0[0] <= input_buffer0[1];mem0[1] <= input_buffer0[2];mem0[2] <= input_buffer0[3];
				mem1[0] <= input_buffer1[1];mem1[1] <= input_buffer1[2];mem1[2] <= input_buffer1[3];
				mem2[0] <= input_buffer2[1];mem2[1] <= input_buffer2[2];mem2[2] <= input_buffer2[3];
				counter <= counter + 6'b000001;
			end
			2:begin
				mem0[0] <= input_buffer0[2];mem0[1] <= input_buffer0[3];mem0[2] <= input_buffer0[4];
				mem1[0] <= input_buffer1[2];mem1[1] <= input_buffer1[3];mem1[2] <= input_buffer1[4];
				mem2[0] <= input_buffer2[2];mem2[1] <= input_buffer2[3];mem2[2] <= input_buffer2[4];
				counter <= counter + 6'b000001;
			end
			3:begin
				mem0[0] <= input_buffer0[3];mem0[1] <= input_buffer0[4];mem0[2] <= input_buffer0[5];
				mem1[0] <= input_buffer1[3];mem1[1] <= input_buffer1[4];mem1[2] <= input_buffer1[5];
				mem2[0] <= input_buffer2[3];mem2[1] <= input_buffer2[4];mem2[2] <= input_buffer2[5];
				counter <= counter + 6'b000001;
			end
			4:begin
				mem0[0] <= input_buffer0[4];mem0[1] <= input_buffer0[5];mem0[2] <= input_buffer0[6];
				mem1[0] <= input_buffer1[4];mem1[1] <= input_buffer1[5];mem1[2] <= input_buffer1[6];
				mem2[0] <= input_buffer2[4];mem2[1] <= input_buffer2[5];mem2[2] <= input_buffer2[6];
				counter <= counter + 6'b000001;
			end
			5:begin
				mem0[0] <= input_buffer0[5];mem0[1] <= input_buffer0[6];mem0[2] <= input_buffer0[7];
				mem1[0] <= input_buffer1[5];mem1[1] <= input_buffer1[6];mem1[2] <= input_buffer1[7];
				mem2[0] <= input_buffer2[5];mem2[1] <= input_buffer2[6];mem2[2] <= input_buffer2[7];
				counter <= counter + 6'b000001;
			end
			6:begin
				mem0[0] <= input_buffer0[6];mem0[1] <= input_buffer0[7];mem0[2] <= input_buffer0[8];
				mem1[0] <= input_buffer1[6];mem1[1] <= input_buffer1[7];mem1[2] <= input_buffer1[8];
				mem2[0] <= input_buffer2[6];mem2[1] <= input_buffer2[7];mem2[2] <= input_buffer2[8];
				counter <= counter + 6'b000001;
			end
			7:begin
				mem0[0] <= input_buffer0[7];mem0[1] <= input_buffer0[8];mem0[2] <= input_buffer0[9];
				mem1[0] <= input_buffer1[7];mem1[1] <= input_buffer1[8];mem1[2] <= input_buffer1[9];
				mem2[0] <= input_buffer2[7];mem2[1] <= input_buffer2[8];mem2[2] <= input_buffer2[9];
				counter <= counter + 6'b000001;
			end
			8:begin
				mem0[0] <= input_buffer0[8];mem0[1] <= input_buffer0[9];mem0[2] <= input_buffer0[10];
				mem1[0] <= input_buffer1[8];mem1[1] <= input_buffer1[9];mem1[2] <= input_buffer1[10];
				mem2[0] <= input_buffer2[8];mem2[1] <= input_buffer2[9];mem2[2] <= input_buffer2[10];
				counter <= counter + 6'b000001;
			end
			9:begin
				mem0[0] <= input_buffer0[9];mem0[1] <= input_buffer0[10];mem0[2] <= input_buffer0[11];
				mem1[0] <= input_buffer1[9];mem1[1] <= input_buffer1[10];mem1[2] <= input_buffer1[11];
				mem2[0] <= input_buffer2[9];mem2[1] <= input_buffer2[10];mem2[2] <= input_buffer2[11];
				counter <= counter + 6'b000001;
			end
			10:begin
				mem0[0] <= input_buffer0[10];mem0[1] <= input_buffer0[11];mem0[2] <= input_buffer0[12];
				mem1[0] <= input_buffer1[10];mem1[1] <= input_buffer1[11];mem1[2] <= input_buffer1[12];
				mem2[0] <= input_buffer2[10];mem2[1] <= input_buffer2[11];mem2[2] <= input_buffer2[12];
				counter <= counter + 6'b000001;
			end
			11:begin
				mem0[0] <= input_buffer0[11];mem0[1] <= input_buffer0[12];mem0[2] <= input_buffer0[13];
				mem1[0] <= input_buffer1[11];mem1[1] <= input_buffer1[12];mem1[2] <= input_buffer1[13];
				mem2[0] <= input_buffer2[11];mem2[1] <= input_buffer2[12];mem2[2] <= input_buffer2[13];
				counter <= counter + 6'b000001;
			end
			12:begin
				mem0[0] <= input_buffer0[12];mem0[1] <= input_buffer0[13];mem0[2] <= input_buffer0[14];
				mem1[0] <= input_buffer1[12];mem1[1] <= input_buffer1[13];mem1[2] <= input_buffer1[14];
				mem2[0] <= input_buffer2[12];mem2[1] <= input_buffer2[13];mem2[2] <= input_buffer2[14];
				counter <= counter + 6'b000001;
			end
			13:begin
				mem0[0] <= input_buffer0[13];mem0[1] <= input_buffer0[14];mem0[2] <= input_buffer0[15];
				mem1[0] <= input_buffer1[13];mem1[1] <= input_buffer1[14];mem1[2] <= input_buffer1[15];
				mem2[0] <= input_buffer2[13];mem2[1] <= input_buffer2[14];mem2[2] <= input_buffer2[15];
				counter <= counter + 6'b000001;
			end
			14:begin
				mem0[0] <= input_buffer0[14];mem0[1] <= input_buffer0[15];mem0[2] <= input_buffer0[16];
				mem1[0] <= input_buffer1[14];mem1[1] <= input_buffer1[15];mem1[2] <= input_buffer1[16];
				mem2[0] <= input_buffer2[14];mem2[1] <= input_buffer2[15];mem2[2] <= input_buffer2[16];
				counter <= counter + 6'b000001;
			end
			15:begin
				mem0[0] <= input_buffer0[15];mem0[1] <= input_buffer0[16];mem0[2] <= input_buffer0[17];
				mem1[0] <= input_buffer1[15];mem1[1] <= input_buffer1[16];mem1[2] <= input_buffer1[17];
				mem2[0] <= input_buffer2[15];mem2[1] <= input_buffer2[16];mem2[2] <= input_buffer2[17];
				counter <= counter + 6'b000001;
			end
			16:begin
				mem0[0] <= input_buffer0[16];mem0[1] <= input_buffer0[17];mem0[2] <= input_buffer0[18];
				mem1[0] <= input_buffer1[16];mem1[1] <= input_buffer1[17];mem1[2] <= input_buffer1[18];
				mem2[0] <= input_buffer2[16];mem2[1] <= input_buffer2[17];mem2[2] <= input_buffer2[18];
				counter <= counter + 6'b000001;
			end
			17:begin
				mem0[0] <= input_buffer0[17];mem0[1] <= input_buffer0[18];mem0[2] <= input_buffer0[19];
				mem1[0] <= input_buffer1[17];mem1[1] <= input_buffer1[18];mem1[2] <= input_buffer1[19];
				mem2[0] <= input_buffer2[17];mem2[1] <= input_buffer2[18];mem2[2] <= input_buffer2[19];
				counter <= counter + 6'b000001;
			end
			18:begin
				mem0[0] <= input_buffer0[18];mem0[1] <= input_buffer0[19];mem0[2] <= input_buffer0[20];
				mem1[0] <= input_buffer1[18];mem1[1] <= input_buffer1[19];mem1[2] <= input_buffer1[20];
				mem2[0] <= input_buffer2[18];mem2[1] <= input_buffer2[19];mem2[2] <= input_buffer2[20];
				counter <= counter + 6'b000001;
			end
			19:begin
				mem0[0] <= input_buffer0[19];mem0[1] <= input_buffer0[20];mem0[2] <= input_buffer0[21];
				mem1[0] <= input_buffer1[19];mem1[1] <= input_buffer1[20];mem1[2] <= input_buffer1[21];
				mem2[0] <= input_buffer2[19];mem2[1] <= input_buffer2[20];mem2[2] <= input_buffer2[21];
				counter <= counter + 6'b000001;
			end
			20:begin
				mem0[0] <= input_buffer0[20];mem0[1] <= input_buffer0[21];mem0[2] <= input_buffer0[22];
				mem1[0] <= input_buffer1[20];mem1[1] <= input_buffer1[21];mem1[2] <= input_buffer1[22];
				mem2[0] <= input_buffer2[20];mem2[1] <= input_buffer2[21];mem2[2] <= input_buffer2[22];
				counter <= counter + 6'b000001;
			end
			21:begin
				mem0[0] <= input_buffer0[21];mem0[1] <= input_buffer0[22];mem0[2] <= input_buffer0[23];
				mem1[0] <= input_buffer1[21];mem1[1] <= input_buffer1[22];mem1[2] <= input_buffer1[23];
				mem2[0] <= input_buffer2[21];mem2[1] <= input_buffer2[22];mem2[2] <= input_buffer2[23];
				counter <= counter + 6'b000001;
			end
			22:begin
				mem0[0] <= input_buffer0[22];mem0[1] <= input_buffer0[23];mem0[2] <= input_buffer0[24];
				mem1[0] <= input_buffer1[22];mem1[1] <= input_buffer1[23];mem1[2] <= input_buffer1[24];
				mem2[0] <= input_buffer2[22];mem2[1] <= input_buffer2[23];mem2[2] <= input_buffer2[24];
				counter <= counter + 6'b000001;
			end
			23:begin
				mem0[0] <= input_buffer0[23];mem0[1] <= input_buffer0[24];mem0[2] <= input_buffer0[25];
				mem1[0] <= input_buffer1[23];mem1[1] <= input_buffer1[24];mem1[2] <= input_buffer1[25];
				mem2[0] <= input_buffer2[23];mem2[1] <= input_buffer2[24];mem2[2] <= input_buffer2[25];
				counter <= counter + 6'b000001;
			end
			24:begin
				mem0[0] <= input_buffer0[24];mem0[1] <= input_buffer0[25];mem0[2] <= input_buffer0[26];
				mem1[0] <= input_buffer1[24];mem1[1] <= input_buffer1[25];mem1[2] <= input_buffer1[26];
				mem2[0] <= input_buffer2[24];mem2[1] <= input_buffer2[25];mem2[2] <= input_buffer2[26];
				counter <= counter + 6'b000001;
			end
			25:begin
				mem0[0] <= input_buffer0[25];mem0[1] <= input_buffer0[26];mem0[2] <= input_buffer0[27];
				mem1[0] <= input_buffer1[25];mem1[1] <= input_buffer1[26];mem1[2] <= input_buffer1[27];
				mem2[0] <= input_buffer2[25];mem2[1] <= input_buffer2[26];mem2[2] <= input_buffer2[27];
				counter <= counter + 6'b000001;
			end
			26:begin
				mem0[0] <= input_buffer0[26];mem0[1] <= input_buffer0[27];mem0[2] <= input_buffer0[28];
				mem1[0] <= input_buffer1[26];mem1[1] <= input_buffer1[27];mem1[2] <= input_buffer1[28];
				mem2[0] <= input_buffer2[26];mem2[1] <= input_buffer2[27];mem2[2] <= input_buffer2[28];
				counter <= counter + 6'b000001;
			end
			27:begin
				mem0[0] <= input_buffer0[27];mem0[1] <= input_buffer0[28];mem0[2] <= input_buffer0[29];
				mem1[0] <= input_buffer1[27];mem1[1] <= input_buffer1[28];mem1[2] <= input_buffer1[29];
				mem2[0] <= input_buffer2[27];mem2[1] <= input_buffer2[28];mem2[2] <= input_buffer2[29];
				counter <= counter + 6'b000001;
			end
			28:begin
				mem0[0] <= input_buffer0[28];mem0[1] <= input_buffer0[29];mem0[2] <= input_buffer0[30];
				mem1[0] <= input_buffer1[28];mem1[1] <= input_buffer1[29];mem1[2] <= input_buffer1[30];
				mem2[0] <= input_buffer2[28];mem2[1] <= input_buffer2[29];mem2[2] <= input_buffer2[30];
				counter <= counter + 6'b000001;
			end
			29:begin
				mem0[0] <= input_buffer0[29];mem0[1] <= input_buffer0[30];mem0[2] <= input_buffer0[31];
				mem1[0] <= input_buffer1[29];mem1[1] <= input_buffer1[30];mem1[2] <= input_buffer1[31];
				mem2[0] <= input_buffer2[29];mem2[1] <= input_buffer2[30];mem2[2] <= input_buffer2[31];
				counter <= counter + 6'b000001;
			end
            // input_buffer 轮换:1->0,2->1,新输入->2
            30:begin
                input_buffer0[0] <= input_buffer1[0];
				input_buffer0[1] <= input_buffer1[1];
				input_buffer0[2] <= input_buffer1[2];
				input_buffer0[3] <= input_buffer1[3];
				input_buffer0[4] <= input_buffer1[4];
				input_buffer0[5] <= input_buffer1[5];
				input_buffer0[6] <= input_buffer1[6];
				input_buffer0[7] <= input_buffer1[7];
				input_buffer0[8] <= input_buffer1[8];
				input_buffer0[9] <= input_buffer1[9];
				input_buffer0[10] <= input_buffer1[10];
				input_buffer0[11] <= input_buffer1[11];
				input_buffer0[12] <= input_buffer1[12];
				input_buffer0[13] <= input_buffer1[13];
				input_buffer0[14] <= input_buffer1[14];
				input_buffer0[15] <= input_buffer1[15];
				input_buffer0[16] <= input_buffer1[16];
				input_buffer0[17] <= input_buffer1[17];
				input_buffer0[18] <= input_buffer1[18];
				input_buffer0[19] <= input_buffer1[19];
				input_buffer0[20] <= input_buffer1[20];
				input_buffer0[21] <= input_buffer1[21];
				input_buffer0[22] <= input_buffer1[22];
				input_buffer0[23] <= input_buffer1[23];
				input_buffer0[24] <= input_buffer1[24];
				input_buffer0[25] <= input_buffer1[25];
				input_buffer0[26] <= input_buffer1[26];
				input_buffer0[27] <= input_buffer1[27];
				input_buffer0[28] <= input_buffer1[28];
				input_buffer0[29] <= input_buffer1[29];
				input_buffer0[30] <= input_buffer1[30];
				input_buffer0[31] <= input_buffer1[31];
                counter <= counter + 6'b000001;
            end
            31:begin
				input_buffer1[0] <= input_buffer2[0];
				input_buffer1[1] <= input_buffer2[1];
				input_buffer1[2] <= input_buffer2[2];
				input_buffer1[3] <= input_buffer2[3];
				input_buffer1[4] <= input_buffer2[4];
				input_buffer1[5] <= input_buffer2[5];
				input_buffer1[6] <= input_buffer2[6];
				input_buffer1[7] <= input_buffer2[7];
				input_buffer1[8] <= input_buffer2[8];
				input_buffer1[9] <= input_buffer2[9];
				input_buffer1[10] <= input_buffer2[10];
				input_buffer1[11] <= input_buffer2[11];
				input_buffer1[12] <= input_buffer2[12];
				input_buffer1[13] <= input_buffer2[13];
				input_buffer1[14] <= input_buffer2[14];
				input_buffer1[15] <= input_buffer2[15];
				input_buffer1[16] <= input_buffer2[16];
				input_buffer1[17] <= input_buffer2[17];
				input_buffer1[18] <= input_buffer2[18];
				input_buffer1[19] <= input_buffer2[19];
				input_buffer1[20] <= input_buffer2[20];
				input_buffer1[21] <= input_buffer2[21];
				input_buffer1[22] <= input_buffer2[22];
				input_buffer1[23] <= input_buffer2[23];
				input_buffer1[24] <= input_buffer2[24];
				input_buffer1[25] <= input_buffer2[25];
				input_buffer1[26] <= input_buffer2[26];
				input_buffer1[27] <= input_buffer2[27];
				input_buffer1[28] <= input_buffer2[28];
				input_buffer1[29] <= input_buffer2[29];
				input_buffer1[30] <= input_buffer2[30];
				input_buffer1[31] <= input_buffer2[31];
                counter <= counter + 6'b000001;
            end
            32:begin
				input_buffer2[0] <= data_in00;
				input_buffer2[1] <= data_in01;
				input_buffer2[2] <= data_in02;
				input_buffer2[3] <= data_in03;
				input_buffer2[4] <= data_in04;
				input_buffer2[5] <= data_in05;
				input_buffer2[6] <= data_in06;
				input_buffer2[7] <= data_in07;
				input_buffer2[8] <= data_in08;
				input_buffer2[9] <= data_in09;
				input_buffer2[10] <= data_in10;
				input_buffer2[11] <= data_in11;
				input_buffer2[12] <= data_in12;
				input_buffer2[13] <= data_in13;
				input_buffer2[14] <= data_in14;
				input_buffer2[15] <= data_in15;
				input_buffer2[16] <= data_in16;
				input_buffer2[17] <= data_in17;
				input_buffer2[18] <= data_in18;
				input_buffer2[19] <= data_in19;
				input_buffer2[20] <= data_in20;
				input_buffer2[21] <= data_in21;
				input_buffer2[22] <= data_in22;
				input_buffer2[23] <= data_in23;
				input_buffer2[24] <= data_in24;
				input_buffer2[25] <= data_in25;
				input_buffer2[26] <= data_in26;
				input_buffer2[27] <= data_in27;
				input_buffer2[28] <= data_in28;
				input_buffer2[29] <= data_in29;
				input_buffer2[30] <= data_in30;
				input_buffer2[31] <= data_in31;
                counter <= counter + 6'b000001;
            end
            default:counter <= 6'b000000;
        endcase
    end

end

// 运算部分
conv_unit conv_unit0(.clk(clk),
					 .rst_n(rst_n),
					 .a00(mem0[0]),.a01(mem0[1]),.a02(mem0[2]),
					 .a10(mem1[0]),.a11(mem1[1]),.a12(mem1[2]),
					 .a20(mem2[0]),.a21(mem2[1]),.a22(mem2[2]),
					 .b00(weight_in00),.b01(weight_in01),.b02(weight_in02),
					 .b10(weight_in03),.b11(weight_in04),.b12(weight_in05),
					 .b20(weight_in06),.b21(weight_in07),.b22(weight_in08),
					 .out(data_out0));
conv_unit conv_unit1(.clk(clk),
					 .rst_n(rst_n),
					 .a00(mem0[0]),.a01(mem0[1]),.a02(mem0[2]),
					 .a10(mem1[0]),.a11(mem1[1]),.a12(mem1[2]),
					 .a20(mem2[0]),.a21(mem2[1]),.a22(mem2[2]),
					 .b00(weight_in09),.b01(weight_in10),.b02(weight_in11),
					 .b10(weight_in12),.b11(weight_in13),.b12(weight_in14),
					 .b20(weight_in15),.b21(weight_in16),.b22(weight_in17),
					 .out(data_out1));
conv_unit conv_unit2(.clk(clk),
					 .rst_n(rst_n),
					 .a00(mem0[0]),.a01(mem0[1]),.a02(mem0[2]),
					 .a10((mem1[0])),.a11(mem1[1]),.a12(mem1[2]),
					 .a20(mem2[0]),.a21(mem2[1]),.a22(mem2[2]),
					 .b00(weight_in18),.b01(weight_in19),.b02(weight_in20),
					 .b10(weight_in21),.b11(weight_in22),.b12(weight_in23),
					 .b20(weight_in24),.b21(weight_in25),.b22(weight_in26),
					 .out(data_out2));

endmodule