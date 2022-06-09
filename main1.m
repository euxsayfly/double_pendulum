clc;clear ;

%[T,Y] = ode45('shuangbai',[0,10],[3*pi/180;3*pi/180;0;0]);%线性
[T,Y] = ode45(@(t,Y)shuangbai1(t, Y, 2,3, 0.1,0.15),[0,10],[3*pi/180;3*pi/180;0;0]);

[T1,Y1] = ode45(@(t,Y)shuangbai1(t, Y, 2,3, 0.1,0.15),[0,80],[pi/3;pi/3;0;0]);%非线性

Ang = Y(:,1:4)*180/pi;

Ang1 = Y1(:,1:4)*180/pi;

%小振动时间响应图
figure(1)
plot(T,Ang(:,1:2))

xlabel('time (sec)')
ylabel('angle (deg)')

%大振动时间响应图
figure(2)
plot(T1,Ang1(:,1:2))

xlabel('time (sec)')
ylabel('angle (deg)')

%小振动相图
figure(3)
subplot(1,2,1)
plot(Ang(:,1),Ang(:,3))

xlabel('theta1 (deg)')
ylabel('theta1. (deg/sec)')

subplot(1,2,2)
plot(Ang(:,2),Ang(:,4))

xlabel('theta2 (deg)')
ylabel('theta2. (deg/sec)')

%大振动相图
figure(4)
subplot(1,2,1)
plot(Ang1(:,1),Ang1(:,3))

xlabel('theta1 (deg)')
ylabel('theta1. (deg/sec)')

subplot(1,2,2)
plot(Ang1(:,2),Ang1(:,4))

xlabel('theta2 (deg)')
ylabel('theta2. (deg/sec)')

%绘制庞加莱截面
%3°   在theta1=2°
k=0;Png=[];
for i = 1:length(T)
if Ang(i,3) <= 0.1 && Ang(i,3) >= -0.1
    k = k+1;
    Png(k,1:3) = Ang(i,2:4);
else
end
end
figure(5)
plot3(Png(:,1),Png(:,2),Png(:,3),'*')

xlabel('theta2 (deg)')
ylabel('theta1. (deg/sec)')
zlabel('theta2. (deg/sec)')

%60°   在theta1=40°
kk=0;Png1=[];
for ii = 1:length(T1)
if Ang1(ii,1) <= 41 && Ang1(ii,1) >= 39
    kk = kk+1;
    Png1(kk,1:3) = Ang1(ii,2:4);
else
end
end
figure(6)
plot3(Png1(:,1),Png1(:,2),Png1(:,3),'*')

xlabel('theta2 (deg)')
ylabel('theta1. (deg/sec)')
zlabel('theta2. (deg/sec)')