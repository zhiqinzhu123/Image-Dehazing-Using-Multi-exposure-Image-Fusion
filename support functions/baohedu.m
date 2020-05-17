function C=baohedu(Io)
Image=double(Io);
R=Image(:,:,1);
G=Image(:,:,2);
B=Image(:,:,3);
I=0.299*R+0.587*G+0.114*B;[row, col] = size(R);
R_new=R;G_new=G;B_new=B;%%%% Increment, 饱和度调整增量（-100,100）
Increment=(10)/100;
for i=1:row   
    for j=1:col       
        rgbMax=max(R(i,j),max(G(i,j),B(i,j)));        
        rgbMin=min(R(i,j),min(G(i,j),B(i,j)));       
        Delta=(rgbMax-rgbMin)/255;        
        if(Delta==0)           
            continue;       
        end
        value = (rgbMax + rgbMin)/255;       
        L=value/2;             
        if(L<0.5)          
            S=Delta/value;     
        else
            S =Delta/(2 - value);     
        end
        if (Increment>=0)          
            if((Increment+S)>=1)       
                alpha=S;           
            else
                alpha=1-Increment;        
            end
            alpha=1/alpha-1;
            R_new(i,j) = R(i,j) + (R(i,j) - L * 255) * alpha;        
            G_new(i,j) = G(i,j) + (G(i,j) - L * 255) * alpha;      
            B_new(i,j) = B(i,j) + (B(i,j) - L * 255) * alpha;      
        else
            alpha=Increment;       
            R_new(i,j) = L*255 + (R(i,j) - L * 255) * (1+alpha);      
            G_new(i,j) = L*255 + (G(i,j) - L * 255) * (1+alpha);        
            B_new(i,j) = L*255 + (B(i,j) - L * 255) * (1+alpha);         
        end
    end
end
Image_new(:,:,1)=R_new;
Image_new(:,:,2)=G_new;
Image_new(:,:,3)=B_new;


C=Image_new;
end
