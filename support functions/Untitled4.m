
function I=WENLI(A)
[M,N]=size(A); 
temp=zeros(1,256); 
  
%��ͼ��ĻҶ�ֵ��[0,255]����ͳ�� 
for m=1:M; 
for  n=1:N; 
  
if A(m,n)==0; 
i=1; 
else
i=A(m,n); 
end
temp(i)=temp(i)+1; 
end
end
temp=temp./(M*N); 
  
%���صĶ��������� 
result=0; 
  
for  i=1:length(temp) 
if temp(i)==0; 
result=result; 
else
result=result-temp(i)*log2(temp(i)); 
end
end
result 
  
%���������� 
  
%�������ͼ�� 
A=floor(rand(8,8).*255); 
B=floor(rand(8,8).*255); 
  
[M,N]=size(A); 
temp=zeros(256,256); 
  
%��ͼ��ĻҶ�ֵ�ɶԵ���ͳ�� 
for m=1:M; 
for n=1:N; 
  
if  A(m,n)==0; 
i=1; 
else
i=A(m,n); 
end
  
if B(m,n)==0; 
j=1; 
else
j=B(m,n); 
end
  
temp(i,j)=temp(i,j)+1; 
end
end
temp=temp./(M*N); 
  
%���صĶ��������� 
result=0; 
  
for  i=1:size(temp,1) 
for j=1:size(temp,2) 
if temp(i,j)==0; 
result=result; 
else
result=result-temp(i,j)*log2(temp(i,j)); 
end
end
end
result