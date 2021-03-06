%演示四个控制点的B样条曲线生成
%四个控制点C=[C1 C2 C3 C4]
C=[0 1 2 3     %控制点X方向坐标
   0 1 1 0];   %控制点Y方向坐标
%参数s为归一化位移0≤s≤1
s=0:0.01:1;
%
f1s=(1-s).^3/6;
f2s=(3*s.^3-6*s.^2+4)/6;
f3s=(-3*s.^3+3*s.^2+3*s+1)/6;
f4s=s.^3/6;
%
Ps=C(:,1)*f1s+C(:,2)*f2s+C(:,3)*f3s+C(:,4)*f4s;
%绘制控制点及B样条曲线
figure(1)
plot(C(1,:),C(2,:),'r*',Ps(1,:),Ps(2,:),'b');
legend('控制点','B样条曲线')
title('四个控制点及其B样条曲线')
xlabel('x轴(米)')
ylabel('y轴(米)')
grid on
bold
