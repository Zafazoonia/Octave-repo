clear all;
close all;
clc;
t=0:0.1:10;
x=6*exp(t).*cos(10*t);
y=6*exp(t).*sin(10*t);
z=2*t;
plot3(x,y,z, 'or');

for i=1:length(x)
plot3(x(i),y(i),z(i), 'or');
title ('3D Trajectory')
xlabel('rx(t) (meters)')
ylabel('ry(t)(meters)')
zlabel('rz(t)(meters)')
grid on
box on
hold on;
pause(0.01);
end
%exportgraphics(gcf, 'vectorfig./ pdf', 'Content Type', 'vector')
