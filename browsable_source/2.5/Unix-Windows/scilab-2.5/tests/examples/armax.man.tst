clear;lines(0);
//-Ex1- Arma model : y(t) = 0.2*u(t-1)+0.01*e(t-1)
ny=1,nu=1,sig=0.01;
Arma=armac(1,[0,0.2],[0,1],ny,nu,sig)  //defining the above arma model
u=rand(1,1000,'normal');     //a random input sequence u
y=arsimul(Arma,u); //simulation of a y output sequence associated with u.
Armaest=armax(0,1,y,u);   //Identified model given u and y.
Acoeff=Armaest('a');    //Coefficients of the polynomial A(x)
Bcoeff=Armaest('b')     //Coefficients of the polynomial B(x)
Dcoeff=Armaest('d');    //Coefficients of the polynomial D(x)
[Ax,Bx,Dx]=arma2p(Armaest)   //Results in polynomial form. 

//-Ex2- Arma1: y_t -0.8*y_{t-1} + 0.2*y_{t-2} =  sig*e(t)
ny=1,nu=1;sig=0.001;
// First step: simulation the Arma1 model, for that we define
// Arma2: y_t -0.8*y_{t-1} + 0.2*y_{t-2} = sig*u(t)
// with normal deviates for u(t).  
Arma2=armac([1,-0.8,0.2],sig,0,ny,nu,0);
//Definition of the Arma2 arma model (a model with B=sig and without noise!)
u=rand(1,10000,'normal');  // An input sequence for Arma2
y=arsimul(Arma2,u); // y = output of Arma2 with input u 
//                     can be seen as output of Arma1.
// Second step: identification. We look for an Arma model
// y(t) + a1*y(t-1) + a2 *y(t-2) =  sig*e(t)
Arma1est=armax(2,-1,y,[]);
[A,B,D]=arma2p(Arma1est)
