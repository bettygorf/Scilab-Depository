      subroutine scitovv(x,nx)
c     scilab data structure to fortran fortran var2vec  to scilab
c     x is the var2vec fortran image of the variable stored at the top
c     of the stack 
c 
c     Copyright INRIA
      double precision x(*)
      integer  l
c 
      external dcopy, error
      include "../stack.h"
c 
      integer  iadr,sadr
c
      iadr(l) = l + l - 1
      sadr(l) = (l/2) + 1
c
c     scilab variable to transfer
      l=lstk(top)
      n=lstk(top+1)-lstk(top)
      il=iadr(l)
      if(istk(il).eq.1.and.istk(il+1).eq.0.or.istk(il+2).eq.0) then
         top=top-1
         return
      endif
      if(n.ne.nx) then
         call error(98)
      else
         call dcopy(n,stk(l),1,x,1)
         top=top-1
      endif
      end 
