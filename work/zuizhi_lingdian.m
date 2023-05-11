% 定义时间变量
time = 0:0.01:10;

% 定义函数
y = 0.3431*sin(0.3795*time+3.333) + 0.08997*sin(0.6835*time+0.9219) + 0.006147*sin(1.9*time+0.3822)+ 0.001425*sin(3.546*time-0.7522);
y1 = 2.226*sin(0.4488*time + 0.7237)+ 1.889*sin(0.4865*time + 4.052) + 0.01013*sin(1.978*time + 3.267) + 0.002805*sin(3.612*time + 2.212);
% 计算最大值和最小值
max_val = max(y);
min_val = min(y);
max_val1 = max(y1);
min_val1 = min(y1);
% 找到最大值和最小值处的时间
idx_max = find(y == max_val);
idx_min = find(y == min_val);
idx_max1 = find(y1 == max_val1);
idx_min1 = find(y1 == min_val1);
% 计算最大值和最小值对应的时间
time_max = time(idx_max);
time_min = time(idx_min);
time_max1 = time(idx_max1);
time_min1 = time(idx_min1);

% 输出结果
fprintf('knee函数的最大值为：%f，对应的时间为：%f\n', max_val, time_max);
fprintf('knee函数的最小值为：%f，对应的时间为：%f\n', min_val, time_min);
fprintf('ankle函数的最大值为：%f，对应的时间为：%f\n', max_val1, time_max1);
fprintf('ankle函数的最小值为：%f，对应的时间为：%f\n', min_val1, time_min1);
% 定义函数句柄
f = @(t) 0.3431*sin(0.3795*t+3.333) + 0.08997*sin(0.6835*t+0.9219) + 0.006147*sin(1.9*t+0.3822)+ 0.001425*sin(3.546*t-0.7522);
f1 = @(t) 2.226*sin(0.4488*t + 0.7237)+ 1.889*sin(0.4865*t + 4.052) + 0.01013*sin(1.978*t + 3.267) + 0.002805*sin(3.612*t + 2.212);
% 计算零点
x0 = 7.775; % 初始猜测值
x = fzero(f, x0);
x1 = 5.000;
x2 = fzero(f1, x1);

% 输出结果
fprintf('knee函数的一个零点为：%f\n', x);
fprintf('ankle函数的一个零点为：%f\n', x2);