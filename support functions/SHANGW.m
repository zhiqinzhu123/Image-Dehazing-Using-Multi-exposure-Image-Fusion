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
% %����1-3��ͳ�ƾ�
% h=h(:);%ת��Ϊ������
% rad=0:L;%���������
% rad=rad./L;%��һ��
% m=rad*h;%��ֵ
% rad=rad-m;
% %����ͳ�ƾ�
% stm=zeros(1,3);
% stm(1)=m;
% i=L;
% for j=2:i
%     stm(j)=(rad.^j)*h;
% end
% %��ȡ�ǹ�һ����1?3��ͳ�ƾ�
% usm(1)=stm(1)*L;
% usm(2)=stm(2)*L^2;
% usm(3)=stm(3)*L^3;
% %����6��ͳ���������
% %disp('��ֵ')
% %st(1)=usm(1)%��ֵ
% %disp('��׼��')
% %disp('ƽ����')
% %disp('���׾�')
% % st(4)=usm(3)/(L^2)%���׾�
% %disp('һ����')
% %st(5)=sum(h.^2)%һ����
% disp('��')
% st(1)=-sum(h.*log2(h+eps))%��
I2=rgb2gray(I2);
A=double(I2);
[m,n]=size(A);                         %��A����Ĵ�С����ֵ��m n
B=A;
C=zeros(m,n);                         %�½�ȫ�����C����������һ���ĻҶ�ֱ��ͼ
for i=1:m-1
    for j=1:n-1
        B(i,j)=A(i+1,j+1);
        C(i,j)=(round(A(i,j)-B(i,j))); 
%Դ����ΪC(i,j)=abs(round(A(i,j)-B(i,j))); �����Ҿ����ɹ�ʽ��1���ļ���Ӧ�ò���abs.
 
    end
end
h=imhist(mat2gray(C))/(m*n);
mean=0;con=0;ent=0;                    % ��ֵmean���Աȶ�con����ent��ʼֵ����
for i=1:256                              %ѭ������ֵmean���Աȶ�con����ent          
    mean=mean+(i*h(i))/256;
    con=con+i*i*h(i);
    if(h(i)>0)
        ent=ent-h(i)*log2(h(i));
    end
end
