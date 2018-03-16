function crd=qua2coord(q)
%q：四元数
%crd：四维坐标

crd(2)=x(q);
crd(3)=y(q);
crd(4)=z(q);
crd(1)=scalar(q);