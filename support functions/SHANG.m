function [D]= SHANG(I1)                  %��������ͼ�񣬷ֱ�����wall.jpg��stone.jpg����ͼ���жԱ�

I1=rgb2gray(I1);

[m,n]=size(I1);                         %��A����Ĵ�С����ֵ��m n
I2=I1;
I3=zeros(m,n);                         %�½�ȫ�����C����������һ���ĻҶ�ֱ��ͼ
for i=1:m-1
    for j=1:n-1
        I2(i,j)=I1(i+1,j+1);
        I3(i,j)=(round(I1(i,j)-I2(i,j))); 
%Դ����ΪC(i,j)=abs(round(A(i,j)-B(i,j))); �����Ҿ����ɹ�ʽ��1���ļ���Ӧ�ò���abs.
 
    end
end
h=imhist(mat2gray(I3))/(m*n);
mean=0;con=0;ent=0;                    % ��ֵmean���Աȶ�con����ent��ʼֵ����
for i=1:256                              %ѭ������ֵmean���Աȶ�con����ent          
    mean=mean+(i*h(i))/256;
    con=con+i*i*h(i);
    if(h(i)>0)
        ent=ent-h(i)*log2(h(i)); 
        
    end    
end

st(1)=ent;
D=st(1);



