%% 采用Bezier曲线画B样条曲线
%% author zy
clc;
clear;
b1=[2,2];b2=[3,5];b3=[5,6];b4=[7,3];b5=[9,7];        %四个型值点的横纵坐标值 可以自定
B1=[b1;b2;b3;b4;b5];
plot([b1(1),b2(1),b3(1),b4(1),b5(1)],[b1(2),b2(2),b3(2),b4(2),b5(2)],'o');   %画出型值点
hold on;
figure(1)
n0=size(B1);
N=n0(1);
T=zeros(N);
T(1,1)=1;
T(N,N)=1;


%% 线性方程系数
for i=2:N-1
    T(i,i-1)=1/6;
    T(i,i)=4/6;
    T(i,i+1)=1/6;
end

d0=T\B1(1:N,1);          %求出控制顶点横坐标
d1=T\B1(1:N,2);          %求出控制顶点纵坐标
plot(d0',d1','r*');       %画出控制节点

%% 取右点和左点，并赋值

L=zeros(n0(1)-1,2);
R=zeros(n0(1)-1,2);
for i=1:n0(1)-1
    R(i,1)=2/3*(d0(i,1))+1/3*(d0(i+1,1));
    R(i,2)=2/3*(d1(i,1))+1/3*(d1(i+1,1));
    L(i,1)=1/3*(d0(i,1))+2/3*(d0(i+1,1));
    L(i,2)=1/3*(d1(i,1))+2/3*(d1(i+1,1));
end
%% 保存每段的控制节点坐标
MM=zeros(n0(1)-1,4);
for i=1:n0(1)-1
        MM(i,1)=B1(i,1);
        MM(i,2)=R(i,1);
        MM(i,3)=L(i,1);
        MM(i,4)=B1(i+1,1);
        MM(i,5)=B1(i,2);
        MM(i,6)=R(i,2);
        MM(i,7)=L(i,2);
        MM(i,8)=B1(i+1,2);
end

%% 用每段的控制节点画出每段的B样条
A=zeros(n0(1)-1,4);
B=zeros(n0(1)-1,4);
for k=1:n0(1)-1
    w=100;
    A(k,1:4)=MM(k,1:4);%横坐标
    B(k,1:4)=MM(k,5:8);%纵坐标
    n=size(A(k,:));
    b=zeros(n(2)-1,2);
    K=linspace(0,1,w);
    C=zeros(w,2);
    m=size(K);
    for j=1:m(2)
        t=K(j);
        for i=1:n(2)
            C(j,:)=C(j,:)+[A(k,i),B(k,i)].*nchoosek(n(2)-1,i-1).*(1-t).^(n(2)-i).*t.^(i-1);
        end
    end
    plot(C(:,1),C(:,2),'b')
    title('三次B样条')
    xlabel('x轴')
    ylabel('y轴')
end
legend('数据点','控制节点');



