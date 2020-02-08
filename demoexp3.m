%演示Ｎ个控制点的B样条曲线生成  
%N个控制点C=[C1 C2 C3 C4 ... CN]
C=[0   1    2    -2   -1   0
   0  0.3  2.5   2.5  4.7  5];
N=length(C);                              %控制点数目
s=0:0.01:1;            
f1s=(1-s).^3/6;                           %四个样条函数1
f2s=(3*s.^3-6*s.^2+4)/6;                  %四个样条函数2
f3s=(-3*s.^3+3*s.^2+3*s+1)/6;             %四个样条函数3
f4s=s.^3/6;                               %四个样条函数4
Ps=[];
figure(1);plot(C(1,:),C(2,:),'r*');hold on; mycolor='mbc' ;
for i=1:N-3
    P=C(:,i)*f1s+C(:,i+1)*f2s+C(:,i+2)*f3s+C(:,i+3)*f4s;
    Ps=[Ps P];                            %拼接N-3段样条曲线
    plot(P(1,:),P(2,:),mycolor(mod(i,3)+1));
end
title('N个控制点及其B样条曲线')
xlabel('x轴(米)')
ylabel('y轴(米)')
grid on;hold off
bold