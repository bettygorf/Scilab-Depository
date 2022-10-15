clear;lines(0);
Plant=ssrand(1,3,5);
[F,G,H,J]=abcd(Plant);
nw=4;nuu=2;A=rand(nw,nw);
st=maxi(real(spec(A)));A=A-st*eye(A);
B=rand(nw,nuu);C=2*rand(1,nw);D=0*rand(C*B);
Model=syslin('c',A,B,C,D);
[L,M,T]=gfrancis(Plant,Model);
norm(F*T+G*L-T*A,1)
norm(H*T+J*L-C,1)
norm(G*M-T*B,1)
norm(J*M-D,1)
