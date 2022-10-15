/* Copyright INRIA */

/********************************************* 
 *   Scilab link functions    
 ******************************************/ 

#include <string.h> 
#include <stdio.h>

#include "../graphics/Math.h"
#include "men_Sutils.h"
#include "link.h"


#ifdef __STDC__
#include <stdlib.h>
#else
#include <malloc.h>
#endif

static void Underscores _PARAMS((int isfor,char *ename,char *ename1));
static int SearchFandS  _PARAMS( ( char *,int ));
int LinkStatus _PARAMS((void)) ;
/*********************************************
 * Structure to keep the entry points 
 *********************************************/

#define OK 1
#define FAIL 0


#define ENTRYMAX 200
#define MAXNAME  256 

typedef void (*function) ();

typedef char Name[MAXNAME];   /* could be changed to dynamic structure */

typedef struct { 
  function epoint;            /* the entry point */ 
  Name     name;              /* entry point name */
  int      Nshared;           /* number of the shared file */
} Epoints;

#define TMPL 25

typedef struct {
  int ok;
  char tmp_file[TMPL];
  unsigned long  shl;
} Hd;

static Hd  hd[ENTRYMAX]; /* shared libs handler */
static Nshared  = 0   ;
static Epoints EP[ENTRYMAX];  /* entryPoints */
static NEpoints = 0   ;        /* Number of Linked names */

/** for debug info **/
/** #define DEBUG  **/

/************************************************
 * Link facilities 
 * Interface to work with Scilab 
 * descla,ptrdescla,nvla : string matrix if *iflag == 0 
 * desc,ptrdesc,nv       : string matrix ,
 * string  strf          : "f" OR "c" 
 * ilib                  : integer (out/in value )
 * iflag                 : 0 a string matrix is used 1 ilib is used
 * rhs                   : number of rhs arguments in link(...)
 ************************************************/

void C2F(iscilink)(descla,ptrdescla,nvla,desc,ptrdesc,nv,strf,ilib,iflag,rhs)
     int *desc,*ptrdesc,*nv;         /* files */
     int *descla,*ptrdescla,*nvla;   /* entry points */
     char *strf;
     int *ilib,*iflag,*rhs;                      
{
  int ierr,i;
  char **files,**en_names;
  ierr=0;
  if ( *iflag == 0) 
    {
      ScilabMStr2CM(descla,nvla,ptrdescla,&files,&ierr);
      if ( ierr == 1) return;
      /** for ( i=0 ; i < *nvla ; i++ )
	sciprint("file %d : %s \r\n",i, files[i]); **/
    }
  if ( *rhs >= 2) 
    {
      ScilabMStr2CM(desc,nv,ptrdesc,&en_names,&ierr);
      if ( ierr == 1) return;
      /** for ( i=0 ; i < *nv ; i++ )
	sciprint("name %d : %s \r\n",i, en_names[i]); **/
    }

  SciLinkInit();
  
  if ( *iflag== 0 &&  strncmp(files[0],"show",4)==0) 
    {
      ShowDynLinks();
      *ilib = LinkStatus();  /* return value for Scilab */
      return;
    }

  /** calling the linker **/

  SciLink(*iflag,rhs,ilib,files,en_names,strf);

  if ( *rhs >= 2) 
    {
      for (i=0;i< *nv;i++) FREE(en_names[i]); FREE(en_names);
    }

  if ( *iflag == 0) 
    {
      for (i=0;i< *nvla;i++) FREE(files[i]); FREE(files);
    }
  if (*ilib >= 0) sciprint("Link done\r\n");
}


#if defined(sun) || defined(__alpha) || defined(sgi) || (!defined(hppa_old) && defined(hppa))
#include "link_SYSV.c"
#else
/** no more used on sun */
#if defined(sun_old) ||  defined(mips) || defined(_IBMR2) || defined(hppa_old)
#ifdef SUNOSDLD 
#include "link_linux.c"
#else 
#include "link_std.c"
#endif /* end of SUNOSDLD */
#else
#if defined(linux)
#ifdef __ELF__
#include "link_SYSV.c"
#else
#include "link_linux.c"
#endif /* end of __ELF__ */
#else
#if defined(WIN32)
#include "link_W95.c"
#else
/**
  C2F(dynload)() {cerro("Dynamic link not implemented");}
  C2F(dyncall)() {cerro("Dynamic link not implemented");}
  **/

