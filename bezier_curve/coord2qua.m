function t=coord2qua(a)
%a:三位置坐标，对应四元数虚部
%t，返回四元数
t=quaternion(0,a(1,1),a(1,2),a(1,3));