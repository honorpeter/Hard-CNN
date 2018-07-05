`timescale 1ns / 1ps
// convolution PE unit

module conv_PE#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    // data
    input

    output
);
// 3*32 input buffer
reg [WIDTH-1:0] input_buffer0 [31:0];
reg [WIDTH-1:0] input_buffer1 [31:0];
reg [WIDTH-1:0] input_buffer2 [31:0];
// 3*3 mem *3
reg [WIDTH-1:0] mem0 [2:0];
reg [WIDTH-1:0] mem1 [2:0];
reg [WIDTH-1:0] mem2 [2:0];


initial
begin
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
end












endmodule