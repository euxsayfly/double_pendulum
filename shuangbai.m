function dy=shuangbai(~,y)
%����ģ��
m1=2;m2=3;

l1=0.1;l2=0.15;

g=9.8;

dy = [y(3);
      y(4);
      m2/(m1*l1)*y(4)^2*(y(2)-y(1))+y(3)^2*(y(2)-y(1))-g/l1*y(1)-m2*g/(m1*l1)*(y(1)-y(2));
     -m2/m1*y(4)^2*(y(1)-y(2))-2*l1/l2*y(3)^2*(y(1)-y(2))+g/l2*y(1)+m2/(m1*l2)*g*(y(1)-y(2))-g/l2*y(2)];
end