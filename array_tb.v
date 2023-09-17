`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2023 18:53:16
// Design Name: 
// Module Name: array_tb
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




module array_tb(   );
reg [8:0]A;    
reg [8:0]B;            
wire [15:0] P;
Array_8X8_multiplier m1(.A(A),.B(B),.P(P));
initial
begin
A=8'b00000001;B=8'b00001001;
#50 A=8'b00000101;B=8'b00001010;
#50 A=8'b00000110;B=8'b00000011;
#50 A=8'b00100110;B=8'b00000011;
#50 A=8'b00100100;B=8'b00110111;
#150 $finish;
end     
endmodule