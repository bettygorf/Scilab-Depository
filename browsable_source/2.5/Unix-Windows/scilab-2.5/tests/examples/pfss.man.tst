clear;lines(0);
W=ssrand(1,1,6);
elts=pfss(W); 
W1=0;for k=1:size(elts), W1=W1+ss2tf(elts(k));end
clean(ss2tf(W)-W1)
