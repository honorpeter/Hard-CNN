`timescale 1ns / 1ps

module conv_ctrl#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    input en_init,// 初始化状态使能信号
    input [WIDTH-1:0] image_in_raw [31:0],// 原始输入数据
    input [WIDTH-1:0] weight_in_raw [26:0],// 原始输入数据

    output PE_en,// PE使能信号
    output PE_init_mode,// PE初始化状态控制信号
    output [2:0] mem_wr_en,// 存储器写入使能信号
    output [2:0] mem_rd_en,// 存储器读取使能信号
    output [WIDTH-1:0] image_in_prssd [31:0],//处理过后的数据，prssd:prosessed
    output [WIDTH-1:0] weight_in_prssd [26:0],//处理过后的数据
);

reg [:0] counter;

// rst_n 复位控制信号
always@(clk)
begin
    if(rst_n) begin
        image_in_prssd[0] <= image_in_raw[0];
		image_in_prssd[1] <= image_in_raw[1];
		image_in_prssd[2] <= image_in_raw[2];
		image_in_prssd[3] <= image_in_raw[3];
		image_in_prssd[4] <= image_in_raw[4];
		image_in_prssd[5] <= image_in_raw[5];
		image_in_prssd[6] <= image_in_raw[6];
		image_in_prssd[7] <= image_in_raw[7];
		image_in_prssd[8] <= image_in_raw[8];
		image_in_prssd[9] <= image_in_raw[9];
		image_in_prssd[10] <= image_in_raw[10];
		image_in_prssd[11] <= image_in_raw[11];
		image_in_prssd[12] <= image_in_raw[12];
		image_in_prssd[13] <= image_in_raw[13];
		image_in_prssd[14] <= image_in_raw[14];
		image_in_prssd[15] <= image_in_raw[15];
		image_in_prssd[16] <= image_in_raw[16];
		image_in_prssd[17] <= image_in_raw[17];
		image_in_prssd[18] <= image_in_raw[18];
		image_in_prssd[19] <= image_in_raw[19];
		image_in_prssd[20] <= image_in_raw[20];
		image_in_prssd[21] <= image_in_raw[21];
		image_in_prssd[22] <= image_in_raw[22];
		image_in_prssd[23] <= image_in_raw[23];
		image_in_prssd[24] <= image_in_raw[24];
		image_in_prssd[25] <= image_in_raw[25];
		image_in_prssd[26] <= image_in_raw[26];
		image_in_prssd[27] <= image_in_raw[27];
		image_in_prssd[28] <= image_in_raw[28];
		image_in_prssd[29] <= image_in_raw[29];
		image_in_prssd[30] <= image_in_raw[30];
		image_in_prssd[31] <= image_in_raw[31];
        weight_in_prssd[0] <= weight_in_raw[0];
		weight_in_prssd[1] <= weight_in_raw[1];
		weight_in_prssd[2] <= weight_in_raw[2];
		weight_in_prssd[3] <= weight_in_raw[3];
		weight_in_prssd[4] <= weight_in_raw[4];
		weight_in_prssd[5] <= weight_in_raw[5];
		weight_in_prssd[6] <= weight_in_raw[6];
		weight_in_prssd[7] <= weight_in_raw[7];
		weight_in_prssd[8] <= weight_in_raw[8];
		weight_in_prssd[9] <= weight_in_raw[9];
		weight_in_prssd[10] <= weight_in_raw[10];
		weight_in_prssd[11] <= weight_in_raw[11];
		weight_in_prssd[12] <= weight_in_raw[12];
		weight_in_prssd[13] <= weight_in_raw[13];
		weight_in_prssd[14] <= weight_in_raw[14];
		weight_in_prssd[15] <= weight_in_raw[15];
		weight_in_prssd[16] <= weight_in_raw[16];
		weight_in_prssd[17] <= weight_in_raw[17];
		weight_in_prssd[18] <= weight_in_raw[18];
		weight_in_prssd[19] <= weight_in_raw[19];
		weight_in_prssd[20] <= weight_in_raw[20];
		weight_in_prssd[21] <= weight_in_raw[21];
		weight_in_prssd[22] <= weight_in_raw[22];
		weight_in_prssd[23] <= weight_in_raw[23];
		weight_in_prssd[24] <= weight_in_raw[24];
		weight_in_prssd[25] <= weight_in_raw[25];
		weight_in_prssd[26] <= weight_in_raw[26];
    end
    else begin
		image_in_prssd[0] <= 0;
		image_in_prssd[1] <= 0;
		image_in_prssd[2] <= 0;
		image_in_prssd[3] <= 0;
		image_in_prssd[4] <= 0;
		image_in_prssd[5] <= 0;
		image_in_prssd[6] <= 0;
		image_in_prssd[7] <= 0;
		image_in_prssd[8] <= 0;
		image_in_prssd[9] <= 0;
		image_in_prssd[10] <= 0;
		image_in_prssd[11] <= 0;
		image_in_prssd[12] <= 0;
		image_in_prssd[13] <= 0;
		image_in_prssd[14] <= 0;
		image_in_prssd[15] <= 0;
		image_in_prssd[16] <= 0;
		image_in_prssd[17] <= 0;
		image_in_prssd[18] <= 0;
		image_in_prssd[19] <= 0;
		image_in_prssd[20] <= 0;
		image_in_prssd[21] <= 0;
		image_in_prssd[22] <= 0;
		image_in_prssd[23] <= 0;
		image_in_prssd[24] <= 0;
		image_in_prssd[25] <= 0;
		image_in_prssd[26] <= 0;
		image_in_prssd[27] <= 0;
		image_in_prssd[28] <= 0;
		image_in_prssd[29] <= 0;
		image_in_prssd[30] <= 0;
		image_in_prssd[31] <= 0;
		weight_in_prssd[0] <= 0;
		weight_in_prssd[1] <= 0;
		weight_in_prssd[2] <= 0;
		weight_in_prssd[3] <= 0;
		weight_in_prssd[4] <= 0;
		weight_in_prssd[5] <= 0;
		weight_in_prssd[6] <= 0;
		weight_in_prssd[7] <= 0;
		weight_in_prssd[8] <= 0;
		weight_in_prssd[9] <= 0;
		weight_in_prssd[10] <= 0;
		weight_in_prssd[11] <= 0;
		weight_in_prssd[12] <= 0;
		weight_in_prssd[13] <= 0;
		weight_in_prssd[14] <= 0;
		weight_in_prssd[15] <= 0;
		weight_in_prssd[16] <= 0;
		weight_in_prssd[17] <= 0;
		weight_in_prssd[18] <= 0;
		weight_in_prssd[19] <= 0;
		weight_in_prssd[20] <= 0;
		weight_in_prssd[21] <= 0;
		weight_in_prssd[22] <= 0;
		weight_in_prssd[23] <= 0;
		weight_in_prssd[24] <= 0;
		weight_in_prssd[25] <= 0;
		weight_in_prssd[26] <= 0;
    end
end

always@(posedge clk)
begin
    if(en_init) begin
        PE_en <= 0;
        PE_init_mode <= 1;
        mem_rd_en <= 3'b000;
        mem_wr_en <= 3'b000;
    end
    else begin
        case (counter)
            0:
            default: 
        endcase
    end
end

endmodule
