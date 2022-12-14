function [sl]=tf2ss(h)
// Transfer function to state-space.
//Syntax : sl=tf2ss(h)
// h = transfer matrix 
// sl = linear system in state-space representation (syslin list)
//!
if type(h)=2 then sl=list('lss',[],[],[],h,[],[]);return;end
[num,den]=h(2:3);
//
[nd,md]=size(den)
a=[];b=[];c=[];d=[];n1=0; // s=[]
for k=1:md
   for l=1:nd
     [r,q]=pdiv(num(l,k),den(l,k))
     dk(l)=q
     num(l,k)=r
   end
   if nd<>1 then [nk,pp]=cmndred(num(:,k),den(:,k));
   else
        pp=den(k);nk=num(k);
   end;
   slk=cont_frm(nk,pp)//
   [ak,bk,ck,dk1]=slk(2:5);
   // [s sk]
   [n2,m2]=size(bk)
   if n2<>0 then
      a(n1+1:n1+n2,n1+1:n1+n2)=ak;
      b(n1+1:n1+n2,k)=bk;
      c=[c ck]
      n1=n1+n2;
            else
      if n1<>0 then b(n1,k)=0;end
   end;
   d=[d dk]
end;
if degree(d)==0 then d=coeff(d),end
if n1<>0 then
  //
  [a,u]=balanc(a);c=c*u;b=u\b
  nrmb=norm(b,1);nrmc=norm(c,1);fact=sqrt(nrmc*nrmb)
  b=b*fact/nrmb;c=c*fact/nrmc;
  [no,u]=contr(a',c');
  u=u(:,1:no);
  a=u'*a*u;b=u'*b;c=c*u
  sl=list('lss',a,b,c,d,0*ones(no,1),h(4)), 
else
  sl=list('lss',[],[],[],d,[],h(4))
end
