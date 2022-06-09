syms y1 y2 y3 y4 ;

l1 = 0.1; l2 = 0.15;

m1 = 2; m2 = 3;

g = 9.8;

dy(1) = y3;

dy(2) = y4;

A = [ l1*cos(y3-y4) , l2 ; l1*(m1+m2) , l2*m2*cos(y1-y2) ];

B = [ l1*y3^2*sin(y1-y2)-g*sin(y2) ; -l2*m2*y4^2*sin(y1-y2)-(m1+m2)*g*sin(y1) ];

C = A \ B;

dy(3) = C(1);

dy(4) = C(2);

dy = dy(:);

jacobian_mat = jacobian(dy,[y1,y2,y3,y4]);

fixed.jacobian = subs(jacobian_mat,{y1,y2,y3,y4},{0,0,0,0});%平衡点的雅可比矩阵

fixed.eig = eig(fixed.jacobian);%平衡点的特征值