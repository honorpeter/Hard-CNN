`timescale 1ns / 1ps
// adder for convolution

module adder#(parameter WIDTH = 9)
(
    input signed [2 * WIDTH - 1:0] a,
    input signed [2 * WIDTH - 1:0] b,

    output reg signed[2 * WIDTH - 1:0] sum
);

always@(*)
begin
	if(a[2*WIDTH - 1] ^ b[2*WIDTH - 1] == 0)
		begin
		sum[2*WIDTH - 2:0] <= b[2*WIDTH - 2:0] + a[2*WIDTH - 2:0];
		sum[2*WIDTH - 1] <= a[2*WIDTH - 1];
		end
	if(a[2*WIDTH - 1] ^ b[2*WIDTH - 1] == 1)
		begin
		sum[2*WIDTH - 2:0] <= (b[2*WIDTH - 2:0] > a[2*WIDTH - 2:0])?(b[2*WIDTH - 2:0] - a[2*WIDTH - 2:0]):(a[2*WIDTH - 2:0] - b[2*WIDTH - 2:0]);
		sum[2*WIDTH - 1] <= (b[2*WIDTH - 2:0] > a[2*WIDTH - 2:0])?(b[2*WIDTH - 1]):(a[2*WIDTH - 1]);
		end
end

endmodule