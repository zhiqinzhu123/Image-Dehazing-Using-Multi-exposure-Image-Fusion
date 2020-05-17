function [ent]= SHANG(I2)
% I2=rgb2gray(I2);
% % imshow(I2);
% [counts,x]=imhist(I2);
% h=imhist(I2);
% figure
% %imshow(h);
% stem(x,counts)
% h=h/sum(h);
% k=length(h);
% L=k-1;
% %计算1-3阶统计矩
% h=h(:);%转化为列向量
% rad=0:L;%生成随机数
% rad=rad./L;%归一化
% m=rad*h;%均值
% rad=rad-m;
% %计算统计矩
% stm=zeros(1,3);
% stm(1)=m;
% i=L;
% for j=2:i
%     stm(j)=(rad.^j)*h;
% end
% %获取非归一化的1?3阶统计矩
% usm(1)=stm(1)*L;
% usm(2)=stm(2)*L^2;
% usm(3)=stm(3)*L^3;
% %计算6个统计纹理度量
% %disp('均值')
% %st(1)=usm(1)%均值
% %disp('标准差')
% %disp('平滑度')
% %disp('三阶矩')
% % st(4)=usm(3)/(L^2)%三阶矩
% %disp('一致性')
% %st(5)=sum(h.^2)%一致性
% disp('熵')
% st(1)=-sum(h.*log2(h+eps))%熵
I2=rgb2gray(I2);
A=double(I2);
[m,n]=size(A);                         %求A矩阵的大小，赋值给m n
B=A;
C=zeros(m,n);                         %新建全零矩阵C，以下求解归一化的灰度直方图
for i=1:m-1
    for j=1:n-1
        B(i,j)=A(i+1,j+1);
        C(i,j)=(round(A(i,j)-B(i,j))); 
%源程序为C(i,j)=abs(round(A(i,j)-B(i,j))); 但是我觉得由公式（1）的计算应该不加abs.
 
    end
end
h=imhist(mat2gray(C))/(m*n);
mean=0;con=0;ent=0;                    % 均值mean、对比度con和熵ent初始值赋零
for i=1:256                              %循环求解均值mean、对比度con和熵ent          
    mean=mean+(i*h(i))/256;
    con=con+i*i*h(i);
    if(h(i)>0)
        ent=ent-h(i)*log2(h(i));
    end
end
