%%调用spb函数画球面bezier曲线
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
A=[x(A1),y(A1),z(A1);x(A2),y(A2),z(A2);x(A3),y(A3),z(A3);x(A4),y(A4),z(A4)];  
spb(B,A)