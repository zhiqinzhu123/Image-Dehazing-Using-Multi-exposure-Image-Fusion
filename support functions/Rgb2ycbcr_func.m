function [I]=Rgb2ycbcr_func(I1)
I1 = rgb2ycbcr(I1);
I(:,:,1)=I1(:,:,1);
I(:,:,2)=I1(:,:,2);
I(:,:,3)=I1(:,:,3);
