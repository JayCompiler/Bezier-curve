%% 改程序利用得卡斯特利奥算法构造bezier曲线的动态过程
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
%% 第一层循环，t尽可能取更多的值，使之构成bernstein曲线
for j=1:m(2)-1
    A=[0,2,4,6];
    B=[0,5,6,2];
    t=K(j+1);
    n=size(A);                         %% n=size(A);
    T=zeros(n(2)-1,2);
    %% 第二层循环，当节点只剩下一个时，跳出该循环
    while n(2)~=1
        %% 第三层循环，当遍历所有节点时，结束次次循环
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
title('采用de casteljau算法bezier曲线')
xlabel('x轴')
ylabel('y轴')
