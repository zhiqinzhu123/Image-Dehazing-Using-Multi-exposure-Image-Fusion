function R = amef(I_hazy)
clip_range = 0.01;
I_hazy = im2double(I_hazy);
I = zeros(size(I_hazy,1),size(I_hazy,2),size(I_hazy,3),6);

I(:,:,:,1) = I_hazy;
range = linspace(1,6,6);
for i=2:5
    gamma = range(i);
    for c=1:3
        I(:,:,c,i) = I_hazy(:,:,c).^gamma;%伽马校正，获得不同曝光度的图像，
      imwrite(I(:,:,:,i), ['D:\image\dehazing-asd\image\G',num2str(i),'.tif']);

%        imwrite(I1(:,:,i), ['D:\image\dehazing-asd\image\B',num2str(i),'.tif']);
    end
end
% I1 = zeros(size(I_hazy,1),size(I_hazy,2),size(I_hazy,3),6);
% I1=baohedu(I);
[s1, s2, s3, s4] = size(I);
 numExd = 2*s4-1; 
    I1 = zeros(s1, s2, s3, numExd);    
       count = 0;
   for i = 1 : s4      
    I1(:,:,:,i)=baohedu(I(:,:,:,i)); 
imwrite(I1(:,:,:,i), ['D:\image\dehazing-asd\image\B',num2str(i),'.tif']);
end

for c=1:3
    I1(:,:,c,6) = adapthisteq(I_hazy(:,:,c),'clipLimit',clip_range);
end
wRad = 12; % radius of the filter

k=8;%块
lambda=0.1;
para2=20;
mu=10;

tic
R = PAMEF(I1,I_hazy);
toc 
% image=fI;
% figure;
% %%
% % imwrite(image,'results/1.tif')
% 
% %%
% imwrite(image,'image/1.tif');
% %%
% tic
% image1 = imread('./image/1.tif');
% [out_image, score] = MEFO(I1, image1);
% toc
% R = out_image;

end