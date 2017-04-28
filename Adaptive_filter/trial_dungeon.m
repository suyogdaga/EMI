%noise cancellation

clear
close all

order=10;

load project1.mat

primary= transpose(primary);
subplot(4,1,1);
plot(primary);
title('primary = voice + noise   (input1)');

ref= transpose(reference)   ;         
subplot(4,1,2);
plot(ref);
title('reference  (noisy noise)   (input2)');

w=zeros(order,1);
mu=0.0005;
for i=1:70000-order
   buffer = ref(i:i+order-1);                                  
   desired(i) = primary(i)- buffer'*w;                    
   w=w+(buffer'.*mu*desired(i)/norm(buffer))';
end

subplot(4,1,3);
plot(desired);
title('Adaptive output  (hopefully it''s close to "voice")')

sound(desired);
