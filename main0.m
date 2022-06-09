clc;clear;

%初始状态设置

Theta1 = 60 *pi/180; Theta2 = 60 *pi/180;

dTheta1 = 10; dTheta2 = 5;

%双摆参数设置

M1 = 2; M2 = 3;

L1 = 0.1; L2 = 0.15;

% [T,Y] = ode45(@(t,Y)shuangbai2(t, Y, M1, L1),[0,10],[3*pi/4;3*pi/8;0;0]);单摆

[T,Y] = ode45(@(t,Y)shuangbai1(t, Y, M1,M2, L1,L2),[0,10],[Theta1;Theta2;dTheta1;dTheta2]);

x = [L1*sin(Y(:,1)),  L1*sin(Y(:,1))+L2*sin(Y(:,2))];

y = [-L1*cos(Y(:,1)), -L1*cos(Y(:,1))-L2*cos(Y(:,2))];



% 弧度转角度

ang = Y(:,1:2)*180/pi;



% 设置第一帧

figure('Color', 'white')

subplot(2,1,1)

plot(T, ang, 'LineWidth', 2)

hh1(1) = line(T(1), ang(1,1), 'Marker', '.', 'MarkerSize', 20,'Color', 'b');

hh1(2) = line(T(1), ang(1,2), 'Marker', '.', 'MarkerSize', 20,'Color', 'r');

xlabel('time (sec)')

ylabel('angle (deg)')



subplot(2,1,2)

hh2 = plot([0, x(1,1);x(1,1), x(1,2)], [0, y(1,1);y(1,1), y(1,2)], '.-', 'MarkerSize', 20, 'LineWidth', 2);

axis equal

axis([-(L2+L1) (L2+L1) -(L2+L1) (L2+L1)])

ht = title(sprintf('Time: %0.2f sec', T(1)));



% 获取图形尺寸

pos = get(gcf, 'Position');

width = pos(3);

height = pos(4);



% 预分配内存

mov = zeros(height, width, 1, length(T));%, 'uint8');



% 循环

for id = 1:length(T)

   % 更新图像数据.

   set(hh1(1), 'XData', T(id), 'YData', ang(id, 1))

   set(hh1(2), 'XData', T(id), 'YData', ang(id, 2))

   set(hh2(1), 'XData', [0, x(id, 1)], 'YData', [0, y(id, 1)])

   set(hh2(2), 'XData', x(id, :), 'YData', y(id, :))

   set(ht, 'String', sprintf('Time: %0.2f sec', T(id)))

   %下面输出 gif 动画    

     frame=getframe(gcf);  

     im=frame2im(frame);%制作gif文件，图像必须是index索引图像  

     [I,map]=rgb2ind(im,20);

     if id ==1

         imwrite(I,map,'doublependulumanimation.gif','gif', 'Loopcount',inf,'DelayTime',0.5);%第一次必须创建！

     else

       imwrite(I,map,'doublependulumanimation.gif','gif','WriteMode','append','DelayTime',0.5);

     end

end