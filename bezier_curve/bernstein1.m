%% 该程序是利用贝恩斯坦基函数得出的bezier曲线公式直接获得的bezier结果
clc;
clear;
w=100;
A=[0,2,4,6];
B=[0,5,6,2];
n=size(A);
b=zeros(n(2)-1,2);
plot(A,B,'r');
hold on
K=linspace(0,1,w);
C=zeros(w,2);
m=size(K);
for j=1:m(2)
    t=K(j);
    for i=1:n(2)
        C(j,:)=C(j,:)+[A(1,i),B(1,i)].*nchoosek(n(2)-1,i-1).*(1-t).^(n(2)-i).*t.^(i-1);  %% bezier曲线公式
    end
end
plot(C(:,1),C(:,2),'b')
title('直接运用bernstein多项式作图')
xlabel('x轴')
ylabel('y轴')