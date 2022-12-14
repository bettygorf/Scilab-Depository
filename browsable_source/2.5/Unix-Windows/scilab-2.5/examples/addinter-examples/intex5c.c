#include "stack-c.h"

extern int crestrc _PARAMS((char **a, int *m,int *err));

/*      Creating a scilab variable from a pointer
       l1 is a pointer to a char array created 
       by the C function crestrc (in file pgmsc.c)   */

int intex5c(fname)
  char* fname;
{ 
  /** l1 is used to store adresses it must be an unsigned long **/
  unsigned long l1;
  int m1,n1,ierr=0;
  static int minlhs=1, minrhs=0, maxlhs=1, maxrhs=0;

  CheckRhs(minrhs,maxrhs);
  CheckLhs(minlhs,maxlhs);

  crestrc((char **) &l1,&m1,&ierr);
  if ( ierr > 0 ) 
    {
      sciprint("%s Internal Error",fname); Error(999); return(0);
    }

  n1=1;
  CreateVarFromPtr( 1, "c", &m1, &n1, &l1);
  FreePtr(&l1);
  LhsVar(1) = 1;
  return(0);
}
