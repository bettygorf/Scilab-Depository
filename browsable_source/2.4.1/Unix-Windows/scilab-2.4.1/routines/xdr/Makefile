SHELL = /bin/sh
SCIDIR=../..
SCIDIR1=..\..

LIBRARY = $(SCIDIR)/libs/xdr.a
CFLAGS = $(CC_OPTIONS) -I.
FFLAGS = $(FC_OPTIONS)

OBJSC =	xdr.o xdr_array.o xdr_float.o xdr_mem.o \
	xdr_rec.o xdr_reference.o xdr_stdio.o

OBJSF = 

include ../../Makefile.incl
include ../Make.lib

all:: Makefile.mak

Makefile.mak	: Makefile
	$(SCIDIR)/util/Mak2VCMak Makefile


xdr.o: rpc/types.h rpc/xdr.h
xdr_array.o: rpc/types.h rpc/xdr.h
xdr_float.o: rpc/types.h rpc/xdr.h
xdr_mem.o: rpc/types.h rpc/xdr.h
xdr_rec.o: rpc/types.h rpc/xdr.h
xdr_reference.o: rpc/types.h rpc/xdr.h
xdr_stdio.o: rpc/types.h rpc/xdr.h
