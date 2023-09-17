`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2023 15:19:22
// Design Name: 
// Module Name: Array_8X8_multiplier
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


module Array_8X8_multiplier(A,B,P);
input [7:0]A;
input [7:0]B;
output [15:0]P;

 wire[7:0] C1;
 wire[7:0] C2;
 wire[7:0] C3;
 wire[7:0] C4;
 wire[7:0] C5;
 wire[7:0] C6;
 wire[7:0] C7;
 wire[7:0] S1,S2,S3,S4,S5,S6,S7;
 wire[7:0] AB0,AB1,AB2,AB3,AB4,AB5,AB6,AB7;

 
 genvar i;
 generate
 for(i=0;i<=7;i=i+1)
 begin
 assign AB0[i]=A[i]&B[0];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB1[i]=A[i]&B[1];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB2[i]=A[i]&B[2];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB3[i]=A[i]&B[3];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB4[i]=A[i]&B[4];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB5[i]=A[i]&B[5];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB6[i]=A[i]&B[6];
 end
 for(i=0;i<=7;i=i+1)
 begin
 assign AB7[i]=A[i]&B[7];
 end
 endgenerate
 
 //first row
 half_adder H1 (AB0[1], AB1[0], S1[0], C1[0]);
 genvar j;
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (AB0[j+2], AB1[j+1], C1[j], S1[j+1], C1[j+1]);
 end
 endgenerate
 half_adder H2 (AB1[7], C1[6],  S1[7], C1[7]);
 
 //second row
 half_adder H3 (S1[1], AB2[0], S2[0], C2[0]);
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (S1[j+2], AB2[j+1], C2[j], S2[j+1], C2[j+1]);
 end
 endgenerate
 full_adder F1 (C1[7], AB2[7], C2[6], S2[7], C2[7]);
 
 
 //third row
 half_adder H4 (S2[1], AB3[0], S3[0], C3[0]);
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (S2[j+2], AB3[j+1], C3[j], S3[j+1], C3[j+1]);
 end
 endgenerate
 full_adder F2 (C2[7], AB3[7], C3[6], S3[7], C3[7]);
 
 //fourth row
 half_adder H5 (S3[1], AB4[0], S4[0], C4[0]);
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (S3[j+2], AB4[j+1], C4[j], S4[j+1], C4[j+1]);
 end
 endgenerate
 full_adder F3 (C3[7], AB4[7], C4[6], S4[7], C4[7]);
 
 //fifth row
 half_adder H6 (S4[1], AB5[0], S5[0], C5[0]);
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (S4[j+2], AB5[j+1], C5[j], S5[j+1], C5[j+1]);
 end
 endgenerate
 full_adder F4 (C4[7], AB5[7], C5[6], S5[7], C5[7]);
 
 //sisth row
  half_adder H7 (S5[1], AB6[0], S6[0], C6[0]);
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (S5[j+2], AB6[j+1], C6[j], S6[j+1], C6[j+1]);
 end
 endgenerate
 full_adder F5 (C5[7], AB6[7], C6[6], S6[7], C6[7]);
 
 //seventh row
 half_adder H8 (S6[1], AB7[0], S7[0], C7[0]);
 generate
 for (j=0;j<=5;j=j+1)
 begin
 full_adder F (S6[j+2], AB7[j+1], C7[j], S7[j+1], C7[j+1]);
 end
 endgenerate
 full_adder F6 (C6[7], AB7[7], C7[6], S7[7], C7[7]);
 
 assign P[0]= AB0[0];
 assign P[1]= S1[0];
 assign P[2]= S2[0];
 assign P[3]= S3[0];
 assign P[4]= S4[0];
 assign P[5]= S5[0];
 assign P[6]= S6[0];
 generate
 for (j=0;j<=7;j=j+1)
 begin
 assign P[j+7]= S7[j];
 end
 endgenerate
 assign P[15]= C7[7];
 
endmodule


