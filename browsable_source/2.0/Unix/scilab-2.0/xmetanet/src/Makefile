# Makefile generated by imake - do not edit!
# $XConsortium: imake.c,v 1.65 91/07/25 17:50:17 rws Exp $

# -------------------------------------------------------------------------
# Makefile generated from "Imake.tmpl" and <Imakefile>
# $XConsortium: Imake.tmpl,v 1.139 91/09/16 08:52:48 rws Exp $
#
# From the Alpha Imakefile
# Platform-specific parameters may be set in the appropriate <vendor>.cf
# configuration files.  Site-specific parameters should be set in the file
# site.def.  Full rebuilds are recommended if any parameters are changed.
#
# If your C preprocessor does not define any unique symbols, you will need
# to set BOOTSTRAPCFLAGS when rebuilding imake (usually when doing
# "make World" the first time).
#

# -------------------------------------------------------------------------
# site-specific configuration parameters that need to come before
# the platform-specific parameters - edit site.def to change

# site:  $XConsortium: site.def,v 1.2 91/07/30 20:26:44 rws Exp $

# -------------------------------------------------------------------------
# platform-specific configuration parameters - edit osf1.cf to change

# platform: osf1.cf

# Operating system:  1/1 1.3

   	SHAREDSWITCH =

#  Using 1 shared library rules

# -------------------------------------------------------------------------
# site-specific configuration parameters that go after
# the platform-specific parameters - edit site.def to change

# site:  $XConsortium: site.def,v 1.2 91/07/30 20:26:44 rws Exp $

            SHELL = /bin/sh

              TOP = ../../.
      CURRENT_DIR = ./xmetanet/src

               AR = ar cqls
            LOCAR = ar clq
  BOOTSTRAPCFLAGS =
               CC = cc $(SHAREDSWITCH)
            LOCCC = cc
               AS = as

         COMPRESS = compress
              CPP = /lib/cpp $(STD_CPP_DEFINES)
    PREPROCESSCMD = cc $(SHAREDSWITCH) -E $(STD_CPP_DEFINES)
          INSTALL = /usr/bin/X11/install.sh
               LD = ld
             LINT = lint
      LINTLIBFLAG = -o
         LINTOPTS = -ax
               LN = ln -s
             MAKE = make
               MV = mv
               CP = cp

               RM = rm -f
            TROFF = psroff
         MSMACROS = -ms
              TBL = tbl
              EQN = eqn
     STD_INCLUDES =
  LOCSTD_INCLUDES =
  STD_CPP_DEFINES = -DDEC -DR5_XLIB -DSMT
      STD_DEFINES = -DDEC -DR5_XLIB -DSMT
 EXTRA_LOAD_FLAGS =
  EXTRA_LIBRARIES =
 LOCEXTRA_LIBRARIES =
             TAGS = ctags

    SHAREDCODEDEF = -DSHAREDCODE
         SHLIBDEF =

    PROTO_DEFINES = -DFUNCPROTO=3

     INSTPGMFLAGS =

     INSTBINFLAGS = -m 0755
     INSTUIDFLAGS = -m 4755
     INSTLIBFLAGS = -m 0644
     INSTINCFLAGS = -m 0444
     INSTMANFLAGS = -m 0444
     INSTDATFLAGS = -m 0444
    INSTKMEMFLAGS = -m 4755

      CDEBUGFLAGS = -O2
        CCOPTIONS =
     LOCCCOPTIONS =

      ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(STD_INCLUDES)
   LOCALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES) $(TOP_INCLUDES) $(LOCSTD_INCLUDES)
       ALLDEFINES = $(ALLINCLUDES) $(STD_DEFINES) $(EXTRA_DEFINES) $(PROTO_DEFINES) $(DEFINES)
    LOCALLDEFINES = $(LOCALLINCLUDES) $(STD_DEFINES) $(EXTRA_DEFINES) $(PROTO_DEFINES) $(DEFINES)
           CFLAGS = $(CDEBUGFLAGS) $(CCOPTIONS) $(ALLDEFINES)
        LOCCFLAGS = $(CDEBUGFLAGS) $(LOCCCOPTIONS) $(LOCALLDEFINES)
        LINTFLAGS = $(LINTOPTS) -DLINT $(ALLDEFINES)

           LDLIBS = $(SYS_LIBRARIES) $(EXTRA_LIBRARIES)

        LOCLDLIBS = $(SYS_LIBRARIES) $(LOCEXTRA_LIBRARIES)

        LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS) $(LOCAL_LDFLAGS)

     LOCLDOPTIONS = $(CDEBUGFLAGS) $(LOCCCOPTIONS) $(LOCAL_LDFLAGS)

   LDCOMBINEFLAGS = -X -r
      DEPENDFLAGS = -D__alpha  -D__osf__ -I -I$(CROSSBASE)/usr/include

        MACROFILE = osf1.cf
           RM_CMD = $(RM) *.CKP *.ln *.BAK *.bak *.o core errs ,* *~ *.a .emacs_* tags TAGS make.log MakeOut

    IMAKE_DEFINES =

         IRULESRC = $(CONFIGDIR)
        IMAKE_CMD = $(IMAKE) -DUseInstalled -I$(IRULESRC) $(IMAKE_DEFINES)

     ICONFIGFILES = $(IRULESRC)/Imake.tmpl $(IRULESRC)/Imake.rules \
			$(IRULESRC)/Project.tmpl $(IRULESRC)/site.def \
			$(IRULESRC)/$(MACROFILE) $(EXTRA_ICONFIGFILES)

