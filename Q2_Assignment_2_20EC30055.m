clc
clear all
close all
%taking voice signal
[m,fs]=audioread('fivewo.wav');
m=m';
t=linspace(0,(length(m))/(fs*10000),length(m));
n=length(m);

fc=4000;
int_temp = zeros(1,n);
int =m(1);
int_temp(1,1) = int;
for i=2:1:n
    int=int + (i/(fs*10000))*(m(i-(1))+((m(i)))/2);
    
    int_temp(1,i)=int;
end
x=cos(2*pi*fc*t+int_temp);

dif=0;
diff_temp=zeros(1,n);

for i=2:1:n
    dif= (( x(i)-x(i-(1)) )/(fs*10000) );
    diff_temp(1,i)=dif;
end

e = hilbert(diff_temp);
e = abs(e);
%e=lowpass(e,5000,fs);

subplot(2,1,1);
plot(t,e)
title("time Domain of demodulated Signal");
soundsc(e,fs);

N=length(m);
E = abs(fftshift(fft(e,N)));
f = linspace(-fs/2,fs/2,N);
subplot(2,1,2);
plot(f,E/N);
title("Frequency Domain of Audio Signal");
%it is suggested to zoom in to see frequecny domain better
