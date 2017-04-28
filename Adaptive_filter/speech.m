%noise cancellation

clear
close all

load project1.mat
order=80


voice=primary;
noise=reference;                                              


w=zeros(order,1);
mu=0.0001;
for i=1:70000-order
   buffer = noise(i:i+order-1);                                   
   desired(i) = voice(i)-buffer*w;                    
   w=w+(buffer.*mu*desired(i)/norm(buffer))';
end

subplot(4,1,1)
plot(voice);
title('primary signal - voice+noise');
subplot(4,1,2)
plot(noise)
title('Reference signal')
subplot(4,1,3)
plot(order+1:70000,desired)
title('Voice')

%sound(primary);
%sound(reference);
sound(desired);
