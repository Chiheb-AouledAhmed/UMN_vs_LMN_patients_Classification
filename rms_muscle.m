function [rms]=rms_muscle(signal,lengh)

N_trame=lengh;
NT=length(signal);
signal=signal.^2;
rms=zeros(size(signal));
rms(1)=sum(signal(1:N_trame/2));

for n=2:N_trame/2
    rms(n)=rms(n-1)+signal(n+N_trame/2-1);
end

for n=N_trame/2+1:NT-N_trame/2
    rms(n)=rms(n-1)-signal(n-N_trame/2)+signal(n+N_trame/2-1);
end

for n=NT-N_trame/2+1:NT
    rms(n)=rms(n-1)-signal(n-N_trame/2);
end

rms=sqrt(rms/N_trame);
 
 
       
