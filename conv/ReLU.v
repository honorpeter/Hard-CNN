`timescale 1ns / 1ps
// ReLU for conv

module ReLU#(parameter WIDTH = 9)
(
    input signed [2*WIDTH-1:0] in,
    output [2*WIDTH-1:0] out
);

always@(*)
begin
    if (in[2*WIDTH-1] == 1)
        out <= 0;
    else
        out <= in;
end
endmodule