function [resn,g]=pfactors(pol,flag)
// Given polynomial pol returns in list resn polynomials of 
// degree 1 or two which are the factors of pol.
// One has pol= g times product of entries of resn
// if flag='c' unstable roots are reflected vs the imaginary axis 
// if flag='d' unstable roots are reflected vs unit circle 
w=roots(pol);
n=size(w,'*');
if n=0 then resn=list();g=coeff(pol);return;end
co=coeff(pol);g=co(n+1);
resn=list();
[LHS,RHS]=argn(0);
if RHS=1 then flag=[];end
if  flag=[] then RHS=1;end
if RHS==1 then
kk=1;k=1;
while %T
 if abs(imag(w(kk)))<=%eps then
     resn(k)=poly(w(kk),varn(pol));
     kk=kk+1;k=k+1;
     if kk>n then return;end
 end
 if abs(imag(w(kk)))>%eps then 
     resn(k)=real(poly([w(kk),w(kk+1)],varn(pol)));
     kk=kk+2;k=k+1;
     if kk>n then return;end
 end
end
end   //RHS=1
if RHS==2 then
kk=1;k=1;
if flag='c' then
while %T
 if abs(imag(w(kk)))<=%eps then
     resn(k)=poly(-abs(w(kk)),varn(pol));
     kk=kk+1;k=k+1;
     if kk>n then return;end
 end
 if abs(imag(w(kk)))>%eps then 
     if real(w(kk))<0 then
     resn(k)=real(poly([w(kk),w(kk+1)],varn(pol)));
     else ;resn(k)=real(poly([-w(kk),-w(kk+1)],varn(pol)));
     end
     kk=kk+2;k=k+1;
     if kk>n then return;end
 end
end
end    //'c'
if flag='d' then
while %T
wkk=w(kk);
 if abs(imag(wkk))<=%eps then
     resn(k)=poly(sign(real(wkk))*mini(abs(wkk),1/(abs(wkk))),varn(pol));
     kk=kk+1;k=k+1;
     if kk>n then return;end
 end
 if abs(imag(wkk))>%eps then 
     if abs(wkk)<1 then
     resn(k)=real(poly([wkk,w(kk+1)],varn(pol)));
     else ;
     zp=[wkk,w(kk+1)];resn(k)=real(poly(ones(zp)./zp,varn(pol)));
     end
     kk=kk+2;k=k+1;
     if kk>n then return;end
 end
end
end    //'d'
end   //RHS=2
