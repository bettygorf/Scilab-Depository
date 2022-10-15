/* This Software is ( Copyright INRIA . 1998  1 )                    */
/*                                                                   */
/* INRIA  holds all the ownership rights on the Software.            */
/* The scientific community is asked to use the SOFTWARE             */
/* in order to test and evaluate it.                                 */
/*                                                                   */
/* INRIA freely grants the right to use modify the Software,         */
/* integrate it in another Software.                                 */
/* Any use or reproduction of this Software to obtain profit or      */
/* for commercial ends being subject to obtaining the prior express  */
/* authorization of INRIA.                                           */
/*                                                                   */
/* INRIA authorizes any reproduction of this Software.               */
/*                                                                   */
/*    - in limits defined in clauses 9 and 10 of the Berne           */
/*    agreement for the protection of literary and artistic works    */
/*    respectively specify in their paragraphs 2 and 3 authorizing   */
/*    only the reproduction and quoting of works on the condition    */
/*    that :                                                         */
/*                                                                   */
/*    - "this reproduction does not adversely affect the normal      */
/*    exploitation of the work or cause any unjustified prejudice    */
/*    to the legitimate interests of the author".                    */
/*                                                                   */
/*    - that the quotations given by way of illustration and/or      */
/*    tuition conform to the proper uses and that it mentions        */
/*    the source and name of the author if this name features        */
/*    in the source",                                                */
/*                                                                   */
/*    - under the condition that this file is included with          */
/*    any reproduction.                                              */
/*                                                                   */
/* Any commercial use made without obtaining the prior express       */
/* agreement of INRIA would therefore constitute a fraudulent        */
/* imitation.                                                        */
/*                                                                   */
/* The Software beeing currently developed, INRIA is assuming no     */
/* liability, and should not be responsible, in any manner or any    */
/* case, for any direct or indirect dammages sustained by the user.  */
/*                                                                   */
/* Any user of the software shall notify at INRIA any comments       */
/* concerning the use of the Sofware (e-mail : FracLab@inria.fr)     */
/*                                                                   */
/* This file is part of FracLab, a Fractal Analysis Software         */



#include "C-LAB_Interf.h"


#include <math.h>
#include <stdio.h>
#include "gif.h"
#include "imgif_const.h"


#ifndef PI
#define PI 3.1415926515
#endif
#ifndef NULL
#define NULL 0
#endif 

void LAB_readgif()

{
  /* Input */
  Matrix *MimageName;
  char *imageName;
  
  /* Output */
  
  Matrix *MoutImage;
  double *outImage;

  Matrix *MColormap;
  double *Colormap;

  
  /* Work */
  struct extimage *nfgif; 
  int ImageM;
  int ImageN;
  int ImageSize;
  int ImageNbColor;
  int i,j;
  
  MimageName = (Matrix *)(Interf.Param[0]);
  if (!(MatrixIsString(MimageName)) )
	{
	  InterfError("readgif : the image name must be a string\n");
	  return;
	}
  imageName = (char *)MatrixReadString(MimageName);
  nfgif = (struct extimage *)opengif(imageName);
  free(imageName);
  if (!nfgif) return;

  ImageM=nfgif->dimy;
  ImageN=nfgif->dimx;
  ImageSize=nfgif->size;
  ImageNbColor=nfgif->numcols;

  
  readgif(&nfgif);

  MoutImage = (Matrix *)MatrixCreate(ImageM, ImageN, "real");
  outImage = MatrixGetPr(MoutImage);
  
  for (i=0; i<ImageM; i++)
    for (j=0; j<ImageN; j++)
      outImage[j*ImageM+i]=(double)( nfgif->data[i*ImageN+j] );
  

  MColormap =  (Matrix *)MatrixCreate(ImageNbColor,3, "real");
  Colormap = MatrixGetPr(MColormap);

  for (i=0; i<ImageNbColor; i++)
    {
      Colormap[i] = (double)nfgif->rbuf[i];
      Colormap[i+ImageNbColor] = (double)nfgif->gbuf[i];
      Colormap[i+2*ImageNbColor] = (double)nfgif->bbuf[i];
    }

  ReturnParam(MoutImage);
  ReturnParam(MColormap);
}