void SciLink(iflag,rhs,ilib,files,en_names,strf)
     int iflag,*ilib,*rhs;
     char *files[],*en_names[],*strf;
{
  sciprint("Sorry : Dynamic linking is not implemented  \r\n");
}


void C2F(isciulink)(i) 
     integer *i;
{
  sciprint("Sorry : Unlinking is not implemented \r\n");
}

#endif
#endif
#endif 
#endif 

#ifdef WLU
#ifndef DLDLINK
#ifndef WIN32
#define WLU1 /* dld will add the leading _ itself, win32 too*/
#endif 
#endif
#endif 

/********************************************
 * Underscores : deals with the trailing _ 
 * in entry names 
 ********************************************/

static void Underscores(isfor,ename,ename1)
     char ename[],ename1[];
     int isfor;
{
#ifdef WLU1
  *ename1='_'; ename1++;
#endif
  strcpy(ename1,ename);
#ifdef WTU
  if (isfor==1) strcat(ename1,"_");
#endif
  return;
}

/**************************************
 * Initialize tables 
 *************************************/

void SciLinkInit()
{
  static int first_entry = 0;
  int i;
  if ( first_entry == 0)
    {
      
      for ( i = 0 ; i < ENTRYMAX ; i++) 
	{
	  hd[i].ok= FAIL;
	  EP[i].Nshared = -1;
	}
      first_entry++;
    }
}

/**************************************
 * if *irep == -1 
 *    checks if buf is a loaded
 *    entry point 
 *    the result is -1 if false 
 *               or the number in the function table 
 * 
 *    
 * if *irep != -1 : 
 *    checks if buf is a loaded
 *    entry point from shared lib *irep
 *    the result is -1 if false 
 *               or the number in the function table 
 * 
 *************************************/

void C2F(iislink)(buf,irep)
     char *buf;
     integer *irep;
{
  void (*loc)();
  if ( *irep != -1 ) 
    *irep=SearchFandS(buf,*irep);
  else
    *irep=SearchInDynLinks(buf,&loc);
}


/**************************************
 * returns the ii functions 
 *************************************/

void GetDynFunc(ii,realop) 
     void (**realop)();
     int ii;
{
  if ( EP[ii].Nshared != -1 ) 
    *realop = EP[ii].epoint;
  else
    *realop = (function) 0;
}

/**************************************
 * Search a function in the table 
 * Search from end to top 
 *************************************/

int SearchInDynLinks(op,realop) 
     void (**realop)();
     char *op;
{
  int i=0;
  for ( i = NEpoints-1 ; i >=0 ; i--) 
    {
      if ( strcmp(op,EP[i].name) == 0) 
	{
           *realop = EP[i].epoint;
	   return(i);
	 }
    }
  return(-1);
}


/**************************************
 * Search a (function,libid) in the table 
 * Search from end to top 
 *************************************/

static int SearchFandS(op,ilib)
     int ilib;
     char *op;
{
  int i=0;
  for ( i = NEpoints-1 ; i >=0 ; i--) 
    {
      if ( strcmp(op,EP[i].name) == 0 && EP[i].Nshared == ilib)
	{
	   return(i);
	 }
    }
  return(-1);
}

/**************************************
 * Show the linked files 
 *************************************/

void  ShowDynLinks()
{
  int i=0,count=0;
  sciprint("Number of entry points %d\r\n",NEpoints);
  sciprint("Shared libs : [");
  for ( i = 0 ; i < Nshared ; i++) 
    if ( hd[i].ok == OK) { sciprint("%d ",i);count++;}
  sciprint("] : %d libs\r\n",count);
  for ( i = NEpoints-1 ; i >=0 ; i--) 
    {
      sciprint("Entry point %s in shared lib %d\r\n",
	       EP[i].name,EP[i].Nshared);
    }
}
