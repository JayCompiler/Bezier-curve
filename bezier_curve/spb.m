%% 球面线性插值， 画bezier曲线函数
function M=spb(B,A)
%B：初始四元数矩阵
%A，四元数的坐标矩阵
n1=size(B);
sphere(15);                                            %画球
hold on;
alpha(0.1);                                             %设置透明度
%% A可变动
for i=1:n1(1);
    plot3(A(i,1),A(i,2),A(i,3),'b.');          %在球面上画出四元数所表示的点；
end
w=100;                                                          %断点个数
K=linspace(0,1,w);                                              %取断点
M=zeros(w-1,3);                                                   %用M来保存最后的球面曲线点
%% 第一层循环，t尽可能取更多的值，使之构成bernstein曲线
for j=1:w-1
    t=K(j+1);                                                   %取t值
    n=n1(1);                                                 %% n=size(A);表示递归后所剩的节点数
    T=zeros(n-1,3);                                         %%T用于保存每次循环所得到的节点坐标
    zy=B;
    %% 第二层循环，当节点只剩下一个时，跳出该循环
    while n~=1
        %% 第三层循环，当遍历所有节点时，结束这次循环
        for i=1:n-1
            RRR=slerp(zy(i,1),zy(i+1,1),t);
            T(i,1)=x(RRR);
            T(i,2)=y(RRR);
            T(i,3)=z(RRR);
            hold on;
            drawnow;
            pause(0.0001);
            zy(i,1)=quaternion(T(i,1),T(i,2),T(i,3));
        end
         plot3(T(1:n-1,1),T(1:n-1,2),T(1:n-1,3),'g');
        M(j,:)=T(1,:);
        n=n-1;
        T=zeros(n-1,3);
    end
end
t1=M(1:w-1,1);
t2=M(1:w-1,2);
t3=M(1:w-1,3);
grid on;
plot3(t1,t2,t3,'r-') %'markersize',70,'markerfacecolor','red'
view(3);
title('采用de casteljau算法作图');
xlabel('x轴');
ylabel('y轴');
zlabel('z轴');