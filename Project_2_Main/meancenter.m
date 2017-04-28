function data= meancenter(data1)
 k = zeros(size(data1,1),1);
 data = zeros(size(data1,1),size(data1,2));
 for i = 1:size(data1,2)
      k(:,1) = k(:,1) + data1(:,i);
 end
 y = k/size(data1,2);
 
 for i = 1:size(data,2)
    data(:,i) = data1(:,i) - y;
end

end