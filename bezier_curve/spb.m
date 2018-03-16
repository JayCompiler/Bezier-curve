%% �������Բ�ֵ�� ��bezier���ߺ���
function M=spb(B,A)
%B����ʼ��Ԫ������
%A����Ԫ�����������
n1=size(B);
sphere(15);                                            %����
hold on;
alpha(0.1);                                             %����͸����
%% A�ɱ䶯
for i=1:n1(1);
    plot3(A(i,1),A(i,2),A(i,3),'b.');          %�������ϻ�����Ԫ������ʾ�ĵ㣻
end
w=100;                                                          %�ϵ����
K=linspace(0,1,w);                                              %ȡ�ϵ�
M=zeros(w-1,3);                                                   %��M�����������������ߵ�
%% ��һ��ѭ����t������ȡ�����ֵ��ʹ֮����bernstein����
for j=1:w-1
    t=K(j+1);                                                   %ȡtֵ
    n=n1(1);                                                 %% n=size(A);��ʾ�ݹ����ʣ�Ľڵ���
    T=zeros(n-1,3);                                         %%T���ڱ���ÿ��ѭ�����õ��Ľڵ�����
    zy=B;
    %% �ڶ���ѭ�������ڵ�ֻʣ��һ��ʱ��������ѭ��
    while n~=1
        %% ������ѭ�������������нڵ�ʱ���������ѭ��
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
title('����de casteljau�㷨��ͼ');
xlabel('x��');
ylabel('y��');
zlabel('z��');