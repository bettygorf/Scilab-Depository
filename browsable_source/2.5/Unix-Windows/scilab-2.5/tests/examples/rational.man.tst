clear;lines(0);
s=poly(0,'s');
W=[1/s,1/(s+1)]
W'*W
Num=[s,s+2;1,s];Den=[s*s,s;s,s*s];
tlist(['r','num','den','dt'],Num,Den,[])
H=Num./Den
syslin('c',Num,Den)
syslin('c',H)
[Num1,Den1]=simp(Num,Den)
