clc ;
clear all;
for time = 1:1:6000
%% 
% f = 0.4542*sin(0.001478*time + 3.329) + 0.07928*sin(0.008521*time - 5.351) + 0.04335*sin(0.01039*time + 2.528) + 0.00121*sin(0.02325*time - 4.996);
f1 = 0.4055*sin(0.002048*time+3.294) + 0.08196*sin(0.009372*time-5.768) + 0.05592*sin(0.01058*time+2.668) + 0.0007577*sin(0.02483*time-5.358);
f2 =(1.735)*sin((0.0003931)*time+0.178) + (0.3171)*sin((0.007188)*time-2.118)+ (0.1912)*sin((0.008898)*time+6.056) + (0.002511)*sin((0.02409)*time-1.883) ;
%%     
y1 = -0.3763 + 0.02922*cos(time*0.006283) - 0.2967*sin(time*0.006283) - 0.04455*cos(2*time*0.006283) - 0.1473*sin(2*time*0.006283) - 0.02613*cos(3*time*0.006283) - 0.07021*sin(3*time*0.006283) - 0.001995*cos(4*time*0.006283) - 0.01547*sin(4*time*0.006283) + 0.003288*cos(5*time*0.006283) + 0.01022*sin(5*time*0.006283) + 0.0003109*cos(6*time*0.006283) + 0.01002*sin(6*time*0.006283) - 6.109e-05*cos(7*time*0.006283) + 0.001559*sin(7*time*0.006283);
 
y2 = -0.3763 + (-0.02922)*cos(time*0.006283) + 0.2967*sin(time*0.006283)- 0.04455*cos(2*time*0.006283) - 0.1473*sin(2*time*0.006283) + 0.02613*cos(3*time*0.006283) + 0.07021*sin(3*time*0.006283)- 0.001995*cos(4*time*0.006283) - 0.01547*sin(4*time*0.006283)- 0.003288*cos(5*time*0.006283) - 0.01022*sin(5*time*0.006283) + 0.0003109*cos(6*time*0.006283) + 0.01002*sin(6*time*0.006283) + 6.109e-05*cos(7*time*0.006283) - 0.001559*sin(7*time*0.006283);

y3 =  0.7512 - 0.003046*cos(time*0.006284) + 0.09686*sin(time*0.006284)- 0.2228*cos(2*time*0.006284) - 0.0343*sin(2*time*0.006284)+ 0.03037*cos(3*time*0.006284) - 0.1355*sin(3*time*0.006284)+ 0.02802*cos(4*time*0.006284) + 0.007148*sin(4*time*0.006284)+ 0.007888*cos(5*time*0.006284) - 0.02134*sin(5*time*0.006284)+ 0.01843*cos(6*time*0.006284) + 0.007566*sin(6*time*0.006284)- 0.001304*cos(7*time*0.006284) + 0.001711*sin(7*time*0.006284);

y4 = 0.7491 - 0.0007526*cos(time*0.006289) - 0.09576*sin(time*0.006289)- 0.2257*cos(2*time*0.006289) - 0.03221*sin(2*time*0.006289)- 0.03735*cos(3*time*0.006289) + 0.1362*sin(3*time*0.006289)+ 0.02572*cos(4*time*0.006289) + 0.01448*sin(4*time*0.006289)- 0.009134*cos(5*time*0.006289) + 0.02283*sin(5*time*0.006289)+ 0.01706*cos(6*time*0.006289) + 0.01282*sin(6*time*0.006289)+ 0.002057*cos(7*time*0.006289) - 1.586e-06*sin(7*time*0.006289) ;

y5 = -0.3753 - 0.02211*cos(time*0.006283) - 0.2981*sin(time*0.006283)-0.05193*cos(2*time*0.006283) + 0.1448*sin(2*time*0.006283)+0.03156*cos(3*time*0.006283) - 0.06783*sin(3*time*0.006283)-0.003746*cos(4*time*0.006283) + 0.01506*sin(4*time*0.006283)-0.004526*cos(5*time*0.006283) + 0.009654*sin(5*time*0.006283)+0.001914*cos(6*time*0.006283) - 0.009814*sin(6*time*0.006283)-0.0002964*cos(7*time*0.006283) + 0.001515*sin(7*time*0.006283);

