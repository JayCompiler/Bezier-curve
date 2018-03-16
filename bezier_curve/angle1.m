%%该函数用于计算两个四元数之间的夹角 

function t=angle1(q,p)
%p,q为两个单位四元数
%t: 返回角度
T1=zeros(1,4);
T2=zeros(1,4);
T1=qua2coord(q);
T2=qua2coord(p);
t=0;
for i=1:4
    t=t+T1(1,i)*T2(1,i);
end
t=acos(t);