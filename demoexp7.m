%(1)鼠标左键，改变最接近的控制点位置
%(2)鼠标右键，退出
%(3)通过不断改变控制点，减小曲线曲率，最后得到新的控制点Ｐ
P=[0   1    1   -1    -1    0
   0   1   2.5  2.5    4   5]
V1=[1;0];
V2=[1;0];
T=0.001;
t=0:T:length(P)+1;
bspline(P,V1,V2);
while 1>0,
    [x,y,button]=ginput(1);
    if button==3,
        %按右键结束程序
        break
    end
    x1=round(x*10)/10;
    y1=round(y*10)/10;
    N=length(P);
    d=100*ones(1,N);
    for i=2:N-1
        d(i)=sqrt((x1-P(1,i))^2+(y1-P(2,i))^2);
    end
    [dmin,iii]=min(d);
    P(1,iii)=x1;
    P(2,iii)=y1;
    bspline(P,V1,V2);
    P
    for i=1:length(t)
    [PP(:,i),V(:,i),A(:,i)]=cal_P2(P,V1,V2,t(i));
    %求曲线曲率
    K(1,i)=(V(1,i)*A(2,i)-V(2,i)*A(1,i))/sqrt(V(1,i)^2+V(2,i)^2)^3;
end
figure(2)
clf
plot(t(1,:),K(1,:))
hold on
Kmax=1/0.44;
plot(t(1,:),Kmax*ones(size(K)),'r--')
plot(t(1,:),-Kmax*ones(size(K)),'r--')
text(7,Kmax,'Kmax');
text(7,-Kmax,'-Kmax');
grid on
title('B样条曲线的曲率')
xlabel('归一化路程0≤s≤N-3')
ylabel('曲线曲率K')
bold
figure(1)
end
    