function t=coord2qua(a)
%a:��λ�����꣬��Ӧ��Ԫ���鲿
%t��������Ԫ��
t=quaternion(0,a(1,1),a(1,2),a(1,3));