%% �ó���������ʾ�������Բ�ֵ�õ���������B����
clc;
clear all;
%% �ĸ���λ��Ԫ��
% A1=quaternion(sqrt(3)/3,sqrt(3)/3,sqrt(3)/3);
% A2=quaternion(sqrt(2)/2,sqrt(2)/2,0);
% A3=quaternion(sqrt(2)/2,0,sqrt(2)/2);
% A4=quaternion(0,sqrt(2)/2,sqrt(2)/2);

A1=quaternion(0,-1,0,0);
A2=quaternion(0,-0.7,0.2,0.5);
A3=quaternion(0,-0.6,-0.5,0.5);
A4=quaternion(0,-0.1,-0.8,0.7);
A5=quaternion(0,-0,-0.3,0.05);
%% B�ɱ䶯
B=[A1;A2;A3;A4;A5];                            % ��һ�����󱣴��ʼ��Ԫ��
op=size(B);

for i=1:op(1)
    plot3(x(B(i)),y(B(i)),z(B(i)),'kp','markersize',15)
    hold on
end
% legend('���ݵ�')
[k,DD]=ControlPoint(B,B);                          % ���õ������������
[n1 n2]=size(DD);
for i=1:n1
    text(x(B(i))+0.1,y(B(i))+0.1,z(B(i))+0.1,num2str(i));
end
legend('���ݵ�')
view(3);
L=zerosq(n1-1,1);
R=zerosq(n1-1,1);
for i=1:n1-1
    R(i,1)=slerp(DD(i,1),DD(i+1,1),1/3);
    L(i,1)=slerp(DD(i,1),DD(i+1,1),2/3);
end
for i=1:n1
DD1(i,:)=qua2coord(DD(i,1));                            %������ƽڵ������
end
plot3(DD1(:,2),DD1(:,3),DD1(:,4),'r*')          %�����ƶ����ʶ����

curvepoint=zeros(99*3,3);
for i=1:n1-1
    m1=[vector(B(i,1));vector(R(i,1));vector(L(i,1));vector(B(i+1,1))];       %���ڱ���ÿ�ν��в�ֵ����Ԫ��
    m2=[qua2coord1(B(i,1));qua2coord1(R(i,1));qua2coord1(L(i,1));qua2coord1(B(i+1,1))];%���ڱ���ÿ�ν��в�ֵ����Ԫ������Ӧ������
   curvepoint((99*i-98):99*i,1:3)=spb(m1,m2);
    hold on
end
% legend('���ݵ�')





    
   
    
    
    
    