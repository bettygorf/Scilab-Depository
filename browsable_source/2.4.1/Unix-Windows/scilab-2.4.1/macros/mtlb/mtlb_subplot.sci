function mtlb_subplot(m,n,p)
// Copyright INRIA
[lhs,rhs]=argn(0)
if rhs==1 then
  p=modulo(m,100)
  n=modulo(m-100*p,10)
  m=m-100*p-10*n
end
j=int((p-1)/n)
i=p-1-n*j
xsetech([i/n,j/m,1/n,1/m])
