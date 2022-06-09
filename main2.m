clc;clear;

options = odeset('RelTol',1e-7);

theta1=80*pi/180;theta2=80*pi/180;

[T,Y] = ode45('shuangbai',[0,10],[theta1;theta2;0;0]);%����

[T1,Y1] = ode45(@(t,Y)shuangbai1(t, Y, 2,3, 0.1,0.15),[0,10],[theta1;theta2;0;0]);%������

Ang = Y(:,1:4)*180/pi;

Ang1 = Y1(:,1:4)*180/pi;

%����ʱ����Ӧͼ
subplot(2,1,1)
plot(T,Ang(:,1:2))

title('����')
xlabel('time (sec)')
ylabel('angle (deg)')

%������ʱ����Ӧͼ
subplot(2,1,2)
plot(T1,Ang1(:,1:2))

title('������')
xlabel('time (sec)')
ylabel('angle (deg)')
