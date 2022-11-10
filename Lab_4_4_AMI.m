clc
clear all;
close all;
%20-42556-1
%556

bit_stream = [0 1 0 1 0 1 1 0 0 0 0 1 ];
no_bits = length(bit_stream);
bit_rate = 5000; % 1 kbps
pulse_per_bit = 1; % for unipolar nrz
pulse_duration = 1/((pulse_per_bit)*(bit_rate));
no_pulses = no_bits*pulse_per_bit;
samples_per_pulse = 500;
fs = (samples_per_pulse)/(pulse_duration); %sampling frequency
% Including pulse duration in sampling frequency
% ensures having enough samples in each pulse
t = 0:1/fs:(no_pulses)*(pulse_duration); % samplinginterval
% total duration = (no_pulse)*(pulse_duration)
no_samples = length(t); % total number of samples
dig_sig = zeros(1,no_samples);
max_voltage = 5;
min_voltage = -5;
laststate=1;
insidezero=0;
for i = 1:no_bits
if bit_stream(i) == 1
if(laststate==-1)
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = zeros(1,samples_per_pulse);
laststate=0;
insidezero=-1;
elseif(laststate==1)
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = zeros(1,samples_per_pulse);
laststate=0;
insidezero=1;
elseif(laststate==0)
if(insidezero==-1)
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = max_voltage* ones(1,samples_per_pulse);
laststate=1;
else
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = min_voltage* ones(1,samples_per_pulse);
laststate=-1;
end
end
else
if(laststate==-1)
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = min_voltage*ones(1,samples_per_pulse);
elseif(laststate==1)
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = max_voltage*ones(1,samples_per_pulse);
else
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse)) = zeros(1,samples_per_pulse);
end
end
end
plot(t,dig_sig,'linewidth',1.5)
grid on
xlabel('time in seconds')
ylabel('Voltage')
ylim([(min_voltage - (max_voltage)*0.2)
(max_voltage+max_voltage*0.2)])
title(['MLT3 for ',num2str(bit_stream),''])
