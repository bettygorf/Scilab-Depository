      subroutine msgs(n,ierr)
c ======================================================================
c     Base de donnee des messages
c ======================================================================
      include '../stack.h'
      character ch*4,line*140
      integer p,sadr
c
      sadr(l)=(l/2)+1
c     
c     le  message  de numero n correspond a l'etiquette logique 100+n
c     
      goto(101,102,103,104,105,106,107,108,109,110,
     &     111,112,113,114,115,116,117,118,119,120,
     &     121,122,123,124,125,126,127,128,129,130,
     &     131,132,133,134,135,136,137,138,139,140,
     &     141,142,143,144,145,146,147,148,149,150,
     &     151,152,153,154,155,156,157,158,159,160,
     &     161),n
 101  continue
      call  basout(io,wte,' Warning:')
      call basout(io,wte,'  Non convergence in the QZ algorithm.')
      if(ierr.gt.0)then 
         write(buf(1:4),'(i4)') ierr
         call basout(io,wte,'  The top'//buf(1:4)//' x'//buf(1:4)//
     +        ' blocks may not be in generalized Schur form.')
      endif
      goto 9999
 102  continue
      call  basout(io,wte,' Warning:')
      call basout(io,wte,'  Non convergence in QR steps.')
      if(ierr.gt.0)then 
         write(buf(1:4),'(i4)') ierr
         call basout(io,wte,'  The top'//buf(1:4)//' x'//buf(1:4)//
     +        ' block may not be in Schur form.')
      endif
      goto 9999
 103  continue
      call  basout(io,wte,' Warning:')
      call basout(io,wte,'  Non convergence in QR steps.')
      if(ierr.gt.0)then 
         write(buf(1:4),'(i4)') ierr
         call basout(io,wte,'  The first '//buf(1:4)//
     +        ' singular values may be incorrect.')
      endif
      goto 9999 
 104  continue
      call  basout(io,wte,' Warning:')
      call basout(io,wte,'  Non convergence')
      goto 9999
