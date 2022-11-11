clc
close all
clear all
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
 fsk=sin(2*pi*fc*t);
 elseif x(i)==0 && x(i+1)==0 && x(i+2)==1
 fsk=sin(2*pi*2*fc*t);
 elseif x(i)==0 && x(i+1)==1 && x(i+2)==0
 fsk=sin(2*pi*3*fc*t);
 elseif x(i)==0 && x(i+1)==1 && x(i+2)==1
 fsk=sin(2*pi*4*fc*t);
 elseif x(i)==1 && x(i+1)==0 && x(i+2)==0
 fsk=sin(2*pi*5*fc*t);
 elseif x(i)==1 && x(i+1)==0 && x(i+2)==1
 fsk=sin(2*pi*6*fc*t);
 elseif x(i)==1 && x(i+1)==1 && x(i+2)==0
 fsk=sin(2*pi*7*fc*t);
 else
 fsk=sin(2*pi*8*fc*t);
 end
plot(t,fsk);
hold on;
grid on;
title('8 FSK')
p=p+1;
end
hold off;
