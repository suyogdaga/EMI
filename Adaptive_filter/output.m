function output = vsum(input)

coder.inline('always');

vt = input(1:2:end);
    
for i = int32(1:numel(input)/2)
    k = int32(i*2);
    vt(i) = vt(i) + input(k);
end

output = vt;
end