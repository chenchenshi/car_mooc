demoexp1.m 四个控制点B样条曲线生成
demoexp2.m 五四个控制点B样条曲线生成
demoexp3.m N个控制点B样条曲线生成
demoexp4.m 过起点终点B样条曲线生成
demoexp7.m 改变控制点减小曲线曲率，鼠标左键改变控制点，鼠标右键退出得到新控制点P

以下两个程序，可以用于Simulink模块
cal_P.m 由s生成B样条曲线，0<=s<=N-3,Ps=[x(s);y(s);|V(s)|;thelta(s)]
cal_PK.m 由s生成B样条曲线，0<=s<=N-3,Ps=[x(s);y(s);|V(s)|;thelta(s);K(s)],K(s)曲率


bold.m 屏幕图形加粗程序