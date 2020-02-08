function P=cal_P(s)
%P=cal_P(s)
%输入s：B样条曲线参数s
%输出P:[x(s);y(s);|V(s)|;thelta(s)]
C=[0   2    2   -2   -2    0  %原始控制点
   0  0.5  2.5  2.5   4.5  5];
V1=[1;0];   %起点速度方向
V2=[1;0];   %终点速度方向
L=0.254;
NC=length(C);
%增加控制点，保证过起点和终点
RC=[C(:,1)-V1*L,C(:,1),C(:,1)+V1*L,C(:,2:NC-1),C(:,NC)-V2*L,C(:,NC),C(:,NC)+V2*L];
N=length(RC);
OUT=0;
if(s>=N-3)
    I=N-4;
    OUT=1;
    dt=s-(N-3);
    s=1;
else
    I=fix(s);
    s=mod(s,1);
end
f1=(1-s).^3/6;
f2=(3*s.^3-6*s.^2+4)/6;
f3=(-3*s.^3+3*s.^2+3*s+1)/6;
f4=s.^3/6;
d1 =-1/2*(1-s).^2;
d2 =3/2*s.^2-2*s;
d3 =-3/2*s.^2+s+1/2;
d4 =1/2*s.^2;
a1 = 1-s;
a2 = 3*s-2;
a3 = -3*s+1;
a4 = s;
%
P(:,1)=f1*RC(:,I+1)+f2*RC(:,I+2)+f3*RC(:,I+3)+f4*RC(:,I+4);
V(:,1)=d1*RC(:,I+1)+d2*RC(:,I+2)+d3*RC(:,I+3)+d4*RC(:,I+4);
A(:,1)=a1*RC(:,I+1)+a2*RC(:,I+2)+a3*RC(:,I+3)+a4*RC(:,I+4);
K=(V(1,1)*A(2,1)-V(2,1)*A(1,1))/sqrt(V(1,1)^2+V(2,1)^2)^3;
vv=sqrt(V(1,1)^2+V(2,1)^2);
angle=atan2(V(2,1),V(1,1));
if(OUT==1)
    P=P+V*dt;
end
P=[P;vv;angle];