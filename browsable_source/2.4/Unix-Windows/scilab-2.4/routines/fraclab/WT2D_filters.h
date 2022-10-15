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

/* Bertrand Guiheneuf 1997 */


#ifndef INCLUDE_FILTERS_WT2D
#define INCLUDE_FILTERS_WT2D

#define long_nom_filtre 50 /*longuer des noms de filtres*/
#define long_filtre 50     /*longueur du filtre proprement dit */

#define zero 0.000001

/*****************************************************************************/
/* definition des structures de filtres   oua                                */
/*                                                                           */
/*****************************************************************************/

typedef struct 
{     char nom[long_nom_filtre]; /* nom du filtre  */
      double valeur[long_filtre]; /* valeurs du filtre en flottant */
      int taille;		/* taille effective du filtre */
      int taille_pos;		/* nb de coef non nuls a droite de 0 */
      int taille_neg;		/* nb de coef non nuls a gauche de 0 */
				/* remarque: taill=1+taille_pos+taille_neg */
} t_filtre_WT2D;



/*%%%%%%%%%%%%%%%%%%%% PROTOTYPES %%%%%%%%%%%%%%%%%%%%*/








#ifndef __STDC__
extern void WT2D_calcul_filtre_conjugue();
#else /* __STDC__ */
extern void WT2D_calcul_filtre_conjugue(t_filtre_WT2D *h, t_filtre_WT2D *g);
#endif /* __STDC__ */
/* calcul g a partir de h */

#endif /* INCLUDE_FILTERS */
