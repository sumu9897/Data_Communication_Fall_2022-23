clc
close all
A=2;%20-42556-1 Group member Id
B=0;
C=4;
D=2;
E=5;
F=5;
G=6;
H=1;
A1 = (A+B+H);
A2 = (B+C+H);
s =(C+D+H)/30;
fs=10000;
t=0:1/fs:3;
signal = A1*sin(2*pi*((C+D+H)*100)*t ) + A2*cos(2*pi*((D+E+H)*100)*t);
f1=(C+D+H)*100% frequency for 1st wavelength
f2=(D+E+H)*100%frequency for 2nd wavelength
noi_se=s*randn(size(t));
noisy_x= signal+noi_se;
ps=(A1^2)/2+(A2^2)/2;
pn=s^2;
% SNR value of the composite signal
SNR_theory = ps/pn
SNR_theory_db = 10*log10(SNR_theory)
SNR_matlab=snr(signal,noi_se)
%bandwidth of the signal and calculate the maximum capacity of the channel
bandwidth = obw(signal,fs)
Capacity = bandwidth*log2(1+SNR_theory)
%the signal level to achieve the data rate
signal_level= floor(2^(Capacity/(2*bandwidth)))
