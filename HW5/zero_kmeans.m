clear

load fisheriris
[idx,C,sumd,D] = kmeans(meas,3,'start',zeros(3,4),'display','iter');

distance_zero = [652.601,419.037,238.144,127.067,93.5001,81.9427,79.5415,78.8514];

plot(distance_zero);
ylabel('objective function magnitude');
xlabel('iterations');