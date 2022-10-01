%20-42556-1
clc
close all
A=2;
B=0;
C=4;
D=2;
E=5;
F=5;
G=6;
H=1;
a1=G+1;
a2=F+2;
a3=E+3;
f1=E+1;
f2=F+2;
f3=G+3;
fs=5000;
t=0:1/fs:5;
x1=a1*cos(2*pi*f1*t);
x2=a2*sin(2*pi*f2*t);
x3=a3*cos(2*pi*f3*t);
subplot(2,1,1);
signal_x = x1 + x2 + x3 ;
plot(t,signal_x)
xlabel('time');
ylabel('amplitude');
title('Time Domain')
subplot(2,1,2);
signal_x = x1 + x2 + x3;
sig_freq=abs(fftshift(fft(signal_x)))/(length(signal_x)/2);
f=linspace(-fs/2,+fs/2,length(signal_x));
bar(f,sig_freq)
xlim([-15,+15])
ylim([0,+10])
xlabel('Frequency in Hz');
ylabel('amplitude');
title('Frequency Domain')
sd=10;
noise=sd*randn(size(signal_x));
figure
subplot(2,1,1);
plot(t,noise,'linewidth',1)
xlabel('Time');
ylabel('amplitude');
title('Time Domain')

subplot(2,1,2);
noise_s=abs(fftshift(fft(noise)))/(length(signal_x)/2);
bar(f,noise_s)
xlim([-15,+15])
xlabel('Frequency');
ylabel('amplitude');
title('Frequency Domain')


noise_sa= signal_x + noise;
figure
subplot(2,1,1);
plot(t,noise_sa, 'linewidth',2);
xlabel('time');
ylabel('amplitude');
title('Noise signal vs time domain');



noise_sf=abs(fftshift(fft(noise_sa)))/(length(signal_x)/2);
subplot(2,1,2);
bar(f,noise_sf, 'linewidth',2);
xlim([-15,+15])
xlabel('Frequency');
ylabel('amplitude');
title('frequency domain Noise signal');
