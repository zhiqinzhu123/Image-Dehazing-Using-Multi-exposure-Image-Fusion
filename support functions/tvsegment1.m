
function [u,v] = tvsegment1(f,lambda,NumSteps,mu)
%TVSEGMENT segments the image basing on the  cartoon-texture  model of
% Vese-Osher
%   [u,v] =  tvsegment1(f,lambda,NumSteps,mu) segments the input image f over
%   NumSteps number of iterations.The output u approximately minimizes the
%   Vese-Osher segment model
%       TV(u)+lambda*|| f - u -div(g)||^2_L^2  + mu*||g||_L^p
%   where TV(u) is the total variation of u and v=div(g) indicates the 
% texture of image f.
%   mu: regularization parameter
%    By default, u0 = f.

%----采用有限差分格式，初始化网格参数采用有限差分格式，初始化网格参数--------%

EpsSqr = 1e-6;
%dt = 0.25;%时间间隔,不过好像没有用到过，后面再讨论。
h = 1;     %空间步长
[N1,N2] = size(f);
il = [1,1:N2-1];
ir = [2:N2,N2];
iu = [1,1:N1-1];
id = [2:N1,N1];
 z = 2*h;
z1 = 2*h^2;

%-------------------------参数初始化-------------------------------------%
 f = double(f);
 u = f;
ul = u(:,il);
ur = u(:,ir);
uu = u(iu,:);
ud = u(id,:);
%u(N1,N2) = u(N1,N2-1);

fx = (ud-uu)/z;
fy = (ur-ul)/z;
ff =1./sqrt(EpsSqr+fx.^2+fy.^2);

a = -1/(2*lambda);
g1 = a*fx.*ff;
g2 = a*fy.*ff;

%------------------------------------------------------------------------%
%-----------------------利用半隐式进行迭代计算-----------------------------%
%迭代初值选取
for k = 1:NumSteps
    ul = u(:,il);
    ur = u(:,ir);
    uu = u(iu,:);
    ud = u(id,:);
   uur = u(iu,ir);
   uul = u(iu,il);
   udl = u(id,il);

%-------------------------------------------------------------------------%   
    c1 = 1./sqrt((ud-u).^2+(ur-ul).^2/4+EpsSqr);
    c2 = 1./sqrt((u-uu).^2+(uur-uul).^2/4+EpsSqr);
    c3 = 1./sqrt((ud-uu).^2/4+(ur-u).^2+EpsSqr);
    c4 = 1./sqrt((udl-uul).^2/4+(u-ul).^2+EpsSqr);

   g1l = g1(:,il);
   g1r = g1(:,ir);
   g1u = g1(iu,:);
   g1d = g1(id,:);
  g1ul = g1(iu,il);
  g1dr = g1(id,ir);
   g11 = 2*g1+g1ul+g1dr-g1l-g1u-g1d-g1r;
 
   g2u = g2(iu,:);
   g2d = g2(id,:);
   g2r = g2(:,ir);
   g2l = g2(:,il);
  g2ul = g2(iu,il);
  g2dr = g2(id,ir);
   g22 = 2*g2+g2ul+g2dr-g2l-g2u-g2d-g2r;
   
    p1 = c1+c2+c3+c4;
    p2 = 1/(lambda*z1);
    p3 = 1+p1*p2;
     p = 1./p3;
  %  p = 1./[1+(1/(2*lambda*h^2)*c)];
     D = c1.*ud+c2.*uu+c3.*ur+c4.*ul;
    un = p.*(f-(g1d-g1u)/z-(g2r-g2l)/z+p2*D);
 
   %unl = un(:,il);
   %unr = un(:,ir);
   %unu = un(iu,:);
   %und = un(id,:); 
   
    G = 1./sqrt(EpsSqr+g1.^2+g2.^2);
    b1 = 2*lambda;
    b2 = mu*G;
    b3 = 4*lambda/h^2;
     b = b1./(b2+b3);
   % b = (2*lambda)./(mu*G+4*lambda/h^2);
    
    g1 = b.*((ud-uu)/z-fx+(g1d+g1u)/h^2+1/z1*g22);
    g2 = b.*((ur-ul)/z-fy+(g2r+g2l)/h^2+1/z1*g11);
   
  %--------更新u和v，作为下一次迭代的初始值--------------------------------%
    
   g2y = (g2(:,ir)-g2(:,il))/z;
   g1x = (g1(id,:)-g1(iu,:))/z;
   %g1x = g1-g1(iu,:);
     v = g1x+g2y;
     u = un;
end

 
  %whos
 end

