clear
clc

dt=0.001;
q=zeros(9501,13);
q(:,1)=0:dt:9.5;
%下蹲
Tsqu=0.5; %下蹲时间
Hmax=1.225; %0位质心高度
Hwalk=1.15; %下蹲后质心高度
%% 
for i=1:round(Tsqu/dt)
    t=(i-1)*dt;
    A=Hwalk-Hmax; %高度变化量
    [a,~,~] = Quintic_polynomial_interpolation_general(0,A,0,0,0,0,Tsqu,t);
    pc=[0,0,Hmax+a];
    pfl=[0,0.1,0];
    [L_Hip_Yaw,L_Hip_Roll,L_Hip_Pitch,L_knee,L_Ankle_Pitch,L_Ankle_Roll]=ik(pc,pfl,1);
    L_Hip_Roll =0;
    L_Ankle_Roll = 0;
   
    pfr=[0,-0.1,0];
    [R_Hip_Yaw,R_Hip_Roll,R_Hip_Pitch,R_knee,R_Ankle_Pitch,R_Ankle_Roll]=ik(pc,pfr,2);
    R_Hip_Roll =0;
    R_Ankle_Roll = 0;
    q(500+i,2:13)=[L_Hip_Yaw,L_Hip_Roll,L_Hip_Pitch,L_knee,L_Ankle_Pitch,L_Ankle_Roll,R_Hip_Yaw,R_Hip_Roll,R_Hip_Pitch,R_knee,R_Ankle_Pitch,R_Ankle_Roll];
end
%% 行走
gait=generate_gait();
for i=1:size(gait,1)
    pc=[gait(i,2),gait(i,3),Hwalk];
    pfl=gait(i,4:6);
    pfr=gait(i,7:9);
    [L_Hip_Yaw,L_Hip_Roll,L_Hip_Pitch,L_knee,L_Ankle_Pitch,L_Ankle_Roll]=ik(pc,pfl,1);
    [R_Hip_Yaw,R_Hip_Roll,R_Hip_Pitch,R_knee,R_Ankle_Pitch,R_Ankle_Roll]=ik(pc,pfr,2);
    q(1000+i,2:13)=[L_Hip_Yaw,L_Hip_Roll,L_Hip_Pitch,L_knee,L_Ankle_Pitch,L_Ankle_Roll,R_Hip_Yaw,R_Hip_Roll,R_Hip_Pitch,R_knee,R_Ankle_Pitch,R_Ankle_Roll];
end
%% 
% x1 = 0:1:6500;
% x2 = 0:1:6500;
% y1 = q(2000:8500,2);
% y2 = q(2000:8500,8);
% figure(1)
% plot(x1,y1,x2,y2)
% legend('左','右')

x3 = 0:1:9000;
x4 = 0:1:9000;
y3 = 100*q(500:9500,3);
y4 = 100*q(500:9500,9);
data0 = [0.01*x3' y3];
writematrix(data0, 'E:\data\matlab\work\L_Hip_Roll_data.txt');
data1 = [0.01*x4' y4];
writematrix(data1, 'E:\data\matlab\work\R_Hip_Roll_data.txt');

x5 = 0:1:9000;
x6 = 0:1:9000;
y5 = 100*q(500:9500,4);
y6 = 100*q(500:9500,10);
data = [0.01*x5' y5];
writematrix(data, 'E:\data\matlab\work\L_Hip_Pitch_data.txt');
data2 = [0.01*x6' y6];
writematrix(data2, 'E:\data\matlab\work\R_Hip_Pitchl_data.txt');


x7 = 0:1:9000;
x8 = 0:1:9000;
y7 = 100*q(500:9500,5);
y8 = 100*q(500:9500,11);
data3 = [0.01*x7' y7];
writematrix(data3, 'E:\data\matlab\work\L_knee_data.txt');
data4 = [0.01*x8' y8];
writematrix(data4, 'E:\data\matlab\work\R_knee_data.txt');


x9 = 0:1:9000;
x10 = 0:1:9000;
y9 = 100*q(500:9500,6);
y10 =100* q(500:9500,12);
data5 = [0.01*x9' y9];
writematrix(data5, 'E:\data\matlab\work\L_Ankle_Pitch_data.txt');
data6 = [0.01*x10' y10];
writematrix(data6, 'E:\data\matlab\work\R_Ankle_Pitch_data.txt');


x11 = 0:1:9000;
x12 = 0:1:9000;
y11 =100* q(500:9500,7);
y12 = 100*q(500:9500,13);
data7 = [0.01*x11' y11];
writematrix(data7, 'E:\data\matlab\work\L_Ankle_Roll_data.txt');
data8 = [0.01*x12' y12];
writematrix(data8, 'E:\data\matlab\work\R_Ankle_Roll_data.txt');


figure(7)
plot(x3,y3,x5,y5,x7,y7,x9,y9,x11,y11)
legend('L_Hip_Roll','L_Hip_Pitch','L_knee','L_Ankle_Pitch','L_Ankle_Roll')

figure(8)
plot(x4,y4,x6,y6,x8,y8,x10,y10,x12,y12)
legend('R_Hip_Roll','R_Hip_Pitch','R_knee','R_Ankle_Pitch','R_Ankle_Roll')