# -------------------------------------------------------------------------
# X Window System Build Parameters
# $XConsortium: Project.tmpl,v 1.142 92/01/25 16:44:02 rws Exp $

# -------------------------------------------------------------------------
# X Window System make variables; this need to be coordinated with rules

          PATHSEP = /
        USRLIBDIR = /usr/lib
           BINDIR = /usr/bin/X11
          INCROOT = /usr/include
     BUILDINCROOT = $(TOP)
      BUILDINCDIR = $(BUILDINCROOT)/X11
      BUILDINCTOP = ..
           INCDIR = $(INCROOT)/X11
           ADMDIR = /usr/adm
           LIBDIR = $(USRLIBDIR)/X11
        CONFIGDIR = $(LIBDIR)/config
       LINTLIBDIR = $(USRLIBDIR)/lint

          FONTDIR = $(LIBDIR)/fonts
         XINITDIR = $(LIBDIR)/xinit
           XDMDIR = $(LIBDIR)/xdm
           TWMDIR = $(LIBDIR)/twm
          MANPATH = /usr/man
    MANSOURCEPATH = $(MANPATH)/man
        MANSUFFIX = n
     LIBMANSUFFIX = 3
           MANDIR = $(MANSOURCEPATH)$(MANSUFFIX)
        LIBMANDIR = $(MANSOURCEPATH)$(LIBMANSUFFIX)
           NLSDIR = $(LIBDIR)/nls
        PEXAPIDIR = $(LIBDIR)/PEX
      XAPPLOADDIR = $(LIBDIR)/app-defaults
       FONTCFLAGS = -t

     INSTAPPFLAGS = $(INSTDATFLAGS)

            IMAKE = imake
           DEPEND = makedepend
              RGB = rgb

            FONTC = bdftopcf

        MKFONTDIR = mkfontdir
        MKDIRHIER = /bin/sh $(BINDIR)/mkdirhier

        CONFIGSRC = $(TOP)/config
       DOCUTILSRC = $(TOP)/doc/util
        CLIENTSRC = $(TOP)/clients
          DEMOSRC = $(TOP)/demos
           LIBSRC = $(TOP)/lib
          FONTSRC = $(TOP)/fonts
       INCLUDESRC = $(TOP)/X11
        SERVERSRC = $(TOP)/server
          UTILSRC = $(TOP)/util
        SCRIPTSRC = $(UTILSRC)/scripts
       EXAMPLESRC = $(TOP)/examples
       CONTRIBSRC = $(TOP)/../contrib
           DOCSRC = $(TOP)/doc
           RGBSRC = $(TOP)/rgb
        DEPENDSRC = $(UTILSRC)/makedepend
         IMAKESRC = $(CONFIGSRC)
         XAUTHSRC = $(LIBSRC)/Xau
          XLIBSRC = $(LIBSRC)/X
           XMUSRC = $(LIBSRC)/Xmu
       TOOLKITSRC = $(LIBSRC)/Xt
       AWIDGETSRC = $(LIBSRC)/Xaw
       OLDXLIBSRC = $(LIBSRC)/oldX
      XDMCPLIBSRC = $(LIBSRC)/Xdmcp

      BDFTOPCFSRC = $(FONTSRC)/clients/bdftopcf

     MKFONTDIRSRC = $(FONTSRC)/clients/mkfontdir
         FSLIBSRC = $(FONTSRC)/lib/fs
    FONTSERVERSRC = $(FONTSRC)/server
     EXTENSIONSRC = $(TOP)/extensions
         XILIBSRC = $(EXTENSIONSRC)/lib/xinput
      XTESTLIBSRC = $(EXTENSIONSRC)/lib/xtest
      XTRAPLIBSRC = $(EXTENSIONSRC)/lib/xtrap
      PHIGSLIBSRC = $(EXTENSIONSRC)/lib/PEX

      USRSHLIBDIR = /usr/shlib

       SHLIBFLAGS = -check_registry $(CROSSBASE)/usr/shlib/so_locations 	-L$(CROSSBASE)/usr/shlib -L$(CROSSBASE)/usr/ccs/lib

  DEPEXTENSIONLIB = $(USRSHLIBDIR)/libXext.so
     EXTENSIONLIB = -lXext

          DEPXLIB = $(DEPEXTENSIONLIB) $(USRSHLIBDIR)/libX11.so
             XLIB = -lXext -lX11

        DEPXMULIB = $(USRSHLIBDIR)/libXmu.so
           XMULIB = -lXmu

       DEPOLDXLIB = $(USRSHLIBDIR)/liboldX.so
          OLDXLIB = -loldX

      DEPXTOOLLIB = $(USRSHLIBDIR)/libXt.so
         XTOOLLIB = -lXt

        DEPXAWLIB = $(USRSHLIBDIR)/libXaw.so
           XAWLIB = -lXaw

        DEPXILIB = $(USRSHLIBDIR)/libXi.a
           XILIB = -lXi

          DNETLIB = -ldnet_stub

        SOXLIBREV = SharedXlibRev
          SOXTREV = SharedXtRev
         SOXAWREV = SharedXawRev
        SOOLDXREV = SharedOldXRev
         SOXMUREV = SharedXmuRev
        SOXEXTREV = SharedXextRev
      SOXINPUTREV = SharedXinputRev
       SOXTESTREV = SharedXTestRev
       SOXTRAPREV = SharedXTrapRev

      DEPXAUTHLIB = $(USRLIBDIR)/libXau.a
         XAUTHLIB = 			 -lXau
      DEPXDMCPLIB = $(USRLIBDIR)/libXdmcp.a
         XDMCPLIB = 			 -lXdmcp

     DEPXTESTLIB = $(USRLIBDIR)/libXtst.a
        XTESTLIB = 			 -lXtst

     DEPXTRAPLIB = $(USRLIBDIR)/libXTrap.a
        XTRAPLIB = 			 -lXTrap

        DEPPHIGSLIB = $(USRLIBDIR)/libphigs.a
           PHIGSLIB = 			 -lphigs

       DEPXBSDLIB = $(USRLIBDIR)/libXbsd.a
          XBSDLIB = 			 -lXbsd

 LINTEXTENSIONLIB = $(LINTLIBDIR)/llib-lXext.ln
         LINTXLIB = $(LINTLIBDIR)/llib-lX11.ln
          LINTXMU = $(LINTLIBDIR)/llib-lXmu.ln
        LINTXTOOL = $(LINTLIBDIR)/llib-lXt.ln
          LINTXAW = $(LINTLIBDIR)/llib-lXaw.ln
           LINTXI = $(LINTLIBDIR)/llib-lXi.ln
        LINTPHIGS = $(LINTLIBDIR)/llib-lphigs.ln

       DEPXBSDLIB = $(USRLIBDIR)/libXbsd.a
          XBSDLIB = 			 -lXbsd

          DEPLIBS = $(DEPXAWLIB) $(DEPXMULIB) $(DEPXTOOLLIB) $(DEPXLIB)

         DEPLIBS1 = $(DEPLIBS)
         DEPLIBS2 = $(DEPLIBS)
         DEPLIBS3 = $(DEPLIBS)

       UILFLAGS =
        MLIBSRC = $(TOP)/motif/lib
          XMSRC = $(MLIBSRC)/Xm
         LINTXM = $(USRLIBDIR)/llib-lXm.ln
      USRINCDIR = $(INCDIR)
        TESTSRC = $(TOP)/tests
    MTOOLKITSRC = $(LIBSRC)/Xt
     MWIDGETSRC = $(MLIBSRC)/Xm
   MRESOURCESRC = $(MLIBSRC)/Mrm
     MCLIENTSRC = $(TOP)/motif/clients
         UILSRC = $(MCLIENTSRC)/uil

            UIL = uil

     INSTALLLIB = $(DESTDIR)/usr/lib
   INSTALLSHLIB = $(DESTDIR)/usr/shlib

        DEPXMLIB = $(USRSHLIBDIR)/libXm.so
           XMLIB = -lXm

