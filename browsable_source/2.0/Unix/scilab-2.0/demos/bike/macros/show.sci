function []=show(xx,t,p,f_name)
//[]=show(xx,t,p,[f_name])
// Just show the bike evolution
// t ans p are the spherical angles of the observation point
// given in radian
// f_name is the function name to use for display 
// f_name can be velo1 or velo2 or velo3
// !
[lhs,rhs]=argn(0)
if rhs <= 3 , f_name=velo1;end
nstep=1;r1=0.3;  //change nstep for postscript

[nnr,nn]=size(xx);
i=1:nstep:nn;
//---------- position of the contact point of the rear wheel
// xrear = xx(1:6,:)
// theta=xrear(5,:);phi=xrear(4,:);
rr=[ r1*cos(xx(5,:)).*sin(xx(4,:));
-r1*cos(xx(5,:)).*cos(xx(4,:));
-r1*sin(xx(5,:))];
xprear=xx(1:3,:)+rr;

//------------ generation of the rear wheel
nnn=24
l=(1/nnn)*( 2*%pi)*(0:nnn)'
dec = ones(l);sinl=r1*sin(l);cosl=r1*cos(l);

cphi1=cos(xx(4,i));
sphi1=sin(xx(4,i));
cthe1=cos(xx(5,i));
sthe1=sin(xx(5,i));
//  unused  (rotation angle of wheel)
//  cpsi1=cos(xx(6,i));
//  spsi1=sin(xx(6,i));
xrearar = cosl*cphi1-sinl*(sphi1.*cthe1)+dec*xx(1,i);
yrearar=  cosl*sphi1+sinl*(cphi1.*cthe1)+dec*xx(2,i);
zrearar = sinl*sthe1+dec*xx(3,i);

//------------- the framefork
xf= [ xx(1,i);2*xx(7,i)-xx(1,i);xx([15,21],i)];
yf= [ xx(2,i);2*xx(8,i)-xx(2,i);xx([16,22],i)];
zf= [ xx(3,i);2*xx(9,i)-xx(3,i);xx([17,23],i)];
//------------- position of the contact point of the rear wheel
//xfront=xx([21,22,23,18,19,20],:);
//theta=xx(19,:);phi=xx(18,:);
rr=[  r1*cos(xx(19,:)).*sin(xx(18,:));
-r1*cos(xx(19,:)).*cos(xx(18,:));
-r1*sin(xx(19,:))];
xpfront=xx(21:23,:)+rr;


//-------------- generation of the front wheel
cphi1=cos(xx(18,i));
sphi1=sin(xx(18,i));
cthe1=cos(xx(19,i));
sthe1=sin(xx(19,i));
// unused
//  cpsi1=cos(xx(20,i));
//  spsi1=sin(xx(20,i));
xfrontar = cosl*cphi1-sinl*(sphi1.*cthe1)+dec*xx(21,i);
yfrontar=  cosl*sphi1+sinl*(cphi1.*cthe1)+dec*xx(22,i);
zfrontar = sinl*sthe1+dec*xx(23,i);
//---------------boundaries
xp=[xprear,xpfront,[xf(2,:);yf(2,:);zf(2,:)]];
xmin=mini(xp(1,:));xmax=maxi(xp(1,:));
ymin=mini(xp(2,:));ymax=maxi(xp(2,:));
if xmin <0 then xmin=1.04*xmin,else xmin=0.96*xmin;end
if xmax >0 then xmax=1.04*xmax,else xmax=0.96*xmax;end
if ymin <0 then ymin=1.04*ymin,else ymin=0.96*ymin;end
if ymax >0 then ymax=1.04*ymax,else ymax=0.96*ymax;end
zmin=mini(xp(3,:));zmax=maxi(xp(3,:));
rect=[xmin,xmax,ymin,ymax,zmin,zmax]
f_name();

