      subroutine matdsr
c
c ====================================================================
c
c     evaluate functions involving eigenvalues and eigenvectors
c
c ====================================================================
c
      include '../stack.h'
c
      double precision sr,t,rmax
      double precision eps
      logical herm,vect,fail,chain,macro
      external fschur,bschur
      integer top2,tope,topf
      character*6 namef
      common/cschur/namef
c
      sadr(l)=(l/2)+1
      iadr(l)=l+l-1
c
      if (ddt .eq. 4) then
         write(buf(1:4),'(i4)') fin
         call basout(io,wte,' matdsr '//buf(1:4))
      endif
c
c     functions/fin
c        1       2       3       4       5       6       7       8
c     0 hess    schur  spectre  bdiag         balanc

      if(top+lhs-rhs.ge.bot) then
         call error(18)
         return
      endif
      if(rhs.le.0) then
         call error(39)
         return
      endif
c
      lw=lstk(top+1)
      eps=stk(leps)
      tope=top-rhs+1
      if (istk(iadr(lstk(tope))).ne.1) then
         err=1
         call error(53)
         return
      endif
c
      if(fin.eq.6) goto 310
c
      ireg=0
      vect=(lhs.ge.2.and.fin.ne.3)
      if (rhs .eq. 1) goto 05
      il=iadr(lstk(top))
      mn2=istk(il+1)*istk(il+2)
      if(istk(il).eq.10.or .istk(il).eq.11 .or. istk(il).eq.13) goto 1
      if(istk(il).ne.1) then
         err=rhs
         call error(44)
         return
      endif
      it2=istk(il+3)
      l2=sadr(il+4)
      top=top-1
      goto 5
 01   continue
c schur ordonne
      ireg=1
      if(lhs.ne.2.and.lhs.ne.3) then
         call error(41)
         return
      endif
      chain=.false.
      macro=.false.
      top2=top
      topf=top-rhs+lhs
c      
      if (istk(il).gt.10) then
         macro=.true.
      else
         chain=.true.
         nc=istk(il+5)-1
         namef=' '
         call cvstr(nc,istk(il+5+mn2),namef,1)
         top=top-1
      endif
 05   continue
c acquisition des parametre de la matrice
      il=iadr(lstk(tope))
      m=istk(il+1)
      n=istk(il+2)
      l=sadr(il+4)
      mn=m*n
      if(mn.ne.0) goto 06
c     matrice de taille nulle
      if(fin.ne.3.or.lhs.gt.1) then
         err=1
         call error(89)
         return
      endif
      top=tope
      return
c
c test si la matrice est carree
c
 06   ld=l
      if(m.ne.n) then
         err=1
         call error(20)
         return
      endif
      nn=n*n
c
      if(fin.eq.4) goto 200
c
c ... decomposition spectrale de la matrice
c
c la matrice est-elle symetrique?
c
      herm=.false.
      if(ireg.ne.0) goto 21
      do 20 j=1,n
         do 19 i=1,j
            ls=l+(i-1)+(j-1)*n
            ll=l+(i-1)*n+(j-1)
            sr=stk(ll)-stk(ls)
            if(stk(ll)+sr.ne.stk(ll)) goto 21
 19      continue
 20   continue
      herm=.true.
 21   continue
      if(herm) goto 100
c
      if(fin.gt.3) goto 900
c
c equilibrage
c
      low=1
      igh=n
      if(fin.ne.3) goto 22
      err=lw+n-lstk(bot)
      if(err.gt.0) then
         call error(17)
         return
      endif
      call balanc(n,n,stk(l),low,igh,stk(lw))
c
c calcul de la forme de hessenberg
c
 22   lv=l
      if(vect) l=lw
      if(lhs.eq.3) then
c     on cree la  variable d
         top=top+1
         ild=iadr(lstk(top))
         istk(ild)=1
         istk(ild+1)=1
         istk(ild+2)=1
         istk(ild+3)=0
         ld=sadr(ild+4)
         lstk(top+1)=ld+1
      endif
      if(lhs.gt.1) then
c     on cree la  variable s
         top=top+1
         il=iadr(lstk(top))
         istk(il)=1
         istk(il+1)=n
         istk(il+2)=n
         istk(il+3)=0
         l=sadr(il+4)
         lstk(top+1)=l+nn
      endif
c
      lw=l+nn
      err=lw+n-lstk(bot)
      if(err.gt.0) then
         call error(17)
         return
      endif
      if(vect) call dcopy(nn,stk(lv),1,stk(l),1)
      call orthes(n,n,low,igh,stk(l),stk(lw))
      if(vect) call ortran(n,n,low,igh,stk(l),stk(lw),stk(lv))
      if(fin.ne.1) goto 40
c fin hess
      if(n.ge.3) then
         do 30 j=3,n
            call dset(j-2,0.0d+0,stk(l+j-1),n)
 30      continue
      endif
      goto 999
c
c calcul de la forme de schur
c
 40   job=10
      if(vect) job=11
      lsr=lw
      lsi=lw
      if(fin.eq.3 ) then
         job=job+10
         lsi=lsr+n
      endif
      err=lsi+n-lstk(bot)
      if(err.gt.0) then
         call error(17)
         return
      endif
      call hqror2(n,n,low,igh,stk(l),stk(lsr),stk(lsi),
     $     stk(lv),ierr,job)
c
      if (ierr.gt.1) call msgs(2,ierr)
c
      if(ireg.eq.0) goto 42
c
c schur ordonne
c
      if(chain) then
         call inva(n,n,stk(l),stk(lv),fschur,eps,ndim,
     1        fail,stk(lw))
      elseif(macro) then
c     on ferme le tableau de travail...
         lwn=lw+n
         err=lwn-lstk(bot)
         if(err.gt.0) then
            call error(17)
            return
         endif
         lstk(top+1)=lwn
c     creation d'une variable bidon de type scalaire pour stockage de la
c     valeur retournee par l'external
         top=top+1
         il9=iadr(lstk(top))
         istk(il9)=1
         istk(il9+1)=3
         istk(il9+2)=1
         istk(il9+3)=0
         lvar=sadr(il9+4)
         kvtop=top
         lstk(top+1)=lvar+3
c     creation d'une structure pour l'external
         top=top+1
         ilw=iadr(lstk(top))
         istk(ilw)=1
         istk(ilw+1)=ilw+2
         istk(ilw+2)=top2
         istk(ilw+3)=kvtop
         lstk(top+1)=lstk(top)+3
         call inva(n,n,stk(l),stk(lv),bschur,eps,ndim,
     1        fail,stk(lw))
         top=top-3
      endif
      if (fail) then
         call msgs(2,0)
         call error(24)
         return
      endif
      if(n.ge.3) then
         do 41 i=3,n
            call dset(i-2,0.0d+0,stk(l-1+i),n)
 41      continue
      endif
      if(lhs.eq.2) then
         il=iadr(lstk(top))
         istk(il)=1
         istk(il+1)=1
         istk(il+2)=1
         istk(il+3)=0
         l=sadr(il+4)
         stk(l)=dble(ndim)
         lstk(top+1)=l+1
      elseif(lhs.eq.3) then
         stk(ld)=dble(ndim)
      endif
      goto 999
c
 42   continue
      if(fin.eq.3) goto 44
c fin schur
      if(lhs.gt.2) then
         call error(41)
         return
      endif
      if(n.ge.3) then
         do 43 i=3,n
            call dset(i-2,0.0d+0,stk(l-1+i),n)
 43      continue
      endif
      goto 999
c
 44   continue
c fin spectre et root
      if(lhs.ne.1) then
         call error(41)
         return
      endif
      call dcopy(2*n,stk(lsr),1,stk(l),1)
      istk(il+1)=n
      istk(il+2)=1
      istk(il+3)=1
      lstk(top+1)=l+2*n
      goto 999
c
c fin cas general
c cas d'une matrice hermitienne
 100  continue
c calcul de la forme de hessenberg(tridagonale)
      lv=l
      l1=l
      if(vect) l=lw
      if(lhs.eq.1) goto 101
c     on cree une variable
      top=top+1
      il=iadr(lstk(top))
      istk(il)=1
      istk(il+1)=n
      istk(il+2)=n
      istk(il+3)=0
      l=sadr(il+4)
      lstk(top+1)=l+nn
c
 101  ld=l+nn
      le=ld+n
      err=le+n-lstk(bot)
      if(err.gt.0) then
         call error(17)
         return
      endif
      call tred2(n,n,stk(l1),stk(ld),stk(le),stk(lv))
      if(fin.ne.1) goto 120
c fin hess
      call dset(nn,0.0d+0,stk(l),1)
      call dcopy(n,stk(ld),1,stk(l),n+1)
      if(n.le.1) goto 999
      call dcopy(n-1,stk(le+1),1,stk(l+1),n+1)
      call dcopy(n-1,stk(le+1),1,stk(l+n),n+1)
      goto 999
c
c calcul de la forme diagonale
 120  continue
      call tql2(n,n,stk(ld),stk(le),stk(lv),ierr)
c
      if (ierr.gt.1) call msgs(2,ierr)
      mn=n
c
      if(fin.eq.3) goto 121
c
c fin schur , jordan et bdiag
      call dset(nn,0.0d+0,stk(l),1)
      call dcopy(n,stk(ld),1,stk(l),n+1)
      goto 999
c
 121  continue
c fin spectre
      call dcopy(n,stk(ld),1,stk(l),1)
      istk(il+1)=n
      istk(il+2)=1
      lstk(top+1)=l+n
      goto 999
c
c     bloc diagonalisation
c
 200  continue
      if(rhs.gt.2) then
         call error(39)
         return
      endif
      if(rhs.eq.1) goto 201
c     rmax est en argument
      rmax=stk(l2)
      if(it2.eq.1) then
         err=1
         call error(52)
         return
      endif
      goto 202
c     calcul de rmax par defaut:norme l1
 201  rmax=1.0d+0
      lj=l-1
      do 203 j=1,n
         t=0.0d+0
         do 204 i=1,n
            t=t+abs(stk(lj+i))
 204     continue
         if(t.gt.rmax) rmax=t
         lj=lj+n
 203  continue
 202  continue
c     preparation de la pile
      top=top+1
c
c     changement de base
      ilx=iadr(lstk(top))
      istk(ilx)=1
      istk(ilx+1)=n
      istk(ilx+2)=n
      istk(ilx+3)=0
      lx=sadr(ilx+4)
      lstk(top+1)=lx+nn
c     structure des blocs
      top=top+1
      ilbs=iadr(lstk(top))
      lbs=sadr(ilbs+4)
c     er,ei:valeurs propres (tbl de travail)
      ler=lbs+n
      lei=ler+n
      ilb=iadr(lei+n)
      lw=sadr(ilb+n)
      err=lw+n-lstk(bot)
      if(err.gt.0) then
         call error(17)
         return
      endif
      call bdiag(n,n,stk(l),0.d0,rmax,stk(ler),stk(lei)
     x     ,istk(ilb),stk(lx),t,stk(lw),0,fail)
c
      if (fail) then
         call msgs(2,0)
         call error(24)
         return
      endif
c
c     sorties
c structure des blocs
      nbloc=0
      ln=lbs-1
      do 222 k=1,n
         if(istk(ilb+k-1).lt.0) goto 222
         nbloc=nbloc+1
         ln=ln+1
         stk(ln)=dble(istk(ilb+k-1))
 222  continue
      lstk(top+1)=sadr(ilbs+4)+nbloc
      istk(ilbs)=1
      istk(ilbs+1)=nbloc
      istk(ilbs+2)=1
      istk(ilbs+3)=0
      if(lhs.eq.2) top=top-1
      if(lhs.eq.1) top=top-2
      goto 999
c
c equilibrage (balanc)
c
 310  continue
      if(lhs.ne.2) then
         call error(41)
         return
      endif
      if(rhs.ne.1) then
         call error(42)
         return
      endif
      il=iadr(lstk(top))
      m=istk(il+1)
      n=istk(il+2)
      l=sadr(il+4)
c     test si la matrice est carree
      if(m.ne.n) then
         err=1
         call error(20)
         return
      endif
      nn=n*n
      if(nn.eq.0) then
         err=1
         call error(89)
         return
      endif
c     equilibrage
      low=1
      igh=n
      ilv=iadr(lw)
      lv=sadr(ilv+4)
      lw=lv+nn
      err=lw+n-lstk(bot)
      if(err.gt.0) then
         call error(17)
         return
      endif
      call balanc(n,n,stk(l),low,igh,stk(lw))
      call dset(nn,0.0d+0,stk(lv),1)
      call dset(n,1.0d+0,stk(lv),n+1)
      call balbak(n,n,low,igh,stk(lw),n,stk(lv))
      istk(ilv)=1
      istk(ilv+1)=n
      istk(ilv+2)=n
      istk(ilv+3)=0
      top=top+1
      lstk(top+1)=lv+nn
      goto 999
c
 999  return
 900  call error(43)
      return
      end
