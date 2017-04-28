%% 
clear
srcFiles = dir('C:\Users\Suyogdaga\Documents\MATLAB\ProbeSet\*.pgm');  % the folder in which ur images exists
Probe = zeros(2500,200);
for i = 1 : 200
    filename = strcat('C:\Users\Suyogdaga\Documents\MATLAB\ProbeSet\',srcFiles(i).name); 
    I = imread(filename);
    X = reshape(I,size(I,1)*size(I,2),1);
    Probe(:,i) = X;        
end

%% 
srcFiles1 = dir('C:\Users\Suyogdaga\Documents\MATLAB\GallerySet\*.pgm');  % the folder in which ur images exists
Gallery = zeros(2500,100);
for i = 1 : 100
    filename = strcat('C:\Users\Suyogdaga\Documents\MATLAB\GallerySet\',srcFiles1(i).name); 
    I = imread(filename);
    X = reshape(I,size(I,1)*size(I,2),1);
    Gallery(:,i) = X;        
end



% figure(1)
% image(reshape(gallerytest(:,1),[50 50]),'CDataMapping','scaled')
% title('Probe set 1 guy');
% figure(2)
% image(reshape(gallerytest(:,2),[50 50]),'CDataMapping','scaled')
% title('Probe set 2 guy');
% figure(3)
% image(reshape(gallerytest(:,3),[50 50]),'CDataMapping','scaled')
% title('Probe set 3 guy');




