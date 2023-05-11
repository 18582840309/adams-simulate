%% 改进DH
clear ; clc; close all;
% 机器人各连杆DH参数
d1 = 0.35;
d2 = 0;
d3 = 0;
d4 = 0;

a1 = 0.25;
a2 = 0;
a3 = 0.35;
a4 = 0.30;

alpha1 = pi/2;
alpha2 = -pi/2;
alpha3 = 0;
alpha4 = 0 ;

% 定义各个连杆，默认为转动关节
%           theta      d        a        alpha 
L(1)=Link([  0         d1      a1      alpha1] ,'modified'); L(1).qlim=[-pi,pi]; L(1).offset=-pi/2;
L(2)=Link([  0         d2      a2      alpha2] ,'modified'); L(2).qlim=[-pi,pi]; L(2).offset= pi/6;
L(3)=Link([  0         d3      a3      alpha3] ,'modified'); L(3).qlim=[-pi,pi]; L(3).offset=-pi/2;

% 把上述连杆整合
OLRob=SerialLink(L,'name','robot');
view(3);
% 定义机器人基坐标和工具坐标的变换
%OLRob.base = transl(0 ,-0.7 ,0);
OLRob.tool = transl(0.3 ,0 ,0);
view(77,22);

OLRob.plot([0 0 0]);
OLRob.teach();   %机器人示教界面

%% 标准DH方法
figure(2)
view(3);
% 定义各个连杆，默认为转动关节
%       theta      d        a        alpha 
f(1)=Link([  0      0       0          pi/2] ); f(1).qlim=[-pi,pi]; f(1).offset=pi/2;
f(2)=Link([  0      0      0.35           0] ); f(2).qlim=[-pi,pi]; f(2).offset=-5*pi/6;
f(3)=Link([  0      0      0.3            0] ); f(3).qlim=[-pi,pi]; f(3).offset= -pi/2;
sta=SerialLink(f,'name','标准');
sta.tool = transl(0 ,0 ,0);
sta.plot([0 0 0]);
sta.teach();   %机器人示教界面
