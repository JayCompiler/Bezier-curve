%% 利用迭代法反求控制节点
function [k,DD]=GontrolPoint(q,d0)
%q：初始四元数向量
%d0:初始控制节点
%d0=q;
error=0.01;
max1=100;
[n1 n2]=size(q);
L=zeros(n1-2,4);                                   %左点
R=zeros(n1-2,4);                                   %右点

D=d0;                  %D,用于保存最后求得的外点，四元数表示
DD=D;
aga=zeros(n1-1,1);     %aga用于保存相邻控制节点的夹角
agb=zeros(n1-2,1);     %agb用于保存相邻左，右点之间的夹角
a=zeros(n1-1,1);     %角度
b=zeros(n1-2,1);     %角度
%% 迭代法
for k=1:max1                                  %迭代次数
    for i=1:n1-1
        aga(i,1)=angle1(vector(D(i,1)),vector(D(i+1,1)));
    end
    for i=1:n1-2
        L(i,:)=qua2coord(slerp(D(i,1),D(i+1,1),2/3));
        R(i,:)=qua2coord(slerp(D(i+1,1),D(i+2,1),1/3));
        t1=slerp(D(i,1),D(i+1,1),2/3);
        t2=slerp(D(i+1,1),D(i+2,1),1/3);
        agb(i,1)=angle1(vector(t1),vector(t2));
    end
    for i=2:n1-1                              %一次迭代过程
        a(i,1)=aga(i-1,1);
        a(i+1,1)=aga(i,1);
        b(i,1)=agb(i-1,1);
        cop1=sin(0.5*b(i,1))*sin(1/3*a(i,1))/sin(a(i,1));
        cop2=sin(0.5*b(i,1))*sin(1/3*a(i+1,1))/sin(a(i+1,1));
        cop3=sin(0.5*b(i,1))*sin(2/3*a(i,1))/sin(a(i,1));
        cop4=sin(0.5*b(i,1))*sin(2/3*a(i+1,1))/sin(a(i+1,1));
        cop5=sin(b(i,1));
        DD(i,1)=(q(i,1)*cop5-cop1*D(i-1,1)-cop2*D(i+1))/(cop3+cop4);
    end
    errorD=norm(D-DD,2);
    if (errorD<error)
        disp('迭代次数k，控制节点');
        k
        DD
        return
    end
    D=DD;
end
if(errorD>error)
    disp('迭代次数已经超过最大迭代次数max1')
end

    
     