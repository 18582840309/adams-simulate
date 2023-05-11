function [L_Hip_Yaw,L_Hip_Roll,L_Hip_Pitch,L_knee,L_Ankle_Pitch,L_Ankle_Roll]=ik(pc,pf,lr)
%腿部逆运动学
%已知质心位置pc，脚底中心位置pf，计算左腿关节角度
%输出结果为从上到下依次关节角度，默认膝关节前弯
if lr==1 %左腿
    phip=pc+[0 0.15 -0.175]; %髋关节位置
else %右腿
    phip=pc+[0 -0.15 -0.175]; %髋关节位置
end
pankle=pf+[0,0,0.05]; %踝关节位置
Lleg=norm(phip-pankle); %腿长
%膝关节角度
L_knee=pi-2*asin(Lleg);
%侧摆
L_Hip_Roll=asin((pankle(2)-phip(2))/norm(phip(2:3)-pankle(2:3)));
L_Ankle_Roll=-L_Hip_Roll;
%前摆
L_Hip_Pitch=-asin((pankle(1)-phip(1))/Lleg)-L_knee/2;
L_Ankle_Pitch=asin((pankle(1)-phip(1))/Lleg)-L_knee/2;
L_Hip_Yaw=0;
end