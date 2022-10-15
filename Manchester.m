clc
close all
%20-42954-1
%AB-CDEFG-H
%E=9
%F=5
%G=4
%bit=[1 0 0 1 0 1 0 1 0 1 0 0]
bit_stream = [1 0 0 1 0 1 0 1 0 1 0 0];
no_bits = length(bit_stream);
bit_rate = 2000;
pulse_per_bit = 2;
pulse_duration = 1/((pulse_per_bit)*(bit_rate));
no_pulses = no_bits*pulse_per_bit;
samples_per_pulse = 1000;
fs = (samples_per_pulse)/(pulse_duration);
t = 0:1/fs:(no_pulses)*(pulse_duration);
no_samples = length(t);
dig_sig = zeros(1,no_samples);
max_voltage = +2;
min_voltage = -2;
for i = 1:no_bits
j = (i-1)*2;
if bit_stream(i) == 1
dig_sig((j*(samples_per_pulse)+1):(j+1)*(samples_per_pulse)) = min_voltage*ones(1,samples_per_pulse);
dig_sig(((j+1)*(samples_per_pulse)+1):(j+2)*(samples_per_pulse)) = max_voltage*ones(1,samples_per_pulse);
else
dig_sig((j*(samples_per_pulse)+1):(j+1)*(samples_per_pulse)) = max_voltage*ones(1,samples_per_pulse);
dig_sig(((j+1)*(samples_per_pulse)+1):(j+2)*(samples_per_pulse)) = min_voltage*ones(1,samples_per_pulse);
end
end
plot(t,dig_sig,'linewidth',1.5)
grid on
xlabel('time in seconds')
ylabel('Voltage')
ylim([(min_voltage - (max_voltage)*0.2) 
(max_voltage+max_voltage*0.2)])
title(['Manchester  ',num2str(bit_stream),''])
