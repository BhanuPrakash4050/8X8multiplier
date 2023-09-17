`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 19:08:16
// Design Name: 
// Module Name: pipelined_array_8X8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pipelined_array_8X8(
    input [7:0]A,
    input [7:0]B,
    input clk,
    input rst,
    output reg [15:0] P
);
    wire [15:0] P_f;
    reg [7:0]A_r,B_r;
    Array_8X8_multiplier AM (.A(A_r),.B(B_r),.P(P_f));
    
    always @(posedge clk,posedge rst)
     begin
     if(rst)
        begin
          A_r <= 8'd0;
          B_r <= 8'd0;
          P <=16'd0;
        end 
      else
        begin
          A_r <= A;
          B_r <= B;
          P<=P_f;
         end
      end      
endmodule
