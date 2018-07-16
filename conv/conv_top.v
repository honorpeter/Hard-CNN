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

module conv_top#(parameter WIDTH = 9)
(
    input clk,
    input rst_n,
    // data
    input [WIDTH-1:0] data_in [31:0],

    output
);

initial
begin
  

end


endmodule