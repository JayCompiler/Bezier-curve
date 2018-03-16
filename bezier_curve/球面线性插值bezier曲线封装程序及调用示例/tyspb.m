clc;
clear all;
%% 四个单位四元数
A1=quaternion(sqrt(3)/3,sqrt(3)/3,sqrt(3)/3);
A2=quaternion(sqrt(2)/2,sqrt(2)/2,0);
A3=quaternion(sqrt(2)/2,0,sqrt(2)/2);
A4=quaternion(0,sqrt(2)/2,sqrt(2)/2);
%% B可变动
B=[A1;A2;A3;A4];                                 % 用一个矩阵保存初始四元数     
%% A可变动
% v0=quaternion(0,-1,0,0);
% A0=v0/abs(v0);
% v1=quaternion(0,-0.7,0.2,0.5);
% A1=v1/abs(v1);
% v2=quaternion(0,-0.6,-0.5,0.5);
% A2=v2/abs(v2);
% v3=quaternion(0,-0.1,-0.8,0.7);
% A3=v3/abs(v3);
% v4=quaternion(0,-0,-0.3,0.05);
% A4=v4/abs(v4);
% B=[A0;A1;A2;A3;A4];%B样条四元数曲线的控制顶点
% A=[x(A0),y(A0),z(A0);x(A1),y(A1),z(A1);x(A2),y(A2),z(A2);x(A3),y(A3),z(A3);x(A4),y(A4),z(A4)];  
A=[x(A1),y(A1),z(A1);x(A2),y(A2),z(A2);x(A3),y(A3),z(A3);x(A4),y(A4),z(A4)];  
spb(B,A)