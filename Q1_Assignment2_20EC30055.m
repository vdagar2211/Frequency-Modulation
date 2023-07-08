clc
clear all
close all
%taking voice signal
[m,fs]=audioread('fivewo.wav');
m=m';
t=linspace(0,(length(m))/(fs*10000),length(m));
n=length(m);
subplot(4,1,1);
plot(t,m)
title("time Domain of audio Signal");


N=length(m);
M = abs(fftshift(fft(m,N)));
f = linspace(-fs/2,fs/2,N);
subplot(4,1,2);
plot(f,M/N);
title("Frequency Domain of Audio Signal");
fc=4000;

int_temp = zeros(1,n);
int =0;
for i=2:1:n
    int=int + (i/fs*10000)*((m(i)+m(i-(1)))/2);
    int_temp(1,i)=int;
end
x=cos(2*pi*fc*t+int_temp);
subplot(4,1,3);
plot(t,x)
title("time Domain of modulated Signal");

X = abs(fftshift(fft(x,N)));
f = linspace(-fs/2,fs/2,N);
subplot(4,1,4);
plot(f,X/N);
title("Frequency Domain of Modulated Signal");
ylim([0 0.01])
