SHELL = /bin/sh

SCIDIR=../../..
include ../../../Makefile.incl

.SUFFIXES: .gcode .code .ps .epsf .tex .vtex $(SUFFIXES)

TEX = d7-1.tex d7-2.tex d7-3.tex d7-4.tex d7-5.tex d7-6.tex d7-7.tex \
	d7-8.tex d7-9.tex d7-10.tex \
	d7a11.tex d1-14.tex d1-7.tex d6-1.tex d6-2.tex \
	example1.tex example2.tex example3x.tex frame.tex

VTEX = example1.vtex example2.vtex example3.vtex d7-10.vtex d7-8.vtex d7a11.vtex

PS = $(TEX:.tex=.ps)
EPSF = $(TEX:.tex=.epsf)
DIAGS = $(TEX:.tex=.dia)
CODE = $(TEX:.tex=.code)

all::  $(TEX) $(VTEX)

clean::
	$(RM) $(DIAGS)

distclean::
	$(RM) $(DIAGS) $(TEX) $(EPSF) $(PS) $(VTEX)

.gcode.tex:
	@$(RM) x.dat $*.ps $*.ps[0-9]
	@$(SCIDIR)/util/scidoc $(SCIDIR) $*.gcode $*.dia
	@$(RM) $*.dia
	@$(SCIDIR)/util/Blatdocs $* $*.ps[1-4]
	@$(RM) $*.ps[1-4]

.code.tex:
	@if [ -f $*.ps  ]; then	$(RM) $*.ps;fi;
	@if [ -f $*.epsf  ]; then $(RM) $*.epsf;fi;
	@if [ -f x.dat  ]; then $(RM) x.dat;fi;
	@$(SCIDIR)/util/scidoc $(SCIDIR) $*.code $*.dia
	@$(RM) $*.dia
	@$(SCIDIR)/util/Blatdoc 1.0 1.0 $*.ps
	@$(RM)  $*.ps

.gcode.vtex:
#	@echo '\\begin{verbatim}' > begv
	@cat begv $*.gcode > prov
#	@echo '\end{verbatim}' > endv
	@cat prov endv > $*.vtex
	@$(RM) prov
#	@$(RM) begv endv

.code.vtex:
#	@echo '\\begin{verbatim}' > begv
	@cat begv $*.code > prov
#	@echo '\end{verbatim}' > endv
	@cat prov endv > $*.vtex
	@$(RM) prov
#	@$(RM) begv endv
