%% �ĳ������õÿ�˹�������㷨����bezier���ߵĶ�̬����
clc;
clear;
w=100;
A=[0,2,4,6];
B=[0,5,6,2];
 %% t=0.5;
plot(A,B,'r');
hold on
K=linspace(0,1,w);
m=size(K);
M=zeros(w,2);
%% ��һ��ѭ����t������ȡ�����ֵ��ʹ֮����bernstein����
for j=1:m(2)-1
    A=[0,2,4,6];
    B=[0,5,6,2];
    t=K(j+1);
    n=size(A);                         %% n=size(A);
    T=zeros(n(2)-1,2);
    %% �ڶ���ѭ�������ڵ�ֻʣ��һ��ʱ��������ѭ��
    while n(2)~=1
        %% ������ѭ�������������нڵ�ʱ�������δ�ѭ��
        for i=1:n(2)-1
            T(i,:)=[A(1,i),B(1,i)]*(1-t)+[A(1,i+1),B(1,i+1)].*t;
            hold on
            drawnow;
            pause(0.001);
        end
        A=zeros(1,n(2)-1);
        B=zeros(1,n(2)-1);
        A=T(1:n(2)-1,1)';
        B=T(1:n(2)-1,2)';
        plot(T(1:n(2)-1,1),T(1:n(2)-1,2),'r');
        k=size(T);
        M(j,:)=T(1,:);
        n(2)=n(2)-1;
        T=zeros(n(2)-1,2);
    end
end
x=M(1:w-1,1);
y=M(1:w-1,2);
plot(x,y,'markersize',20,'markerfacecolor','blue')
title('����de casteljau�㷨bezier����')
xlabel('x��')
ylabel('y��')