DEPMRESOURCELIB = $(USRSHLIBDIR)/libMrm.so
   MRESOURCELIB = -lMrm

    UILINCLUDES =

         UILLIB = $(UILSRC)/libUil.a
LINTXMWIDGETLIB = $(MWIDGETSRC)/llib-l/Xm.ln
     LINTXMTOOL = $(MTOOLKITSRC)/llib-lXt.ln
     LINTUILLIB = $(UILSRC)/llib-lUil.ln

# -------------------------------------------------------------------------
# DEC-Specific System Build Parameters

          HELPDIR = $(LIBDIR)/help
           UIDDIR = $(LIBDIR)/uid
           CDADIR = $(USRLIBDIR)/cda

           DXMSRC = $(MLIBSRC)/DXm
           DPSSRC = $(EXTENSIONSRC)/DPS/lib/dps
         DPSTKSRC = $(EXTENSIONSRC)/DPS/lib/dpstk
         PSRESSRC = $(EXTENSIONSRC)/DPS/lib/psres
           XIESRC = $(EXTENSIONSRC)/lib/xie
           IDSSRC = $(MLIBSRC)/ids
           BKRSRC = $(MLIBSRC)/bkr
        DWI18NSRC = $(MLIBSRC)/dwi18n
           LWKSRC = $(MLIBSRC)/lwk
           DVRSRC = $(MLIBSRC)/dvr

       DEPDXMLIB = $(USRSHLIBDIR)/libDXm.so
          DXMLIB = -lDXm

        DEPDPSLIB = $(USRSHLIBDIR)/libdps.so
           DPSLIB = -ldps

      DEPDPSTKLIB = $(USRSHLIBDIR)/libdpstk.so
         DPSTKLIB = -ldpstk

        DEPPSRESLIB = $(USRSHLIBDIR)/libpsres.so
           PSRESLIB = -lpsres

        DEPXIELIB = $(USRLIBDIR)/libXie.a
           XIELIB = 			 -lXie

        DEPIDSLIB = $(USRSHLIBDIR)/libids.so
           IDSLIB = -lids

        DEPBKRLIB = $(USRSHLIBDIR)/libbkr.so
           BKRLIB = -lbkr

        DEPDWI18NLIB = $(USRLIBDIR)/libdwi18n.a
           DWI18NLIB = 			 -ldwi18n

        DEPLWKLIB = $(USRSHLIBDIR)/liblwkdxm.so
           LWKLIB = -llwkdxm

        DEPDVRLIB = $(USRSHLIBDIR)/libdvr.so
           DVRLIB = -ldvr

        DEPIMGLIB =
        DEPIPSLIB =
        DEPCHFLIB =
        DEPCDALIB =
        DEPDVSLIB =

    DEPIDS_NOXLIB =

           IMGLIB = -limg
           IPSLIB = -lips
           CHFLIB = -lchf
           CDALIB = -lcda
       IDS_NOXLIB = -lids_nox
           DVSLIB = -ldvs

     DEBUGUSRLIBDIR=/usr/debugshlib

