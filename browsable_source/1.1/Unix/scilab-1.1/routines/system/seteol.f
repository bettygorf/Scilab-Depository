      subroutine seteol
c     =====================================
c     insert eol code in compiled structure 
c     ======================================
      include '../stack.h'
      logical compil,ilog
      if(err1.le.0) ilog=compil(0,15)
      return
      end
