function Ps=bspline(C,V1,V2)
%�÷���Ps=bspline(C,V1,V2)
%��ʾ�θ����Ƶ������B������������
%N�����Ƶ�C=[C1 C2 C3 C4 ... CN]
%���磺C=[0 1 2 -2 -1 0
%         0 0.3 2.5 2.5 4.7 5];
%V1С������㷽������V1=[1;0];
%V2С�����յ㷽������V2=[1;0];
L=0.254/2;        %LΪС�����ȵ�һ��
NC=length(C);     %ԭʼ���Ƶ㳤��
%���ӿ��Ƶ㣬��֤�������յ�,�������ٶȷ���V1���յ��ٶȷ���ΪV2 
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
title('N�����Ƶ㼰��B��������')
xlabel('x��(��)')
ylabel('y��(��)')
axis equal
a=axis;
axis(1.2*a);
grid on
bold
hold off;