y6 = -0.3753 + 0.02211*cos(time*0.006284) + 0.2981*sin(time*0.006284)- 0.05193*cos(2*time*0.006284) + 0.1448*sin(2*time*0.006284)- 0.03156*cos(3*time*0.006284) + 0.06783*sin(3*time*0.006284)- 0.003746*cos(4*time*0.006284) + 0.01506*sin(4*time*0.006284)+ 0.009654*cos(5*time*0.006284) - 0.009717*sin(5*time*0.006284)+ 0.001914*cos(6*time*0.006284) - 0.009814*sin(6*time*0.006284)+ 0.0002964*cos(7*time*0.006284) - 0.001515*sin(7*time*0.006284) ;

r1 = -0.0150 - 0.02888*cos(time*0.0007841) + 0.02339*sin(time*0.0007841)- 0.01343*cos(2*time*0.0007841) + 0.03729*sin(2*time*0.0007841)+ 0.003702*cos(3*time*0.0007841) + 0.03757*sin(3*time*0.0007841)+ 0.01505*cos(4*time*0.0007841) + 0.0273*sin(4*time*0.0007841)+ 0.01748*cos(5*time*0.0007841) + 0.01373*sin(5*time*0.0007841)+ 0.01312*cos(6*time*0.0007841) + 0.003324*sin(6*time*0.0007841)+ 0.006725*cos(7*time*0.0007841) - 0.001604*sin(7*time*0.0007841)+ 0.0007926*cos(8*time*0.0007841) - 0.0368*sin(8*time*0.07841);
r2 = -r1;
q(0+time,1:8) = [y1 y2 y3 y4 y5 y6 r1 r2];
r3 = -0.0150 - 0.02888*cos(time*0.07841) + 0.02339*sin(time*0.07841)- 0.01343*cos(2*time*0.07841) + 0.03729*sin(2*time*0.07841)+ 0.003702*cos(3*time*0.07841) + 0.03757*sin(3*time*0.07841)+ 0.01505*cos(4*time*0.07841) + 0.0273*sin(4*time*0.07841)+ 0.01748*cos(5*time*0.07841) + 0.01373*sin(5*time*0.07841)+ 0.01312*cos(6*time*0.07841) + 0.003324*sin(6*time*0.07841)+ 0.006725*cos(7*time*0.07841) - 0.001604*sin(7*time*0.07841)+ 0.0007926*cos(8*time*0.07841) - 0.0368*sin(8*time*0.07841);
r4 = -0.00789 + 0.01229*cos(time*0.0007897) - 0.01167*sin(time*0.0007897) +0.00665*cos(2*time*0.07897) - 0.01923*sin(2*time*0.0007897) +4.813e-06*cos(3*time*0.07897) - 0.02073*sin(3*time*0.07897) -0.004896*cos(4*time*0.07897) - 0.01719*sin(4*time*0.07897) -0.006562*cos(5*time*0.07897) - 0.01154*sin(5*time*0.07897) -0.005403*cos(6*time*0.07897) - 0.00665*sin(6*time*0.07897) -0.002967*cos(7*time*0.07897) - 0.004271*sin(7*time*0.07897) -0.00569*cos(8*time*0.07897) + 0.03004*sin(8*time*0.07897);

end
x=0.001:0.001:6;
% figure(1)
% plot(x ,q(1:6000,1),x,q(1:6000,2))
% legend('大腿左','大腿右')
% 
% 
% 
% % figure(2)
% % plot(x ,q(1:6000,3),x,q(1:6000,4))
% % legend('大腿左','大腿右')
% % figure(3)
% % plot(x ,q(1:6000,5),x,q(1:6000,6))
% % legend('大腿左','大腿右')
figure(4)
plot(x ,q(1:6000,7),x,q(1:6000,8))
legend('大腿左','大腿右')