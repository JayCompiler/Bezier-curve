%%�ú������ڼ���������Ԫ��֮��ļн� 

function t=angle1(q,p)
%p,qΪ������λ��Ԫ��
%t: ���ؽǶ�
T1=zeros(1,4);
T2=zeros(1,4);
T1=qua2coord(q);
T2=qua2coord(p);
t=0;
for i=1:4
    t=t+T1(1,i)*T2(1,i);
end
t=acos(t);