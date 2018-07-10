`timescale 1ns / 1ps
// convolution layer top control module
// function: parallel executing convolutional result of one 32*32 picture with 3 different kernels,
//           get three 30*30 pictures

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