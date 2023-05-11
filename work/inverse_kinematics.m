%% 定义常量
L1 = 60; % 大腿长
L2 = 50; % 小腿长
h = 7; % 脚底到脚踝高度
L3 = 14; % 脚掌长
T = 10; % 运动总时间
dt = 0.01; % 时间步长

%% 左腿大腿运动参数
theta1_L0 = 0;
T_L1 = 1;
theta1_Lmax = pi/4;

% 左腿小腿运动参数
theta2_L0 = pi/6;
T_L2 = 2;
theta2_Lmax = pi/6;

% 左腿脚踝运动参数
theta3_L0 = -pi/6;
T_L3 = 2;
theta3_Lmax = pi/12;

%% 右腿大腿运动参数
theta1_R0 = 0;
T_R1 = 1;
theta1_Rmax = pi/4;

% 右腿小腿运动参数
theta2_R0 = pi/6;
T_R2 = 2;
theta2_Rmax = pi/6;

% 右腿脚踝运动参数
theta3_R0 = -pi/6;
T_R3 = 2;
theta3_Rmax = pi/12;

%% 计算左腿各关节的运动轨迹和角度变化
t = 0:dt:T;
theta1_L = theta1_Lmax * sin(2 * pi / T_L1 * t);
theta2_L = theta2_Lmax * sin(2 * pi / T_L2 * t) + theta2_L0;
theta3_L = theta3_Lmax * sin(2 * pi / T_L3 * t) + theta3_L0;
x1_L = L1 * cos(theta1_L);
y1_L = L1 * sin(theta1_L);
x2_L = x1_L + L2 * cos(theta2_L);
y2_L = y1_L + L2 * sin(theta2_L);
x3_L = x2_L + h+L3 * sin(theta3_L);
y3_L = y2_L + h+L3 * cos(theta3_L);

%% 计算右腿各关节的运动轨迹和角度变化
theta1_R = theta1_Rmax * sin(2 * pi / T_R1 * t);
theta2_R = theta2_Rmax * sin(2 * pi / T_R2 * t) + theta2_R0;
theta3_R = theta3_Rmax * sin(2 * pi / T_R3 * t) + theta3_R0;
x1_R = L1 * cos(theta1_R);
y1_R = L1 * sin(theta1_R);
x2_R = x1_R + L2 * cos(theta2_R);
y2_R = y1_R + L2 * sin(theta2_R);
x3_R = x2_R + h+L3*sin(theta3_R);
y3_R = y2_R + h+L3*cos(theta3_R);

%% 计算左腿各关节的运动轨迹和角度变化
theta1_Lmax = pi / 4; % 大腿关节最大角度
T_L1 = T / 2; % 大腿关节运动周期
theta2_Lmax = pi / 4; % 小腿关节最大角度
theta2_L0 = pi / 2; % 小腿关节初始角度
T_L2 = T; % 小腿关节运动周期
theta3_Lmax = pi / 6; % 脚踝关节最大角度
theta3_L0 = 0; % 脚踝关节初始角度
theta1_L = theta1_Lmax * sin(2 * pi / T_L1 * (t + T / 2));
theta2_L = theta2_Lmax * sin(2 * pi / T_L2 * (t + T / 2)) + theta2_L0;
theta3_L = theta3_Lmax * sin(2 * pi / T_L3 * (t + T / 2)) + theta3_L0;
x1_L = -L1 * cos(theta1_L);
y1_L = L1 * sin(theta1_L);
x2_L = x1_L - L2 * cos(theta2_L);
y2_L = y1_L + L2 * sin(theta2_L);
x3_L = x2_L - h-L3*sin(theta3_L);
y3_L = y2_L + h+L3*cos(theta3_L);

%% 计算右腿各关节的运动轨迹和角度变化
theta1_Rmax = pi / 4; % 大腿关节最大角度
T_R1 = T / 2; % 大腿关节运动周期
theta2_Rmax = pi / 4; % 小腿关节最大角度
theta2_R0 = pi / 2; % 小腿关节初始角度
T_R2 = T; % 小腿关节运动周期
theta3_Rmax = pi / 6; % 脚踝关节最大角度
theta3_R0 = 0; % 脚踝关节初始角度
theta1_R = theta1_Rmax * sin(2 * pi / T_R1 * (t ));
theta2_R = theta2_Rmax * sin(2 * pi / T_R2 * (t )) + theta2_R0;
theta3_R = theta3_Rmax * sin(2 * pi / T_R3 * (t )) + theta3_R0;
x1_R = -L1 * cos(theta1_R);
y1_R = L1 * sin(theta1_R);
x2_R = x1_R - L2 * cos(theta2_R);
y2_R = y1_R + L2 * sin(theta2_R);
x3_R = x2_R - h-L3*sin(theta3_R);
y3_R = y2_R + h+L3*cos(theta3_R);

%% 绘制左腿关节轨迹
figure(1)
hold on
plot(x1_L, y1_L, 'r')
plot(x2_L, y2_L, 'g')
plot(x3_L, y3_L, 'b')
title('Left Leg Joint Trajectory')
xlabel('X')
ylabel('Y')
legend('Thigh Joint', 'Calf Joint', 'Ankle Joint')

% 绘制右腿关节轨迹
figure(2)
hold on
plot(x1_R, y1_R, 'r')
plot(x2_R, y2_R, 'g')
plot(x3_R, y3_R, 'b')
title('Right Leg Joint Trajectory')
xlabel('X')
ylabel('Y')
legend('Thigh Joint', 'Calf Joint', 'Ankle Joint')

%% 绘制左腿关节角度变化
figure(3)
hold on
plot(t, theta1_L, 'r')
plot(t, theta2_L, 'g')
plot(t, theta3_L, 'b')
title('Left Leg Joint Angle')
xlabel('Time (s)')
ylabel('Angle (rad)')
legend('Thigh Joint', 'Calf Joint', 'Ankle Joint')

% 绘制右腿关节角度变化
figure(4)
hold on
plot(t, theta1_R, 'r')
plot(t, theta2_R, 'g')
plot(t, theta3_R, 'b')
title('Right Leg Joint Angle')
xlabel('Time (s)')
ylabel('Angle (rad)')
legend('Thigh Joint', 'Calf Joint', 'Ankle Joint')