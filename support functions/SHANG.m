function [D]= SHANG(I1)                  %读入纹理图像，分别输入wall.jpg和stone.jpg两幅图进行对比

I1=rgb2gray(I1);

[m,n]=size(I1);                         %求A矩阵的大小，赋值给m n
I2=I1;
I3=zeros(m,n);                         %新建全零矩阵C，以下求解归一化的灰度直方图
for i=1:m-1
    for j=1:n-1
        I2(i,j)=I1(i+1,j+1);
        I3(i,j)=(round(I1(i,j)-I2(i,j))); 
%源程序为C(i,j)=abs(round(A(i,j)-B(i,j))); 但是我觉得由公式（1）的计算应该不加abs.
 
    end
end
h=imhist(mat2gray(I3))/(m*n);
mean=0;con=0;ent=0;                    % 均值mean、对比度con和熵ent初始值赋零
for i=1:256                              %循环求解均值mean、对比度con和熵ent          
    mean=mean+(i*h(i))/256;
    con=con+i*i*h(i);
    if(h(i)>0)
        ent=ent-h(i)*log2(h(i)); 
        
    end    
end

st(1)=ent;
D=st(1);



