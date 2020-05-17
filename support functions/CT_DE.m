function [I11,I22,I1h,I1l,I2h,I2l,I2thog,I1thog]=CT_DE(I1,I2,lambda,mu,para2)

[x,y,z]=size(I2);
if (z==3)
    [I2l(:,:,1),I2h(:,:,1)]=cartoon_texure(I2(:,:,1),lambda,para2,mu);
    [I2l(:,:,2),I2h(:,:,2)]=cartoon_texure(I2(:,:,2),lambda,para2,mu);
    [I2l(:,:,3),I2h(:,:,3)]=cartoon_texure(I2(:,:,3),lambda,para2,mu);
    I2thog=rgb2gray(I2h);
    I22=rgb2gray(I2);
else
    [I2l,I2h]=cartoon_texure(I2,lambda,para2,mu);
    I2thog=(I2h);
     I22=I2;
end
 I1thog = I2thog;
 I11 = I22;
I1l = I2l;
I1h = I2h;
