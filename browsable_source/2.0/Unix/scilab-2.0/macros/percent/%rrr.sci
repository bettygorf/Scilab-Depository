//<s1>=%rrr(s1,s2)
// %rrr(s1,s2) calcule la division a droite de la matrice de fractions
//rationnelles s1 et de la matrice de fractions rationnelles s2.
//Cette macro correpond a l'operation  s1/s2
//!
[s1,s2]=sysconv(s1,s2),
[n,m]=size(s2(2))
if n<>m then error(43),end
if n*m=1 then
  s1=%rmr(s1,list('r',s2(3),s2(2),s2(4)) ),
else
 p=s2(2)
 s2=s2(3)
 for k=1:n
   pp=lcm(s2(:,k))
   for l=1:n;p(l,k)=p(l,k)*pdiv(pp,s2(l,k)),end
   s1(:,k)=s1(:,k)*pp
 end
 s1=s1*invr(p)
end
//end


