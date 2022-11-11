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
 psk=sin(2*pi*f*t);
 elseif x(i)==0 && x(i+1)==0 && x(i+2)==1
 psk=sin(2*pi*f*t+pi/4);
 elseif x(i)==0 && x(i+1)==1 && x(i+2)==0
 psk=sin(2*pi*f*t+3*pi/4);
 elseif x(i)==0 && x(i+1)==1 && x(i+2)==1
 psk=sin(2*pi*f*t+pi/2);
 elseif x(i)==1 && x(i+1)==0 && x(i+2)==0
 psk=sin(2*pi*f*t-pi/4);
 elseif x(i)==1 && x(i+1)==0 && x(i+2)==1
 psk=sin(2*pi*f*t-pi/2);
 elseif x(i)==1 && x(i+1)==1 && x(i+2)==0
 psk=sin(2*pi*f*t+pi);
 else
 psk=sin(2*pi*f*t-3*pi/4);
 end
plot(t,psk);
hold on;
grid on;
title('8 PSK')
p=p+1;
end
hold off;
