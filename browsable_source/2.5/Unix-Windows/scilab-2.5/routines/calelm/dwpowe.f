      subroutine dwpowe(v,pr,pi,rr,ri,ierr)
c!purose
c     computes v^p with v double precision and p complex
c!calling sequence
c     subroutine dwpowe(v,pr,pi,rr,ri,ierr)
c     integer ierr
c     double precision v,pr,pi,rr,ri
c
c     pr   : exponent real part
c     pi   : exponent imaginary part
c     rr   : result's real part
c     ri   : result's imaginary part
c     ierr : error flag
c            ierr=0 if ok
c            ierr=1 if 0**0
c            ierr=2 if  0**k with k<0
c!origin
c Serge Steer INRIA 1996
c!
c     Copyright INRIA
      integer ierr
      double precision v,pr,pi,sr,si,rr,ri
c     
      ierr=0
c     
      if(pi.eq.0.0d+0) then
c     p real
         call ddpowe(v,pr,rr,ri,ierr,iscmpl)
      else
         if(v.ne.0.0d+0) then
            call wlog(v,0.0d0,sr,si)
            call wmul(sr,si,pr,pi,sr,si)
            sr=exp(sr)
            rr=sr*cos(si)
            ri=sr*sin(si)
         else
            if(pr.gt.0.0d+0) then
               rr=0.0d+0
               ri=0.0d+0
            elseif(pr.lt.0.0d+0) then
               ri=0.0d+0
               rr=infinity(ri)
               ierr=2
            else
               rr=1.0d+0
               ri=0.0d+0
            endif
         endif
      endif
c     
      return
      end
