      INTEGER FUNCTION ignuin(low,high,ierr)
C**********************************************************************
C
C     INTEGER FUNCTION IGNUIN( LOW, HIGH )
C
C               GeNerate Uniform INteger
C
C
C                              Function
C
C
C     Generates an integer uniformly distributed between LOW and HIGH.
C
C
C                              Arguments
C
C
C     LOW --> Low bound (inclusive) on integer value to be generated
C                         INTEGER LOW
C
C     HIGH --> High bound (inclusive) on integer value to be generated
C                         INTEGER HIGH
C
C
C                              Note
C
C
C     If (HIGH-LOW) > 2,147,483,561 prints error message on * unit and
C     stops the program.
C
C**********************************************************************
      include '../stack.h'
C     IGNLGI generates integers between 1 and 2147483562
C     MAXNUM is 1 less than maximum generable value
C     .. Parameters ..
      INTEGER maxnum
      PARAMETER (maxnum=2147483561)
C     ..
C     .. Scalar Arguments ..
      INTEGER high,low
C     ..
C     .. Local Scalars ..
      INTEGER ierr,ign,maxnow,range,ranp1
C     ..
C     .. External Functions ..
      INTEGER ignlgi
      EXTERNAL ignlgi
C     ..
C     .. Intrinsic Functions ..
      INTRINSIC mod
C     ..
C     .. Executable Statements ..
      ierr=0
      ignuin = 0
      IF (.NOT. (low.GT.high)) GO TO 10
      ierr = 1
C      ABORT-PROGRAM
      GO TO 80

   10 range = high - low
      IF (.NOT. (range.GT.maxnum)) GO TO 20
      ierr = 2
C      ABORT-PROGRAM
      GO TO 80

   20 IF (.NOT. (low.EQ.high)) GO TO 30
      ignuin = low
      RETURN

C     Number to be generated should be in range 0..RANGE
C     Set MAXNOW so that the number of integers in 0..MAXNOW is an
C     integral multiple of the number in 0..RANGE

   30 ranp1 = range + 1
      maxnow = (maxnum/ranp1)*ranp1
   40 ign = ignlgi() - 1
      IF (.NOT. (ign.LE.maxnow)) GO TO 40
      ignuin = low + mod(ign,ranp1)
      RETURN
   80 IF (ierr.EQ.1) then 
         call basout(io,wte,"LOW > HIGH ")
         ignuin = 0
         return
      elseif (ierr.eq.2) then 
         call basout(io,wte,"HIGH - LOW  > 2,147,483,561 in IGNUIN")
         ignuin = 0
         return
      endif
      return
      end 



