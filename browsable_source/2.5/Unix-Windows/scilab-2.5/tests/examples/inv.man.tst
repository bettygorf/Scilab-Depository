clear;lines(0);
A=rand(3,3);inv(A)*A
//
x=poly(0,'x');
A=[x,1,x;x^2,2,1+x;1,2,3];inv(A)*A
//
A=[1/x,2;2+x,2/(1+x)]
inv(A)*A
//
A=ssrand(2,2,3);
W=inv(A)*A
clean(ss2tf(W))
