clc

close all
bit_stream = [0 1 0 1 0 1 0 1 0 1 1 0]; 
no_bits = length(bit_stream);
 bit_rate = 10000;
 pulse_per_bit = 2;
 pulse_duration = 1/((pulse_per_bit)*(bit_rate));
 no_pulses = no_bits*pulse_per_bit;
 samples_per_pulse = 1000;
 fs = (samples_per_pulse)/(pulse_duration);
 t = 0:1/fs:(no_pulses)*(pulse_duration);
 no_samples = length(t);
 dig_sig = zeros(1,no_samples);
 max_voltage = +2;
 avg_voltage=0;
 min_voltage = -2;
flag=0;
last_state=min_voltage;
flag1=0;
for i = 1:no_bits
 if bit_stream(i) == 1
 if flag == 0
 if flag1==0
 dig_sig((i*(samples_per_pulse)+1):(i+1)*(samples_per_pulse)) = max_voltage*ones(1,samples_per_pulse);
 flag=1;
 last_state=max_voltage;
 flag1=1;
 else
 dig_sig((i*(samples_per_pulse)+1):(i+1)*(samples_per_pulse)) = avg_voltage*ones(1,samples_per_pulse);
 flag=0;
 last_state=avg_voltage;
 flag1=0;
 end
 else
 if flag1==1
 dig_sig((i*(samples_per_pulse)+1):(i+1)*(samples_per_pulse)) = avg_voltage*ones(1,samples_per_pulse);
 flag=0;
 last_state=avg_voltage;
 flag1=0;
 else
 dig_sig((i*(samples_per_pulse)+1):(i+1)*(samples_per_pulse)) = min_voltage*ones(1,samples_per_pulse);
 flag=0;
 last_state=min_voltage;
1;
 flag1=1;
 end
 end
 else
 dig_sig((i*(samples_per_pulse)+1):(i+1)*(samples_per_pulse)) = last_state*ones(1,samples_per_pulse);
 end
end
 plot(t,dig_sig,'linewidth',1.5)
grid on
xlabel('time in seconds')
ylabel('Voltage')
ylim([(min_voltage - (max_voltage)*0.2) 
(max_voltage+max_voltage*0.2)])
 title(['MLT-3 for ',num2str(bit_stream),''])
