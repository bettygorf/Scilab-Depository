#include "stack-c.h"

/** external functions to be called through this interface **/

extern int f99 _PARAMS((double *,double *,int*, int *,int *,int *));

int intex13c(fname) 
     char *fname;
{
  int i1, i2;
  static int ierr;
  static int lr1,lc1,it1,m1, n1;
  static int minlhs=1, minrhs=1, maxlhs=1, maxrhs=1;

  CheckRhs(minrhs,maxrhs) ;
  CheckLhs(minlhs,maxlhs) ;

  GetRhsCVar(1, "d", &it1, &m1, &n1, &lr1,&lc1);
  
  f99(stk(lr1), stk(lc1), &it1, &m1, &n1, &ierr);
  
  if (ierr > 0) 
    {
      sciprint("Internal Error");
      Error(999);
      return 0;
    }
  LhsVar(1) = 1;
  return 0;
}

#ifdef __STDC__
#include <stdlib.h>
#else
#include <malloc.h>
#endif

#include <string.h> 
#include <stdio.h>

int f99( ar,ac, ita,ma,na,err) 
     int *ma,*na,*ita,*err;
     double *ar,*ac;
{
  int i;
  *err=0;
  for ( i= 0 ; i < (*ma)*(*na) ; i++) ar[i] = 2*ar[i] ;
  if ( *ita == 1) 
    for ( i= 0 ; i < (*ma)*(*na) ; i++) ac[i] = 3*ac[i] ;
  return(0);
}
