%% 改进DH
clear ; 
clc; 
%% 标准DH方法
% 定义各个连杆，默认为转动关节
%       theta      d        a        alpha 
f(1)=Link([  0      0       0          0] ); f(1).qlim=[-pi,pi]; f(1).offset=-pi/2;
f(2)=Link([  0      0      4.65        0] ); f(2).qlim=[-pi,pi]; f(2).offset=0;
f(3)=Link([  0      0      3.69        0] ); f(3).qlim=[-pi,pi]; f(3).offset= 0;
robot=SerialLink(f,'name','标准');
robot.plot([0 0 0]);

