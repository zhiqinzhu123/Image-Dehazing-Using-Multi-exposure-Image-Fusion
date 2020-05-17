function [I_c,I_t] = cartoon_texure(f,lambda,NumSteps,mu)
% [imagename1 imagepath1]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
% I2=imread(strcat(imagepath1,imagename1));
[c1_f,t1_f]=tvsegment1(f,lambda,NumSteps,mu);
I1=f;
% [c2_f,t2_f]=tvsegment1(I1,0.001,100,100);
www1=(double(I1))-c1_f;
[x,y]=size(I1);
k=0;


% for i1=1:x
%     for i2=1:y
%         a=www1(i1,i2);
%         b=c1_f(i1,i2);
%         if(c1_f(i1,i2)<=0)
%             www1(i1,i2)=www1(i1,i2)+c1_f(i1,i2);
%            c1_f(i1,i2)=0;
%             k=k+1;
%         end
%         if(www1(i1,i2)<=0)
%             c1_f(i1,i2)=c1_f(i1,i2)+www1(i1,i2);
%             www1(i1,i2)=0;
%             k=k+1;
%         end
%     end
% end
% a=www1(1,4);
 I_c=c1_f;
 I_t=www1;
