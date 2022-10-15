function [h]=%svs(h1,h2)
// %svs(h1,h2)  <=> h =(I+h1*h2)\h1 <=> h=h1/.h2
[m1,n1]=size(h1)
[m2,n2]=size(h2)
if abs(n1-m2)+abs(m1-n2)<>0 then error('inconsistent dimensions'),end
h=(eye(m1,m1)+h1*h2)\h1



