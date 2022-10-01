
clc;
close all;
A=2; %20-42556-1
B=0;
C=4;
D=2;
E=5;
F=5;
G=6;
H=1;
K1= A+B;
K2= G+H+2;
frq1=E+F+5;
J1= (pi*(D+G+20))/180;
J2= pi/6;
fs=10000;
t=0:1/fs:3/15;
x1 = K1*cos(2*pi*frq1*1*t + J1);
plot(t,x1,'LineWidth',2)
xlabel('Time');
ylabel('Amplitude');
title('X1')
figure
frq2=C+D+5;
x2=K2*cos(2*pi*frq2*t+J2);
plot (t, x2, 'LineWidth',2)
xlabel('Time')
ylabel('Amplitude')
title('X2')
x3=x1+x2;
plot (t, x3, 'LineWidth',2)
xlabel('Time')
ylabel('Amplitude')
title('X3')
