      subroutine ext6f(aname,b,c)
c     example 6
c     reading a vector in scilab internal stack using readmat interface
c     -->link('ext6f.o','ext6f')
c     -->a=[1,2,3];b=[2,3,4];name=str2code('a');
c     -->c=fort('ext6f',name,1,'c',b,2,'d','out',[1,3],3,'d')
c     -->c=a+2*b
      double precision a(3),b(*),c(*)
      logical creadmat
      character*(*) aname

c     If aname exists reads it (in a) else return
      if(.not.creadmat(aname,m,n,a)) return
c
c     [m,n]=size(a)  here m=1 n=3
      do 1 k=1,n
   1  c(k)=a(k)+2.0d0*b(k)
      end
