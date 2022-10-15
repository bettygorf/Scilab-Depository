clear;lines(0);
//Find diagonal matrix X (i.e. X=diag(diag(X), p=1) such that
//A1'*X+X*A1+Q1 < 0, A2'*X+X*A2+Q2 < 0 (q=2) and trace(X) is maximized 
n=2;A1=rand(n,n);A2=rand(n,n);
Xs=diag(1:n);Q1=-(A1'*Xs+Xs*A1+0.1*eye());
Q2=-(A2'*Xs+Xs*A2+0.2*eye());
deff('[LME,LMI,OBJ]=evalf(Xlist)','X=Xlist(1),LME=X-diag(diag(X));...
LMI=list(-(A1''*X+X*A1+Q1),-(A2''*X+X*A2+Q2)),OBJ= -sum(diag(X))  ');
X=lmisolver(list(zeros(A1)),evalf);X=X(1)
[Y,Z,c]=evalf(X)
