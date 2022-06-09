function dy=shuangbai1(~,y,m1,m2,l1,l2)
%非线性模型

g=9.81;

% dy = [y(3);
%       y(4);
%       1/(l1*(cos(y(1)-y(2))^2*m2-m1-m2))*(l1*m1*cos(y(1)-y(2))*sin(y(1)-y(2))*y(3)^2+l2*m1*sin(y(1)-y(2))*y(4)^2-m1*g*cos(y(1)-y(2))*sin(y(2))+(m1+m2)*g*sin(y(1)));
%       1/(l2*(cos(y(1)-y(2))^2*m2-m1-m2))*(l2*m1*cos(y(1)-y(2))*sin(y(1)-y(2))*y(4)^2+l1*(m1+m2)*sin(y(1)-y(2))*y(3)^2+(m1+m2)*g*sin(y(1))*cos(y(1)-y(2))-(m1+m2)*g*sin(y(2)))];%有问题



dy(1) = y(3);

dy(2) = y(4);

A = [l1*cos(y(1)-y(2)),l2;l1*(m1+m2),l2*m2*cos(y(1)-y(2))];

B=[l1*y(3)^2*sin(y(1)-y(2))-g*sin(y(2));-l2*m2*y(4)^2*sin(y(1)-y(2))-(m1+m2)*g*sin(y(1))];

C=A\B;

dy(3) = C(1);

dy(4) = C(2);

dy = dy(:);

end