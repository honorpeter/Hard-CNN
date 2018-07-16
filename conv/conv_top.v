`timescale 1ns / 1ps
// convolution layer top control module
// function: parallel executing convolutional result of one 32*32 picture with 3 different kernels,
//           get three 30*30 pictures

/*
    采用CIFAR-10数据集，大小162MB
    每张图片大小32*32，RGB三色
    数据集包含以下文件data_batch_1.bin, data_batch_2.bin, ..., data_batch_5.bin，以及test_batch.bin；
        这些文件为binary格式：<1 x label><3072 x pixel>
        第一个字节为第一个图片的标签，数值范围0-9；之后的3072个字节为图像的每个像素值，前1024个为R，中1024个为G，后1024个为B
        数据集按行为单位进行编码，如前32字节为图像第一行的32个像素的R值
        数据集与图像对应关系如下图：PATH="../datasheet_structure.png"
        每个文件包含10000行3073字节的数据；行与行之间没有分割
    另有一个文件batches.meta.txt
        是一个ASCII文件，它将0-9范围内的数字标签映射到有意义的类名
        只是10个类名的列表，每行一个类名
        第i行的类名指向数字标签i
    
*/

/*
    输入数据：一张图像32*32*3=3072 Byte，n个权重3*3*n=9n Byte
        单次PE运算所需数据：3行图像数据3*32=96 Byte，3个权重3*3*3=27 Byte
            数据复用：2行图像数据

    输出数据：
        单次PE运算所输出数据：3个卷积和=3 Byte
*/

module conv_top#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    // data
    input [WIDTH-1:0] image_in [31:0],
    input [WIDTH-1:0] weight_in [26:0],

    output [WIDTH-1:0] data_out [2:0];
);

reg PE_init;
reg [WIDTH-1:0] PE_out [2:0];
reg wr_en [2:0];
reg rd_en [2:0];
reg [9:0] rdaddr [2:0];
reg [9:0] wraddr [2:0];

conv_PE PE(clk,rst_n,PE_init,
           image_in[0],image_in[1],image_in[2],image_in[3],image_in[4],image_in[5],image_in[6],image_in[7],
           image_in[8],image_in[9],image_in[10],image_in[11],image_in[12],image_in[13],image_in[14],image_in[15],
           image_in[16],image_in[17],image_in[18],image_in[19],image_in[20],image_in[21],image_in[22],image_in[23],
           image_in[24],image_in[25],image_in[26],image_in[27],image_in[28],image_in[29],image_in[30],image_in[31],
           weight_in[0],weight_in[1],weight_in[2],weight_in[3],weight_in[4],weight_in[5],weight_in[6],
           weight_in[7],weight_in[8],weight_in[9],weight_in[10],weight_in[11],weight_in[12],weight_in[13],
           weight_in[14],weight_in[15],weight_in[16],weight_in[17],weight_in[18],weight_in[19],weight_in[20],
           weight_in[21],weight_in[22],weight_in[23],weight_in[24],weight_in[25],weight_in[26],
           PE_out[0],PE_out[1],PE_out[3]
          );

mem30x30 mem0(clk,rst_n,rd_en[0],wr_en[0],rdaddr[0],wraddr[0],PE_out[0],mem_out0);
mem30x30 mem1(clk,rst_n,rd_en[1],wr_en[1],rdaddr[1],wraddr[1],PE_out[1],mem_out1);
mem30x30 mem2(clk,rst_n,rd_en[2],wr_en[2],rdaddr[2],wraddr[2],PE_out[2],mem_out2);


endmodule