c----------------------------------------------------------------------
c---------------------- message de matlu et matnew---------------------
 105  continue
      call basout(io,wte,' warning')
      call basout(io,wte,
     +     ' matrix is close to singular or badly scaled.')
      call basout(io,wte,
     +              ' results may be inaccurate. rcond ='//buf(1:13))
      goto 9999
 106  continue
      call basout(io,wte,'  Warning.')
      call basout(io,wte,' eigenvectors are badly conditioned.')
      call basout(io,wte,
     +     ' results may be inaccurate. rcond ='//buf(1:13))
      goto 9999
c----------------------------------------------------------------------
c---------------------- message de matopt -----------------------------
 107  continue

      goto 9999
 108  continue
      goto 9999
 109  continue
      goto 9999
 110  continue
      goto 9999
 111  continue
      call basout(io,wte,'  Quapro encounters cycles on degenerate'//
     $     ' point')
      goto 9999
 112  continue
      call basout(io,wte,' norm of projected gradient lower than '//
     &     buf(1:15))
      goto 9999
 113  continue
      call basout(io,wte,
     +     ' at last iteration f decreases by less than '//buf(1:15))
      goto 9999 
 114  continue
      call basout(io,wte,
     &     ' optimization stops because too small variations for x')
      goto 9999
 115  continue
      call basout(io,wte,
     &     'optim stops:  maximum number of calls to f is reached')
      goto 9999
 116  continue
      call basout(io,wte,
     &      'optim stops: maximum number of iterations is reached')
      goto 9999
 117  continue
      call basout(io,wte,
     &     'optim stops: too small variations in gradient direction')
      goto 9999
 118  continue
      call basout(io,wte,
     &     ' stop during calculation of descent direction')
      goto 9999
 119  continue
      call basout(io,wte,
     &     ' stop during calculation of estimated hessian')
      goto 9999
 120  continue
      call basout(io,wte,
     &     ' end of optimization')
      goto 9999
 121  continue
      call basout(io,wte,
     &     ' end of optimization (linear search fails)')
      goto 9999
c----------------------------------------------------------------------
c---------------------- message de  -----------------------------
 122  continue
      call basout(io,wte,' sfact: uncomplete convergence relative'
     $     //' precision reached : 10**('//buf(1:4)//')')
      goto 9999
 123  continue
      call basout(ir,wte,' help file inconsistent...')
      goto 9999
 124  continue
      call basout(io,wte,' Macros files location :'//buf(1:ierr))
      goto 9999
 125  continue
      call basout(io,wte,'    :'//buf(1:ierr))
      goto 9999
 126  continue
      call basout(io,wte, ' pause mode: enter empty lines to continue.')
      goto 9999
 127  continue
      call basout(io,wte,' breakpoints of  macro :'//
     &     buf(1:nlgh))
      goto 9999
 128  continue
      call basout(ir,wte,buf(10:12)//' lines in help')
      goto 9999
 129  continue
      call basout(ir,wte,' sorry, no help for '//buf(1:nlgh))
      goto 9999
 130  continue
      call basout(io,wte,' warning: recursion problem..., cleared')
c      call basout(io,wte,' will be cleared with next error...')
      goto 9999
 131  continue
      call basout(io,wte,' warning: stack problem..., cleared')
c      call basout(io,wte,' will be cleared with next error...')
c      call error(-1)
      goto 9999
 132  continue
      l=nlgh+1
 1321 l=l-1
      if(buf(l:l).eq.' ') goto 1321
      call basout(io,wte,'Stop after row '//buf(nlgh+2:nlgh+6)
     &              //' in macro '//buf(1:l)//' :')
      goto 9999
 133  continue
      goto 9999
 134  continue
      call basout(io,ierr,'real part')
      goto 9999
 135  continue
      call basout(io,ierr,'imaginary part')
      goto 9999
 136  continue
      write(ch,'(i4)') ierr
      call basout(io,wte,' maximum size of buffer : '
     &     //ch//' characters.')
      goto 9999
 137  continue
      call basout(io,wte,
     &  ' rang deficient : rang ='//buf(1:4)//' - tol ='//buf(5:17))
      goto 9999
c----------------------------------------------------------------------
c---------------------- message de comand -----------------------------    
 138  continue
      call basout(io,wte,'your variables are...')
      goto 9999
 139  continue
      call basout(io,wte,' using '//buf(1:7)//
     &     ' elements  out of '//buf(8:14)//'.')
      call basout(io,wte,'          and '//buf(15:21)//
     &     ' variables out of '//buf(22:28))
      goto 9999
 140  continue
      call basout(io,wte,'System functions:')
      goto 9999
 141  continue
      call basout(io,wte,' Commands:')
      goto 9999
 142  continue
      call cvname(ids(1,pt+1),line(1:nlgh),1)
      call basout(io,wte,'Warning :redefining macro: '
     +     //line(1:nlgh))
      p=pt+1
 1421 p=p-1
      if(p.eq.0) goto 9999
      if(rstk(p).ne.502) goto 1421
      k=lpt(1)-(13+nsiz)
c     recherche du nom de la macro correspondant a ce niveau
      lk=sadr(lin(k+6))
      if(lk.le.lstk(top+1)) goto 9999
      km=lin(k+5)-1
 1422 km=km+1
      if(km.gt.isiz)goto 9999
      if(lstk(km).ne.lk) goto 1422
      call cvname(idstk(1,km),line(1:nlgh),1)
      call basout(io,wte,'         inside macro: '//line(1:nlgh))
      goto 9999
 143  continue
      call basout(io,wte,
     $     ' Not enough memory to perform simplification')
      goto 9999
 144  continue
      goto 9999
 145  continue
      goto 9999
 146  continue
      goto 9999
 147  continue
      goto 9999
 148  continue
      goto 9999
 149  continue
      goto 9999
 150  continue
      goto 9999
 151  continue
      goto 9999
 152  continue
      goto 9999
 153  continue
      goto 9999
 154  continue
      goto 9999
 155  continue
      goto 9999
 156  continue
      goto 9999
 157  continue
      goto 9999
 158  continue
      goto 9999
 159  continue
      goto 9999
 160  continue
      call basout(io,wte,
     $     'Warning : loaded file has been created with scilab-1')
      call basout(io,wte,'          please update it !')
 161  continue
      call cvname(ids(1,pt+1),line(1:nlgh),1)
      call basout(io,wte,
     $     'Warning : Impossible to load variable '//line(1:nlgh))

      goto 9999
c     
 9999 continue
      call basout(io,wte,' ')
      return
      end
