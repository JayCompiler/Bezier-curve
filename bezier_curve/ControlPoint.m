%% ���õ�����������ƽڵ�
function [k,DD]=GontrolPoint(q,d0)
%q����ʼ��Ԫ������
%d0:��ʼ���ƽڵ�
%d0=q;
error=0.01;
max1=100;
[n1 n2]=size(q);
L=zeros(n1-2,4);                                   %���
R=zeros(n1-2,4);                                   %�ҵ�

D=d0;                  %D,���ڱ��������õ���㣬��Ԫ����ʾ
DD=D;
aga=zeros(n1-1,1);     %aga���ڱ������ڿ��ƽڵ�ļн�
agb=zeros(n1-2,1);     %agb���ڱ����������ҵ�֮��ļн�
a=zeros(n1-1,1);     %�Ƕ�
b=zeros(n1-2,1);     %�Ƕ�
%% ������
for k=1:max1                                  %��������
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
    for i=2:n1-1                              %һ�ε�������
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
        disp('��������k�����ƽڵ�');
        k
        DD
        return
    end
    D=DD;
end
if(errorD>error)
    disp('���������Ѿ���������������max1')
end

    
     