 function [X,Y,L]=h2hinf(A,B1,B2,C1,C2,D11,D12,D22,gama)
// Copyright INRIA
// Generated by lmitool on Mon Feb 06 17:09:19 MET 1995
 Mbound = 1e3;
 abstol = 1e-10;
 nu = 10;
 maxiters = 100;
 reltol = 1e-10;
 options=[Mbound,abstol,nu,maxiters,reltol];
 /////////////////DO NOT REMOVE THIS LINE
 X_init=eye(A)
 Y_init=zeros(C2*C2')
 L_init=zeros(B2')
 /////////////////DO NOT REMOVE THIS LINE
 XLIST0=list(X_init,Y_init,L_init)
 XLIST=lmisolver(XLIST0,h2hinf_eval,options)
 [X,Y,L]=XLIST(:)
 /////////////////EVALUATION FUNCTION////////////////////////////
 function [LME,LMI,OBJ]=h2hinf_eval(XLIST)
 [X,Y,L]=XLIST(:)
 /////////////////DO NOT REMOVE THIS LINE
 LME=list(X-X',Y-Y');
 LMI=list(-[A*X+B2*L+(A*X+B2*L)'+B1*B1',X*C1'+L'*D12'+B1*D11';...
 (X*C1'+L'*D12'+B1*D11')',-gama^2*eye()+D11*D11'],[Y,C2*X+D22*L;(C2*X+D22*L)',X])
 OBJ=trace(Y);
