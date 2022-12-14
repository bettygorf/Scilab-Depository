#include "stack-c.h"

extern int dblearrayc _PARAMS((double **a, int *m, int *n,int *err));
extern int intarrayc _PARAMS((int **a, int *m, int *n,int *err));
extern int crestrc _PARAMS((char **a, int *m,int *err));

int intex6c(fname)
  char* fname;
{ 
  /** l1,l2,l3 used to store adresses: must be unsigned long **/
  unsigned long l1,l2,l3;

  int m1,n1,m2,n2,m3,n3,ierr=0;
  int minlhs=1, minrhs=0, maxlhs=4, maxrhs=0;

  CheckRhs(minrhs,maxrhs) ;
  CheckLhs(minlhs,maxlhs) ;

  crestrc((char **) &l1, &m1, &ierr);
  intarrayc((int **) &l2, &m2, &n2, &ierr);
  dblearrayc((double **) &l3, &m3, &n3, &ierr);

  if ( ierr > 0 ) 
    {
      sciprint("%s Internal Error",fname); Error(999); return(0);
    }

  n1=1;
  /* Creating variable #1 of type character and dimension m1 x n1 (m1=1) */
  CreateVarFromPtr( 1, "c", &m1, &n1, &l1);
  CreateVarFromPtr( 2, "i", &m2, &n2, &l2);
  CreateVarFromPtr( 3, "d", &m3, &n3, &l3);
  FreePtr(&l1);  FreePtr(&l2);   FreePtr(&l3);

  /* Returning 3 variables (#1, #2, #3) to Scilab  */
  LhsVar(1) = 1;
  LhsVar(2) = 2;
  LhsVar(3) = 3;
  return(0);
}
