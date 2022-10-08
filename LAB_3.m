clc
close all
A=2;%20-442954-1 Group member Id
B=0;
C=4;
D=2;
E=9;
F=5;
G=4;
H=1;
A1 = (A+B+H);
A2 = (B+C+H);
s =(C+D+H)/30;
fs=5000;
t=0:1/fs:3;
sd=0.5;
x = A1*sin(2*pi*((C+D+H)*100)*t ) ;
y= A2*cos(2*pi*((D+E+H)*100)*t) ;
z=s*randn(size(t));
signal=x+y+z;
noi_se=sd*randn(size(signal));
noisy_x= signal+noi_se;
ps=(A1^2)/2+(A2^2)/2;
pn=sd^2;
% SNR value of the composite signal
SNR_theory = ps/pn;
SNR_THEORY_DB = 10*log10(SNR_theory);
snr_function=snr(signal,noi_se);
%Find the bandwidth of the signal and calculate the maximum capacity of the channel
bandwidth = obw(signal,fs); 
Capacity = bandwidth*log2(1+SNR_theory);
%the signal level to achieve the data rate
level= 2^((Capacity/(2*bandwidth)));