# -------------------------------------------------------------------------
# Imake rules for building libraries, programs, scripts, and data files
# rules:  $XConsortium: Imake.rules,v 1.123 91/09/16 20:12:16 rws Exp $

# -------------------------------------------------------------------------
# DEC-Specific System Build Rules
# $Id: Dec.rules,v 1.1.2.8 1992/12/08 19:29:22 Leela_Obilichetti Exp $

# -------------------------------------------------------------------------
# start of Imakefile

include ../../Path.incl

FFOPTIONS = -C -fpe1 -switch nosqrt_recip -check nounderflow
FDEBUGFLAGS =
CDEBUGFLAGS =
CCOPTIONS=
FC=DECFORT_DEBUG=T;export DECFORT_DEBUG;f77
EXTRA_LOAD_FLAGS = -ldnet_stub

SCIVERSION=Scilab-2.0
SCIDATE=31 October 1994

EXTRA_INCLUDES=-I$(SCIDIR)/routines

FLOCAL_LDFLAGS=  -non_shared

LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS) $(LOCAL_LDFLAGS)

FFLAGS = $(FDEBUGFLAGS) $(FFOPTIONS)

FLDOPTIONS = $(FDEBUGFLAGS) $(FFOPTIONS) $(FLOCAL_LDFLAGS)
LLDOPTIONS = $(FDEBUGFLAGS) $(FLOCAL_LDFLAGS)

