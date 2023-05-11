% 定义常量
thigh_length = 0.465; % 大腿长度
shank_length = 0.369; % 小腿长度
step_length = 0.3; % 步长

% 定义初始状态
thigh_angle = deg2rad(110); % 大腿初始角度（向前）
shank_angle = deg2rad(135); % 小腿初始角度（向后）
thigh_angular_velocity = 0; % 大腿角速度
shank_angular_velocity = 0; % 小腿角速度

% 定义时间和时间步长
t = 0:0.01:2; % 从0到2秒，每0.01秒采样一次

% 解算运动方程
for i = 1:length(t)
    % 计算大腿和小腿的加速度
    thigh_angular_acceleration = -9.81/thigh_length * sin(thigh_angle);
    shank_angular_acceleration = -9.81/shank_length * sin(shank_angle);
    
    % 计算大腿和小腿的角速度
    thigh_angular_velocity = thigh_angular_velocity + thigh_angular_acceleration * 0.01;
    shank_angular_velocity = shank_angular_velocity + shank_angular_acceleration * 0.01;
    
    % 计算大腿和小腿的角度
    thigh_angle = thigh_angle + thigh_angular_velocity * 0.01;
    shank_angle = shank_angle + shank_angular_velocity * 0.01;
    
    % 限制大腿和小腿的角度在最大值范围内
    thigh_angle = max(thigh_angle, -deg2rad(20)); % 最大后摆20度
    thigh_angle = min(thigh_angle, deg2rad(110)); % 最大前摆110度
    shank_angle = max(shank_angle, 0); % 最大后摆135度
    
    % 计算大腿和小腿的坐标
    thigh_x = thigh_length * sin(thigh_angle);
    thigh_y = -thigh_length * cos(thigh_angle);
    shank_x = thigh_x + shank_length * sin(shank_angle);
    shank_y = thigh_y - shank_length * cos(shank_angle);
    
    % 将坐标保存到数组中
    thigh_trajectory(i,:) = [thigh_x, thigh_y];
    shank_trajectory(i,:) = [shank_x, shank_y];
    
    % 计算下一步的初始状态
    if mod(i, step_length/0.01) == 0 % 每走一步
        if thigh_angle > 0 % 如果大腿朝前
            thigh_angle = deg2rad(-20); % 初始角度为最大后摆
                else % 如果大腿朝后
            thigh_angle = deg2rad(110); % 初始角度为最大前摆
        end
        shank_angle = 0; % 小腿初始角度为0，即竖直向上
        thigh_angular_velocity = 0; % 大腿角速度为0
        shank_angular_velocity = 0; % 小腿角速度为0
    end
end

% 绘制运动轨迹
figure
plot(thigh_trajectory(:,1), thigh_trajectory(:,2), 'b', 'LineWidth', 2)
hold on
plot(shank_trajectory(:,1), shank_trajectory(:,2), 'r', 'LineWidth', 2)
axis equal
xlabel('x (m)')
ylabel('y (m)')
legend('大腿', '小腿')
