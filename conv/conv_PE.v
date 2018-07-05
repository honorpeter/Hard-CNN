`timescale 1ns / 1ps
// convolution PE unit

module conv_PE#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    // initial signal init为高进入初始化状态，为低进入正常运行状态
    input init;
    // data input
    input [WIDTH-1:0] data_in [31:0];
    // weight input
    input [WIDTH-1:0] weight_in00 [2:0];
    input [WIDTH-1:0] weight_in01 [2:0];
    input [WIDTH-1:0] weight_in02 [2:0];
    input [WIDTH-1:0] weight_in10 [2:0];
    input [WIDTH-1:0] weight_in11 [2:0];
    input [WIDTH-1:0] weight_in12 [2:0];
    input [WIDTH-1:0] weight_in20 [2:0];
    input [WIDTH-1:0] weight_in21 [2:0];
    input [WIDTH-1:0] weight_in22 [2:0];
	// data output
    output [WIDTH-1:0] data_out [2:0];
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
reg [5:0] clk_counter;
// 3*3 output buffer
reg [WIDTH-1] output_buffer0;
reg [WIDTH-1] output_buffer1;
reg [WIDTH-1] output_buffer2;

initial
begin
    init = 1；

    input_buffer0[0] = 0;input_buffer0[1] = 0;input_buffer0[2] = 0;input_buffer0[3] = 0;
    input_buffer0[4] = 0;input_buffer0[5] = 0;input_buffer0[6] = 0;input_buffer0[7] = 0;
    input_buffer0[8] = 0;input_buffer0[9] = 0;input_buffer0[10] = 0;input_buffer0[11] = 0;
    input_buffer0[12] = 0;input_buffer0[13] = 0;input_buffer0[14] = 0;input_buffer0[15] = 0;
    input_buffer0[16] = 0;input_buffer0[17] = 0;input_buffer0[18] = 0;input_buffer0[19] = 0;
    input_buffer0[20] = 0;input_buffer0[21] = 0;input_buffer0[22] = 0;input_buffer0[23] = 0;
    input_buffer0[24] = 0;input_buffer0[25] = 0;input_buffer0[26] = 0;input_buffer0[27] = 0;
    input_buffer0[28] = 0;input_buffer0[29] = 0;input_buffer0[30] = 0;input_buffer0[31] = 0;
    
    input_buffer1[0] = 0;input_buffer1[1] = 0;input_buffer1[2] = 0;input_buffer1[3] = 0;
    input_buffer1[4] = 0;input_buffer1[5] = 0;input_buffer1[6] = 0;input_buffer1[7] = 0;
    input_buffer1[8] = 0;input_buffer1[9] = 0;input_buffer1[10] = 0;input_buffer1[11] = 0;
    input_buffer1[12] = 0;input_buffer1[13] = 0;input_buffer1[14] = 0;input_buffer1[15] = 0;
    input_buffer1[16] = 0;input_buffer1[17] = 0;input_buffer1[18] = 0;input_buffer1[19] = 0;
    input_buffer1[20] = 0;input_buffer1[21] = 0;input_buffer1[22] = 0;input_buffer1[23] = 0;
    input_buffer1[24] = 0;input_buffer1[25] = 0;input_buffer1[26] = 0;input_buffer1[27] = 0;
    input_buffer1[28] = 0;input_buffer1[29] = 0;input_buffer1[30] = 0;input_buffer1[31] = 0;

    input_buffer2[0] = 0;input_buffer2[1] = 0;input_buffer2[2] = 0;input_buffer2[3] = 0;
    input_buffer2[4] = 0;input_buffer2[5] = 0;input_buffer2[6] = 0;input_buffer2[7] = 0;
    input_buffer2[8] = 0;input_buffer2[9] = 0;input_buffer2[10] = 0;input_buffer2[11] = 0;
    input_buffer2[12] = 0;input_buffer2[13] = 0;input_buffer2[14] = 0;input_buffer2[15] = 0;
    input_buffer2[16] = 0;input_buffer2[17] = 0;input_buffer2[18] = 0;input_buffer2[19] = 0;
    input_buffer2[20] = 0;input_buffer2[21] = 0;input_buffer2[22] = 0;input_buffer2[23] = 0;
    input_buffer2[24] = 0;input_buffer2[25] = 0;input_buffer2[26] = 0;input_buffer2[27] = 0;
    input_buffer2[28] = 0;input_buffer2[29] = 0;input_buffer2[30] = 0;input_buffer2[31] = 0;

    mem0[0] = 0;mem0[1] = 0;mem0[2] = 0;
    mem1[0] = 0;mem1[1] = 0;mem1[2] = 0;
    mem2[0] = 0;mem2[1] = 0;mem2[2] = 0;

    output_buffer0 = 0;
    output_buffer1 = 0;
    output_buffer2 = 0;

	data_out[0] = 0;
	data_out[1] = 0;
	data_out[2] = 0;

    clk_counter = 0;
end

always@(posedge clk)
begin
    if(init)
    begin
        case (clk_counter)
            0:begin
				input_buffer0[0] <= data_in[0];
				input_buffer0[1] <= data_in[1];
				input_buffer0[2] <= data_in[2];
				input_buffer0[3] <= data_in[3];
				input_buffer0[4] <= data_in[4];
				input_buffer0[5] <= data_in[5];
				input_buffer0[6] <= data_in[6];
				input_buffer0[7] <= data_in[7];
				input_buffer0[8] <= data_in[8];
				input_buffer0[9] <= data_in[9];
				input_buffer0[10] <= data_in[10];
				input_buffer0[11] <= data_in[11];
				input_buffer0[12] <= data_in[12];
				input_buffer0[13] <= data_in[13];
				input_buffer0[14] <= data_in[14];
				input_buffer0[15] <= data_in[15];
				input_buffer0[16] <= data_in[16];
				input_buffer0[17] <= data_in[17];
				input_buffer0[18] <= data_in[18];
				input_buffer0[19] <= data_in[19];
				input_buffer0[20] <= data_in[20];
				input_buffer0[21] <= data_in[21];
				input_buffer0[22] <= data_in[22];
				input_buffer0[23] <= data_in[23];
				input_buffer0[24] <= data_in[24];
				input_buffer0[25] <= data_in[25];
				input_buffer0[26] <= data_in[26];
				input_buffer0[27] <= data_in[27];
				input_buffer0[28] <= data_in[28];
				input_buffer0[29] <= data_in[29];
				input_buffer0[30] <= data_in[30];
				input_buffer0[31] <= data_in[31];
                clk_counter <= clk_counter + 1;
            end
            1:begin
				input_buffer1[0] <= data_in[0];
				input_buffer1[1] <= data_in[1];
				input_buffer1[2] <= data_in[2];
				input_buffer1[3] <= data_in[3];
				input_buffer1[4] <= data_in[4];
				input_buffer1[5] <= data_in[5];
				input_buffer1[6] <= data_in[6];
				input_buffer1[7] <= data_in[7];
				input_buffer1[8] <= data_in[8];
				input_buffer1[9] <= data_in[9];
				input_buffer1[10] <= data_in[10];
				input_buffer1[11] <= data_in[11];
				input_buffer1[12] <= data_in[12];
				input_buffer1[13] <= data_in[13];
				input_buffer1[14] <= data_in[14];
				input_buffer1[15] <= data_in[15];
				input_buffer1[16] <= data_in[16];
				input_buffer1[17] <= data_in[17];
				input_buffer1[18] <= data_in[18];
				input_buffer1[19] <= data_in[19];
				input_buffer1[20] <= data_in[20];
				input_buffer1[21] <= data_in[21];
				input_buffer1[22] <= data_in[22];
				input_buffer1[23] <= data_in[23];
				input_buffer1[24] <= data_in[24];
				input_buffer1[25] <= data_in[25];
				input_buffer1[26] <= data_in[26];
				input_buffer1[27] <= data_in[27];
				input_buffer1[28] <= data_in[28];
				input_buffer1[29] <= data_in[29];
				input_buffer1[30] <= data_in[30];
				input_buffer1[31] <= data_in[31];
                clk_counter <= clk_counter + 1;
            end
            2: begin
				input_buffer2[0] <= data_in[0];
				input_buffer2[1] <= data_in[1];
				input_buffer2[2] <= data_in[2];
				input_buffer2[3] <= data_in[3];
				input_buffer2[4] <= data_in[4];
				input_buffer2[5] <= data_in[5];
				input_buffer2[6] <= data_in[6];
				input_buffer2[7] <= data_in[7];
				input_buffer2[8] <= data_in[8];
				input_buffer2[9] <= data_in[9];
				input_buffer2[10] <= data_in[10];
				input_buffer2[11] <= data_in[11];
				input_buffer2[12] <= data_in[12];
				input_buffer2[13] <= data_in[13];
				input_buffer2[14] <= data_in[14];
				input_buffer2[15] <= data_in[15];
				input_buffer2[16] <= data_in[16];
				input_buffer2[17] <= data_in[17];
				input_buffer2[18] <= data_in[18];
				input_buffer2[19] <= data_in[19];
				input_buffer2[20] <= data_in[20];
				input_buffer2[21] <= data_in[21];
				input_buffer2[22] <= data_in[22];
				input_buffer2[23] <= data_in[23];
				input_buffer2[24] <= data_in[24];
				input_buffer2[25] <= data_in[25];
				input_buffer2[26] <= data_in[26];
				input_buffer2[27] <= data_in[27];
				input_buffer2[28] <= data_in[28];
				input_buffer2[29] <= data_in[29];
				input_buffer2[30] <= data_in[30];
				input_buffer2[31] <= data_in[31];
                clk_counter <= clk_counter + 1;
            end
            default:
        endcase
    end
    if((!rst_n)&&(!init))
    begin
        case (clk_counter)
            0:begin
				mem0[0] <= input_buffer0[0];mem0[1] <= input_buffer0[1];mem0[2] <= input_buffer0[2];
				mem1[0] <= input_buffer1[0];mem1[1] <= input_buffer1[1];mem1[2] <= input_buffer1[2];
				mem2[0] <= input_buffer2[0];mem2[1] <= input_buffer2[1];mem2[2] <= input_buffer2[2];
				clk_counter <= clk_counter + 1;
			end
			1:begin
				mem0[0] <= input_buffer0[1];mem0[1] <= input_buffer0[2];mem0[2] <= input_buffer0[3];
				mem1[0] <= input_buffer1[1];mem1[1] <= input_buffer1[2];mem1[2] <= input_buffer1[3];
				mem2[0] <= input_buffer2[1];mem2[1] <= input_buffer2[2];mem2[2] <= input_buffer2[3];
				clk_counter <= clk_counter + 1;
			end
			2:begin
				mem0[0] <= input_buffer0[2];mem0[1] <= input_buffer0[3];mem0[2] <= input_buffer0[4];
				mem1[0] <= input_buffer1[2];mem1[1] <= input_buffer1[3];mem1[2] <= input_buffer1[4];
				mem2[0] <= input_buffer2[2];mem2[1] <= input_buffer2[3];mem2[2] <= input_buffer2[4];
				clk_counter <= clk_counter + 1;
			end
			3:begin
				mem0[0] <= input_buffer0[3];mem0[1] <= input_buffer0[4];mem0[2] <= input_buffer0[5];
				mem1[0] <= input_buffer1[3];mem1[1] <= input_buffer1[4];mem1[2] <= input_buffer1[5];
				mem2[0] <= input_buffer2[3];mem2[1] <= input_buffer2[4];mem2[2] <= input_buffer2[5];
				clk_counter <= clk_counter + 1;
			end
			4:begin
				mem0[0] <= input_buffer0[4];mem0[1] <= input_buffer0[5];mem0[2] <= input_buffer0[6];
				mem1[0] <= input_buffer1[4];mem1[1] <= input_buffer1[5];mem1[2] <= input_buffer1[6];
				mem2[0] <= input_buffer2[4];mem2[1] <= input_buffer2[5];mem2[2] <= input_buffer2[6];
				clk_counter <= clk_counter + 1;
			end
			5:begin
				mem0[0] <= input_buffer0[5];mem0[1] <= input_buffer0[6];mem0[2] <= input_buffer0[7];
				mem1[0] <= input_buffer1[5];mem1[1] <= input_buffer1[6];mem1[2] <= input_buffer1[7];
				mem2[0] <= input_buffer2[5];mem2[1] <= input_buffer2[6];mem2[2] <= input_buffer2[7];
				clk_counter <= clk_counter + 1;
			end
			6:begin
				mem0[0] <= input_buffer0[6];mem0[1] <= input_buffer0[7];mem0[2] <= input_buffer0[8];
				mem1[0] <= input_buffer1[6];mem1[1] <= input_buffer1[7];mem1[2] <= input_buffer1[8];
				mem2[0] <= input_buffer2[6];mem2[1] <= input_buffer2[7];mem2[2] <= input_buffer2[8];
				clk_counter <= clk_counter + 1;
			end
			7:begin
				mem0[0] <= input_buffer0[7];mem0[1] <= input_buffer0[8];mem0[2] <= input_buffer0[9];
				mem1[0] <= input_buffer1[7];mem1[1] <= input_buffer1[8];mem1[2] <= input_buffer1[9];
				mem2[0] <= input_buffer2[7];mem2[1] <= input_buffer2[8];mem2[2] <= input_buffer2[9];
				clk_counter <= clk_counter + 1;
			end
			8:begin
				mem0[0] <= input_buffer0[8];mem0[1] <= input_buffer0[9];mem0[2] <= input_buffer0[10];
				mem1[0] <= input_buffer1[8];mem1[1] <= input_buffer1[9];mem1[2] <= input_buffer1[10];
				mem2[0] <= input_buffer2[8];mem2[1] <= input_buffer2[9];mem2[2] <= input_buffer2[10];
				clk_counter <= clk_counter + 1;
			end
			9:begin
				mem0[0] <= input_buffer0[9];mem0[1] <= input_buffer0[10];mem0[2] <= input_buffer0[11];
				mem1[0] <= input_buffer1[9];mem1[1] <= input_buffer1[10];mem1[2] <= input_buffer1[11];
				mem2[0] <= input_buffer2[9];mem2[1] <= input_buffer2[10];mem2[2] <= input_buffer2[11];
				clk_counter <= clk_counter + 1;
			end
			10:begin
				mem0[0] <= input_buffer0[10];mem0[1] <= input_buffer0[11];mem0[2] <= input_buffer0[12];
				mem1[0] <= input_buffer1[10];mem1[1] <= input_buffer1[11];mem1[2] <= input_buffer1[12];
				mem2[0] <= input_buffer2[10];mem2[1] <= input_buffer2[11];mem2[2] <= input_buffer2[12];
				clk_counter <= clk_counter + 1;
			end
			11:begin
				mem0[0] <= input_buffer0[11];mem0[1] <= input_buffer0[12];mem0[2] <= input_buffer0[13];
				mem1[0] <= input_buffer1[11];mem1[1] <= input_buffer1[12];mem1[2] <= input_buffer1[13];
				mem2[0] <= input_buffer2[11];mem2[1] <= input_buffer2[12];mem2[2] <= input_buffer2[13];
				clk_counter <= clk_counter + 1;
			end
			12:begin
				mem0[0] <= input_buffer0[12];mem0[1] <= input_buffer0[13];mem0[2] <= input_buffer0[14];
				mem1[0] <= input_buffer1[12];mem1[1] <= input_buffer1[13];mem1[2] <= input_buffer1[14];
				mem2[0] <= input_buffer2[12];mem2[1] <= input_buffer2[13];mem2[2] <= input_buffer2[14];
				clk_counter <= clk_counter + 1;
			end
			13:begin
				mem0[0] <= input_buffer0[13];mem0[1] <= input_buffer0[14];mem0[2] <= input_buffer0[15];
				mem1[0] <= input_buffer1[13];mem1[1] <= input_buffer1[14];mem1[2] <= input_buffer1[15];
				mem2[0] <= input_buffer2[13];mem2[1] <= input_buffer2[14];mem2[2] <= input_buffer2[15];
				clk_counter <= clk_counter + 1;
			end
			14:begin
				mem0[0] <= input_buffer0[14];mem0[1] <= input_buffer0[15];mem0[2] <= input_buffer0[16];
				mem1[0] <= input_buffer1[14];mem1[1] <= input_buffer1[15];mem1[2] <= input_buffer1[16];
				mem2[0] <= input_buffer2[14];mem2[1] <= input_buffer2[15];mem2[2] <= input_buffer2[16];
				clk_counter <= clk_counter + 1;
			end
			15:begin
				mem0[0] <= input_buffer0[15];mem0[1] <= input_buffer0[16];mem0[2] <= input_buffer0[17];
				mem1[0] <= input_buffer1[15];mem1[1] <= input_buffer1[16];mem1[2] <= input_buffer1[17];
				mem2[0] <= input_buffer2[15];mem2[1] <= input_buffer2[16];mem2[2] <= input_buffer2[17];
				clk_counter <= clk_counter + 1;
			end
			16:begin
				mem0[0] <= input_buffer0[16];mem0[1] <= input_buffer0[17];mem0[2] <= input_buffer0[18];
				mem1[0] <= input_buffer1[16];mem1[1] <= input_buffer1[17];mem1[2] <= input_buffer1[18];
				mem2[0] <= input_buffer2[16];mem2[1] <= input_buffer2[17];mem2[2] <= input_buffer2[18];
				clk_counter <= clk_counter + 1;
			end
			17:begin
				mem0[0] <= input_buffer0[17];mem0[1] <= input_buffer0[18];mem0[2] <= input_buffer0[19];
				mem1[0] <= input_buffer1[17];mem1[1] <= input_buffer1[18];mem1[2] <= input_buffer1[19];
				mem2[0] <= input_buffer2[17];mem2[1] <= input_buffer2[18];mem2[2] <= input_buffer2[19];
				clk_counter <= clk_counter + 1;
			end
			18:begin
				mem0[0] <= input_buffer0[18];mem0[1] <= input_buffer0[19];mem0[2] <= input_buffer0[20];
				mem1[0] <= input_buffer1[18];mem1[1] <= input_buffer1[19];mem1[2] <= input_buffer1[20];
				mem2[0] <= input_buffer2[18];mem2[1] <= input_buffer2[19];mem2[2] <= input_buffer2[20];
				clk_counter <= clk_counter + 1;
			end
			19:begin
				mem0[0] <= input_buffer0[19];mem0[1] <= input_buffer0[20];mem0[2] <= input_buffer0[21];
				mem1[0] <= input_buffer1[19];mem1[1] <= input_buffer1[20];mem1[2] <= input_buffer1[21];
				mem2[0] <= input_buffer2[19];mem2[1] <= input_buffer2[20];mem2[2] <= input_buffer2[21];
				clk_counter <= clk_counter + 1;
			end
			20:begin
				mem0[0] <= input_buffer0[20];mem0[1] <= input_buffer0[21];mem0[2] <= input_buffer0[22];
				mem1[0] <= input_buffer1[20];mem1[1] <= input_buffer1[21];mem1[2] <= input_buffer1[22];
				mem2[0] <= input_buffer2[20];mem2[1] <= input_buffer2[21];mem2[2] <= input_buffer2[22];
				clk_counter <= clk_counter + 1;
			end
			21:begin
				mem0[0] <= input_buffer0[21];mem0[1] <= input_buffer0[22];mem0[2] <= input_buffer0[23];
				mem1[0] <= input_buffer1[21];mem1[1] <= input_buffer1[22];mem1[2] <= input_buffer1[23];
				mem2[0] <= input_buffer2[21];mem2[1] <= input_buffer2[22];mem2[2] <= input_buffer2[23];
				clk_counter <= clk_counter + 1;
			end
			22:begin
				mem0[0] <= input_buffer0[22];mem0[1] <= input_buffer0[23];mem0[2] <= input_buffer0[24];
				mem1[0] <= input_buffer1[22];mem1[1] <= input_buffer1[23];mem1[2] <= input_buffer1[24];
				mem2[0] <= input_buffer2[22];mem2[1] <= input_buffer2[23];mem2[2] <= input_buffer2[24];
				clk_counter <= clk_counter + 1;
			end
			23:begin
				mem0[0] <= input_buffer0[23];mem0[1] <= input_buffer0[24];mem0[2] <= input_buffer0[25];
				mem1[0] <= input_buffer1[23];mem1[1] <= input_buffer1[24];mem1[2] <= input_buffer1[25];
				mem2[0] <= input_buffer2[23];mem2[1] <= input_buffer2[24];mem2[2] <= input_buffer2[25];
				clk_counter <= clk_counter + 1;
			end
			24:begin
				mem0[0] <= input_buffer0[24];mem0[1] <= input_buffer0[25];mem0[2] <= input_buffer0[26];
				mem1[0] <= input_buffer1[24];mem1[1] <= input_buffer1[25];mem1[2] <= input_buffer1[26];
				mem2[0] <= input_buffer2[24];mem2[1] <= input_buffer2[25];mem2[2] <= input_buffer2[26];
				clk_counter <= clk_counter + 1;
			end
			25:begin
				mem0[0] <= input_buffer0[25];mem0[1] <= input_buffer0[26];mem0[2] <= input_buffer0[27];
				mem1[0] <= input_buffer1[25];mem1[1] <= input_buffer1[26];mem1[2] <= input_buffer1[27];
				mem2[0] <= input_buffer2[25];mem2[1] <= input_buffer2[26];mem2[2] <= input_buffer2[27];
				clk_counter <= clk_counter + 1;
			end
			26:begin
				mem0[0] <= input_buffer0[26];mem0[1] <= input_buffer0[27];mem0[2] <= input_buffer0[28];
				mem1[0] <= input_buffer1[26];mem1[1] <= input_buffer1[27];mem1[2] <= input_buffer1[28];
				mem2[0] <= input_buffer2[26];mem2[1] <= input_buffer2[27];mem2[2] <= input_buffer2[28];
				clk_counter <= clk_counter + 1;
			end
			27:begin
				mem0[0] <= input_buffer0[27];mem0[1] <= input_buffer0[28];mem0[2] <= input_buffer0[29];
				mem1[0] <= input_buffer1[27];mem1[1] <= input_buffer1[28];mem1[2] <= input_buffer1[29];
				mem2[0] <= input_buffer2[27];mem2[1] <= input_buffer2[28];mem2[2] <= input_buffer2[29];
				clk_counter <= clk_counter + 1;
			end
			28:begin
				mem0[0] <= input_buffer0[28];mem0[1] <= input_buffer0[29];mem0[2] <= input_buffer0[30];
				mem1[0] <= input_buffer1[28];mem1[1] <= input_buffer1[29];mem1[2] <= input_buffer1[30];
				mem2[0] <= input_buffer2[28];mem2[1] <= input_buffer2[29];mem2[2] <= input_buffer2[30];
				clk_counter <= clk_counter + 1;
			end
			29:begin
				mem0[0] <= input_buffer0[29];mem0[1] <= input_buffer0[30];mem0[2] <= input_buffer0[31];
				mem1[0] <= input_buffer1[29];mem1[1] <= input_buffer1[30];mem1[2] <= input_buffer1[31];
				mem2[0] <= input_buffer2[29];mem2[1] <= input_buffer2[30];mem2[2] <= input_buffer2[31];
				clk_counter <= clk_counter + 1;
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
                clk_counter <= clk_counter + 1;
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
                clk_counter <= clk_counter + 1;
            end
            32:begin
				input_buffer2[0] <= data_in[0];
				input_buffer2[1] <= data_in[1];
				input_buffer2[2] <= data_in[2];
				input_buffer2[3] <= data_in[3];
				input_buffer2[4] <= data_in[4];
				input_buffer2[5] <= data_in[5];
				input_buffer2[6] <= data_in[6];
				input_buffer2[7] <= data_in[7];
				input_buffer2[8] <= data_in[8];
				input_buffer2[9] <= data_in[9];
				input_buffer2[10] <= data_in[10];
				input_buffer2[11] <= data_in[11];
				input_buffer2[12] <= data_in[12];
				input_buffer2[13] <= data_in[13];
				input_buffer2[14] <= data_in[14];
				input_buffer2[15] <= data_in[15];
				input_buffer2[16] <= data_in[16];
				input_buffer2[17] <= data_in[17];
				input_buffer2[18] <= data_in[18];
				input_buffer2[19] <= data_in[19];
				input_buffer2[20] <= data_in[20];
				input_buffer2[21] <= data_in[21];
				input_buffer2[22] <= data_in[22];
				input_buffer2[23] <= data_in[23];
				input_buffer2[24] <= data_in[24];
				input_buffer2[25] <= data_in[25];
				input_buffer2[26] <= data_in[26];
				input_buffer2[27] <= data_in[27];
				input_buffer2[28] <= data_in[28];
				input_buffer2[29] <= data_in[29];
				input_buffer2[30] <= data_in[30];
				input_buffer2[31] <= data_in[31];
                clk_counter <= clk_counter + 1;
            end
            default:
        endcase
    end

end

// 运算部分
conv_unit conv_unit0(clk,rst_n,
                    mem0[0],mem0[1],mem0[2],mem1[0],mem1[1],mem1[2],mem2[0],mem2[1],mem2[2],
                    weight_in00[0],weight_in00[1],weight_in00[2],weight_in01[0],weight_in01[1],weight_in01[2],weight_in02[0],weight_in02[1],weight_in02[2],
                    output_buffer0);
conv_unit conv_unit1(clk,rst_n,
                    mem0[0],mem0[1],mem0[2],mem1[0],mem1[1],mem1[2],mem2[0],mem2[1],mem2[2],
                    weight_in10[0],weight_in10[1],weight_in10[2],weight_in11[0],weight_in11[1],weight_in11[2],weight_in12[0],weight_in12[1],weight_in12[2],
                    output_buffer1);
conv_unit conv_unit2(clk,rst_n,
                    mem0[0],mem0[1],mem0[2],mem1[0],mem1[1],mem1[2],mem2[0],mem2[1],mem2[2],
                    weight_in20[0],weight_in20[1],weight_in20[2],weight_in21[0],weight_in21[1],weight_in21[2],weight_in22[0],weight_in22[1],weight_in22[2],
                    output_buffer2);

// 输出部分
always@(posedge clk)
begin
	data_out[0] <= output_buffer0;
	data_out[1] <= output_buffer1;
	data_out[2] <= output_buffer2;
end

endmodule