PATHSP=$(SCIDIR)/routines
PATHO=$(SCIDIR)/libs

.SUFFIXES: .sci .bin .dia .tst $(SUFFIXES)

TERMCAPLIB = -ltermcap

SYS_LIBRARIES = 	../../libs/comm.a -lm
DEPLIBS =

XAWLIB = ../../libs/libXaw.a
XMULIB = ../../libs/libXmu.a

LOCAL_LIBRARIES = $(XAWLIB) $(XMULIB) $(XTOOLLIB) $(XLIB)

SRCS =	actions.c alert.c attributes.c bezier.c choose.c color.c \
	comm.c create.c dialog.c dialogs.c draw.c file.c find.c font.c \
	graph.c \
	graphics.c init.c \
	list.c load.c menu.c message.c metanet.c modify.c movedraw.c \
	name.c save.c scilab.c show.c study.c text.c

OBJS =	actions.o alert.o attributes.o bezier.o choose.o color.o \
	comm.o create.o dialog.o dialogs.o draw.o file.o find.o font.o \
	graph.o \
	graphics.o init.o \
	list.o load.o menu.o message.o metanet.o modify.o movedraw.o \
	name.o save.o scilab.o show.o study.o text.o

PROGRAM = $(SCIDIR)/bin/xmetanet
XMETANET_DEFAULT = $(SCIDIR)/X11_defaults/Metanet-color

all:: $(PROGRAM) $(XMETANET_DEFAULT)

$(PROGRAM): $(OBJS) $(DEPLIBS)
	$(RM) $@
	$(CC) -o $@ $(OBJS) $(LDOPTIONS) $(LOCAL_LIBRARIES) $(LDLIBS) $(SYS_LIBRARIE) $(EXTRA_LOAD_FLAGS)

clean::
	$(RM) $(PROGRAM)

depend::
	$(DEPEND) $(DEPENDFLAGS) -s "# DO NOT DELETE" -- $(ALLDEFINES) -- $(SRCS)

$(XMETANET_DEFAULT): Metanet-color.ad
	rm -f $(SCIDIR)/X11_defaults/Metanet-color
	$(INSTALL) -c Metanet-color.ad $(XMETANET_DEFAULT)

distclean:: clean

clean::
	rm -f $(XMETANET_DEFAULT)

# -------------------------------------------------------------------------
# common rules for all Makefiles - do not edit

emptyrule::

clean::
	$(RM_CMD) "#"*

Makefile::
	-@if [ -f Makefile ]; then set -x; \
		$(RM) Makefile.bak; $(MV) Makefile Makefile.bak; \
	else exit 0; fi
	$(IMAKE_CMD) -DTOPDIR=$(TOP) -DCURDIR=$(CURRENT_DIR)

tags::
	$(TAGS) -w *.[ch]
	$(TAGS) -xw *.[ch] > TAGS

# -------------------------------------------------------------------------
# empty rules for directories that do not have SUBDIRS - do not edit

install::
	@echo "install in $(CURRENT_DIR) done"

install.man::
	@echo "install.man in $(CURRENT_DIR) done"

Makefiles::

includes::

# -------------------------------------------------------------------------
# dependencies generated by makedepend

# DO NOT DELETE

