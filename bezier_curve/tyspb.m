%%����spb����������bezier����
clc;
clear all;
%% �ĸ���λ��Ԫ��
A1=quaternion(sqrt(3)/3,sqrt(3)/3,sqrt(3)/3);
A2=quaternion(sqrt(2)/2,sqrt(2)/2,0);
A3=quaternion(sqrt(2)/2,0,sqrt(2)/2);
A4=quaternion(0,sqrt(2)/2,sqrt(2)/2);
%% B�ɱ䶯
B=[A1;A2;A3;A4];                                 % ��һ�����󱣴��ʼ��Ԫ��     
%% A�ɱ䶯
A=[x(A1),y(A1),z(A1);x(A2),y(A2),z(A2);x(A3),y(A3),z(A3);x(A4),y(A4),z(A4)];  
spb(B,A)