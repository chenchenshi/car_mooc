function Ps=bspline(C,V1,V2)
%用法：Ps=bspline(C,V1,V2)
%演示Ｎ个控制点的三次B样条曲线生成
%N个控制点C=[C1 C2 C3 C4 ... CN]
%例如：C=[0 1 2 -2 -1 0
%         0 0.3 2.5 2.5 4.7 5];
%V1小车的起点方向，例如V1=[1;0];
%V2小车的终点方向，例如V2=[1;0];
L=0.254/2;        %L为小车长度的一半
NC=length(C);     %原始控制点长度
%增加控制点，保证过起点和终点,且起点的速度方向V1，终点速度方向为V2 
RC=[C(:,1)-V1*L,C(:,1),C(:,1)+V1*L,C(:,2:NC-1),C(:,NC)-V2*L,C(:,NC),C(:,NC)+V2*L];
N=length(RC);
s=0:0.01:1;
f1s=(1-s).^3/6;
f2s=(3*s.^3-6*s.^2+4)/6;
f3s=(-3*s.^3+3*s.^2+3*s+1)/6;
f4s=s.^3/6;
Ps=[];
figure(1)
plot(RC(1,:),RC(2,:),'r*');%;,Ps(1,:),Ps(2,:),'b');
mycolor='mbc';
hold on
for i=1:N-3
    P=RC(:,i)*f1s+RC(:,i+1)*f2s+RC(:,i+2)*f3s+RC(:,i+3)*f4s;
    Ps=[Ps P];
    plot(P(1,:),P(2,:),mycolor(mod(i,3)+1));
end
%
title('N个控制点及其B样条曲线')
xlabel('x轴(米)')
ylabel('y轴(米)')
axis equal
a=axis;
axis(1.2*a);
grid on
bold
hold off;

