      INTEGER FUNCTION ignnbn(n,p)
C**********************************************************************
C
C     INTEGER FUNCTION IGNNBN( N, P )
C
C                GENerate Negative BiNomial random deviate
C
C
C                              Function
C
C
C     Generates a single random deviate from a negative binomial
C     distribution.
C
C
C                              Arguments
C
C
C     N  --> Required number of events.
C                              INTEGER N
C     JJV                      (N > 0)
C
C     P  --> The probability of an event during a Bernoulli trial.
C                              DOUBLE PRECISION P
C     JJV                      (0.0 < P < 1.0)
C
C
C
C                              Method
C
C
C     Algorithm from page 480 of
C
C     Devroye, Luc
C
C     Non-Uniform Random Variate Generation.  Springer-Verlag,
C     New York, 1986.
C
C**********************************************************************
C     ..
C     .. Scalar Arguments ..
      DOUBLE PRECISION p
      INTEGER n
C     ..
C     .. Local Scalars ..
      DOUBLE PRECISION y,a,r
C     ..
C     .. External Functions ..
C     JJV changed to call SGAMMA directly
C     DOUBLE PRECISION gengam
      DOUBLE PRECISION sgamma
      INTEGER ignpoi
C      EXTERNAL gengam,ignpoi
      EXTERNAL sgamma,ignpoi
C     ..
C     .. Intrinsic Functions ..
      INTRINSIC real
C     ..
C     .. Executable Statements ..
C     Check Arguments
C     JJV changed argumnet checker to abort if N <= 0
C     See Rand,c 
C     Generate Y, a random gamma (n,(1-p)/p) variable
C     JJV Note: the above parametrization is consistent with Devroye,
C     JJV       but gamma (p/(1-p),n) is the equivalent in our code
 10   r = dble(n)
      a = p/ (1.0-p)
C      y = gengam(a,r)
      y = sgamma(r)/a

C     Generate a random Poisson(y) variable
      ignnbn = ignpoi(y)
      RETURN

      END
