clc
close all
f=1;
f2=10;
x=[0 0 1 1 0 1 0 1 0 0 1 1 0 1 0 1 0 0 1 1 0 1 1 0] % input signal ;
nx=length(x);
p=0;
fs=5000;
fc=2;
for i=1:3:nx
 t=p*1:1/fs:(p+1)*1;
 if x(i)==0 && x(i+1)==0 && x(i+2)==0
 ask=0;
 elseif x(i)==0 && x(i+1)==0 && x(i+2)==1
 ask=1*sin(2*pi*fc*t);
 elseif x(i)==0 && x(i+1)==1 && x(i+2)==0
 ask=2*sin(2*pi*fc*t);
 elseif x(i)==0 && x(i+1)==1 && x(i+2)==1
 ask=3*sin(2*pi*fc*t);
 elseif x(i)==1 && x(i+1)==0 && x(i+2)==0
 ask=4*sin(2*pi*fc*t);
 elseif x(i)==1 && x(i+1)==0 && x(i+2)==1
 ask=5*sin(2*pi*fc*t);
 elseif x(i)==1 && x(i+1)==1 && x(i+2)==0
 ask=6*sin(2*pi*fc*t);
 else
 ask=7*sin(2*pi*fc*t);
 end
plot(t,ask);
hold on;
grid on;
title('8 ASK')
p=p+1;
end
hold off;