actions.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
actions.o: /usr/include/sys/types.h /usr/include/standards.h
actions.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
actions.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
actions.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
actions.o: /usr/include/X11/Xmd.h /usr/include/limits.h
actions.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
actions.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
actions.o: /usr/include/X11/Xresource.h /usr/include/string.h
actions.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
actions.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
actions.o: /usr/include/X11/RectObj.h graphics.h menus.h
alert.o: /usr/include/stdio.h /usr/include/standards.h
alert.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
alert.o: /usr/include/sys/types.h /usr/include/X11/X.h
alert.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
alert.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
alert.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
alert.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
alert.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
alert.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
alert.o: /usr/include/string.h /usr/include/X11/Core.h
alert.o: /usr/include/X11/Composite.h /usr/include/X11/Constraint.h
alert.o: /usr/include/X11/Object.h /usr/include/X11/RectObj.h
alert.o: /usr/include/X11/Shell.h /usr/include/X11/StringDefs.h
alert.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Box.h
alert.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
alert.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Command.h
alert.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
alert.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
alert.o: metawin.h graphics.h
attributes.o: list.h graph.h /usr/include/stdio.h /usr/include/standards.h
attributes.o: menus.h
bezier.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
bezier.o: /usr/include/sys/types.h /usr/include/standards.h
bezier.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
bezier.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
bezier.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
bezier.o: /usr/include/X11/Xmd.h /usr/include/limits.h
bezier.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
bezier.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
bezier.o: /usr/include/X11/Xresource.h /usr/include/string.h
bezier.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
bezier.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
bezier.o: /usr/include/X11/RectObj.h bezier.h
choose.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
choose.o: /usr/include/sys/types.h /usr/include/standards.h
choose.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
choose.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
choose.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
choose.o: /usr/include/X11/Xmd.h /usr/include/limits.h
choose.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
choose.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
choose.o: /usr/include/X11/Xresource.h /usr/include/string.h
choose.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
choose.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
choose.o: /usr/include/X11/RectObj.h /usr/include/X11/Shell.h
choose.o: /usr/include/X11/StringDefs.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Command.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/List.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Viewport.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h
choose.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Reports.h
choose.o: metawin.h graphics.h
color.o: list.h graph.h /usr/include/stdio.h /usr/include/standards.h color.h
color.o: metio.h
comm.o: /usr/include/malloc.h /usr/include/stdio.h /usr/include/standards.h
comm.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
comm.o: /usr/include/sys/types.h /usr/include/X11/X.h
comm.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
comm.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
comm.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
comm.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
comm.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
comm.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
comm.o: /usr/include/string.h /usr/include/X11/Core.h
comm.o: /usr/include/X11/Composite.h /usr/include/X11/Constraint.h
comm.o: /usr/include/X11/Object.h /usr/include/X11/RectObj.h list.h graph.h
comm.o: graphics.h menus.h metadir.h libCalCom.h libCom.h
create.o: /usr/include/malloc.h /usr/include/string.h
create.o: /usr/include/standards.h metadir.h list.h graph.h
create.o: /usr/include/stdio.h metio.h libCom.h
dialog.o: /usr/include/stdio.h /usr/include/standards.h
dialog.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
dialog.o: /usr/include/sys/types.h /usr/include/X11/X.h
dialog.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
dialog.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
dialog.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
dialog.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
dialog.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
dialog.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
dialog.o: /usr/include/string.h /usr/include/X11/Core.h
dialog.o: /usr/include/X11/Composite.h /usr/include/X11/Constraint.h
dialog.o: /usr/include/X11/Object.h /usr/include/X11/RectObj.h
dialog.o: /usr/include/X11/Shell.h /usr/include/X11/StringDefs.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Box.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Command.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Dialog.h
dialog.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h metawin.h
dialog.o: graphics.h
dialogs.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
dialogs.o: /usr/include/sys/types.h /usr/include/standards.h
dialogs.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
dialogs.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
dialogs.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
dialogs.o: /usr/include/X11/Xmd.h /usr/include/limits.h
dialogs.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
dialogs.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
dialogs.o: /usr/include/X11/Xresource.h /usr/include/string.h
dialogs.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
dialogs.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
dialogs.o: /usr/include/X11/RectObj.h /usr/include/X11/Shell.h
dialogs.o: /usr/include/X11/StringDefs.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Box.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Command.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Dialog.h
dialogs.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h
dialogs.o: metawin.h graphics.h
draw.o: /usr/include/stdio.h /usr/include/standards.h
draw.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
draw.o: /usr/include/sys/types.h /usr/include/X11/X.h
draw.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
draw.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
draw.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
draw.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
draw.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
draw.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
draw.o: /usr/include/string.h /usr/include/X11/Core.h
draw.o: /usr/include/X11/Composite.h /usr/include/X11/Constraint.h
draw.o: /usr/include/X11/Object.h /usr/include/X11/RectObj.h
draw.o: /usr/include/X11/StringDefs.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Box.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Viewport.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h
draw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Reports.h
draw.o: metaconst.h metawin.h bezier.h color.h graphics.h font.h
file.o: /usr/include/errno.h /usr/include/standards.h /usr/include/string.h
file.o: metadir.h list.h graph.h /usr/include/stdio.h metio.h
find.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
find.o: /usr/include/sys/types.h /usr/include/standards.h
find.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
find.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
find.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
find.o: /usr/include/X11/Xmd.h /usr/include/limits.h
find.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
find.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
find.o: /usr/include/X11/Xresource.h /usr/include/string.h
find.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
find.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
find.o: /usr/include/X11/RectObj.h metaconst.h list.h graph.h
find.o: /usr/include/stdio.h metio.h graphics.h
font.o: /usr/include/stdio.h /usr/include/standards.h
font.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
font.o: /usr/include/sys/types.h /usr/include/X11/X.h
font.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
font.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
font.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
font.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
font.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
font.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
font.o: /usr/include/string.h /usr/include/X11/Core.h
font.o: /usr/include/X11/Composite.h /usr/include/X11/Constraint.h
font.o: /usr/include/X11/Object.h /usr/include/X11/RectObj.h graphics.h
font.o: metio.h
graph.o: /usr/include/malloc.h /usr/include/string.h /usr/include/standards.h
graph.o: /usr/include/stdio.h defs.h metaconst.h list.h graph.h metio.h
graphics.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
graphics.o: /usr/include/sys/types.h /usr/include/standards.h
graphics.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
graphics.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
graphics.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
graphics.o: /usr/include/X11/Xmd.h /usr/include/limits.h
graphics.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
graphics.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
graphics.o: /usr/include/X11/Xresource.h /usr/include/string.h
graphics.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
graphics.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
graphics.o: /usr/include/X11/RectObj.h /usr/include/math.h
graphics.o: /usr/include/malloc.h /usr/include/stdio.h metaconst.h list.h
graphics.o: graph.h color.h menus.h metio.h graphics.h font.h
init.o: /usr/include/dirent.h /usr/include/standards.h
init.o: /usr/include/sys/types.h /usr/include/stdlib.h /usr/include/string.h
init.o: list.h graph.h /usr/include/stdio.h metio.h
list.o: /usr/include/malloc.h list.h graph.h /usr/include/stdio.h
list.o: /usr/include/standards.h metio.h
load.o: /usr/include/dirent.h /usr/include/standards.h
load.o: /usr/include/sys/types.h /usr/include/malloc.h /usr/include/stdio.h
load.o: /usr/include/string.h /usr/include/math.h metaconst.h metadir.h
load.o: list.h graph.h menus.h metio.h
menu.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
menu.o: /usr/include/sys/types.h /usr/include/standards.h
menu.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
menu.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
menu.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
menu.o: /usr/include/X11/Xmd.h /usr/include/limits.h
menu.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
menu.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
menu.o: /usr/include/X11/Xresource.h /usr/include/string.h
menu.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
menu.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
menu.o: /usr/include/X11/RectObj.h /usr/include/X11/StringDefs.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Box.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Command.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/MenuButton.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/SimpleMenu.h
menu.o: /usr/include/X11/Shell.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/SmeBSB.h
menu.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Sme.h
menu.o: /usr/include/X11/bitmaps/xlogo11 metaconst.h metawin.h list.h graph.h
menu.o: /usr/include/stdio.h graphics.h menus.h font.h
metanet.o: /usr/include/stdio.h /usr/include/standards.h
metanet.o: /usr/include/string.h /usr/include/X11/cursorfont.h
metanet.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
metanet.o: /usr/include/sys/types.h /usr/include/X11/X.h
metanet.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
metanet.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
metanet.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
metanet.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
metanet.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
metanet.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
metanet.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
metanet.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
metanet.o: /usr/include/X11/RectObj.h /usr/include/X11/Shell.h
metanet.o: /usr/include/X11/StringDefs.h
metanet.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h
metanet.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
metanet.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
metanet.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
metanet.o: defs.h color.h list.h graph.h graphics.h menus.h metadir.h
metanet.o: libCalCom.h libCom.h
modify.o: metaconst.h list.h graph.h /usr/include/stdio.h
modify.o: /usr/include/standards.h menus.h metio.h
movedraw.o: /usr/include/X11/StringDefs.h /usr/include/X11/IntrinsicP.h
movedraw.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
movedraw.o: /usr/include/sys/types.h /usr/include/standards.h
movedraw.o: /usr/include/X11/X.h /usr/include/X11/Xfuncproto.h
movedraw.o: /usr/include/X11/Xosdefs.h /usr/include/stddef.h
movedraw.o: /usr/include/X11/extensions/smtstr.h /usr/include/X11/Xproto.h
movedraw.o: /usr/include/X11/Xmd.h /usr/include/limits.h
movedraw.o: /usr/include/X11/Xprotostr.h /usr/include/X11/extensions/smt.h
movedraw.o: /usr/include/X11/extensions/ip.h /usr/include/X11/Xutil.h
movedraw.o: /usr/include/X11/Xresource.h /usr/include/string.h
movedraw.o: /usr/include/X11/Core.h /usr/include/X11/Composite.h
movedraw.o: /usr/include/X11/Constraint.h /usr/include/X11/Object.h
movedraw.o: /usr/include/X11/RectObj.h /usr/include/X11/CoreP.h
movedraw.o: /usr/include/X11/CompositeP.h /usr/include/X11/ConstrainP.h
movedraw.o: /usr/include/X11/ObjectP.h /usr/include/X11/RectObjP.h
movedraw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/ViewportP.h
movedraw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Viewport.h
movedraw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Form.h
movedraw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Reports.h
movedraw.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/FormP.h
movedraw.o: metaconst.h metawin.h
name.o: /usr/include/malloc.h metaconst.h list.h graph.h /usr/include/stdio.h
name.o: /usr/include/standards.h metio.h
save.o: /usr/include/malloc.h /usr/include/stdio.h /usr/include/standards.h
save.o: /usr/include/string.h metaconst.h metadir.h list.h graph.h metio.h
scilab.o: /usr/include/malloc.h list.h graph.h /usr/include/stdio.h
scilab.o: /usr/include/standards.h metio.h libCom.h
show.o: /usr/include/string.h /usr/include/standards.h list.h graph.h
show.o: /usr/include/stdio.h menus.h metio.h libCom.h
study.o: list.h graph.h /usr/include/stdio.h /usr/include/standards.h menus.h
text.o: /usr/include/stdio.h /usr/include/standards.h
text.o: /usr/include/X11/Intrinsic.h /usr/include/X11/Xlib.h
text.o: /usr/include/sys/types.h /usr/include/X11/X.h
text.o: /usr/include/X11/Xfuncproto.h /usr/include/X11/Xosdefs.h
text.o: /usr/include/stddef.h /usr/include/X11/extensions/smtstr.h
text.o: /usr/include/X11/Xproto.h /usr/include/X11/Xmd.h
text.o: /usr/include/limits.h /usr/include/X11/Xprotostr.h
text.o: /usr/include/X11/extensions/smt.h /usr/include/X11/extensions/ip.h
text.o: /usr/include/X11/Xutil.h /usr/include/X11/Xresource.h
text.o: /usr/include/string.h /usr/include/X11/Core.h
text.o: /usr/include/X11/Composite.h /usr/include/X11/Constraint.h
text.o: /usr/include/X11/Object.h /usr/include/X11/RectObj.h
text.o: /usr/include/X11/Shell.h /usr/include/X11/StringDefs.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Box.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xmu/Converters.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Command.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Label.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Simple.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/AsciiText.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/Text.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/TextSink.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/TextSrc.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/AsciiSrc.h
text.o: /usr/local/lib/distrib/scilab-2.0/routines/X11/Xaw/AsciiSink.h
text.o: metaconst.h metawin.h graphics.h
