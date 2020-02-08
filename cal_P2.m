function [P,V,A]=cal_P2(C,V1,V2,t)
%[P,V,A]=cal_P(C,V1,V2,t)
L=0.254;
NC=length(C);
RC=[C(:,1)-V1*L,C(:,1),C(:,1)+V1*L,C(:,2:NC-1),C(:,NC)-V2*L,C(:,NC),C(:,NC)+V2*L];
N=length(RC);
if(t>=N-3)
    I=N-4;
    t=1;
else
    I=fix(t);
    t=mod(t,1);
end
f1=(1-t).^3/6;
f2=(3*t.^3-6*t.^2+4)/6;
f3=(-3*t.^3+3*t.^2+3*t+1)/6;
f4=t.^3/6;
d1 =-1/2*(1-t)^2;
d2 =3/2*t^2-2*t;
d3 =-3/2*t^2+t+1/2;
d4 =1/2*t^2;
a1 = 1-t;
a2 = 3*t-2;
a3 = -3*t+1;
a4 = t;

P(1,1)=f1*RC(1,I+1)+f2*RC(1,I+2)+f3*RC(1,I+3)+f4*RC(1,I+4);
P(2,1)=f1*RC(2,I+1)+f2*RC(2,I+2)+f3*RC(2,I+3)+f4*RC(2,I+4);
V(1,1)=d1*RC(1,I+1)+d2*RC(1,I+2)+d3*RC(1,I+3)+d4*RC(1,I+4);
V(2,1)=d1*RC(2,I+1)+d2*RC(2,I+2)+d3*RC(2,I+3)+d4*RC(2,I+4);
A(1,1)=a1*RC(1,I+1)+a2*RC(1,I+2)+a3*RC(1,I+3)+a4*RC(1,I+4);
A(2,1)=a1*RC(2,I+1)+a2*RC(2,I+2)+a3*RC(2,I+3)+a4*RC(2,I+4);
