function [s]=%lsscp(s1,d2)
//s=%lsscp(s1,d2) 
// u=[u1;u2]    y=y1+d2*u1
// s=[s1,d2]
//!
// origine s. steer inria 1992
//
[a1,b1,c1,d1,x1,dom1]=s1(2:7)
[n1,m1]=size(b1);[p2,m2]=size(d2);
s=list('lss',a1,[b1 0*ones(n1,m2)],c1,[d1 d2],x1,dom1)



