function xbasimp(win_num,filen,printer)
// This function will send the recorded graphics 
// to a Postscript file 
//!
[lhs,rhs]=argn(0);
n=prod(size(win_num))
win_num=matrix(win_num,1,n);
if rhs<2,filen=TMPDIR+'/scilab.ps';end
flag=0;
if rhs=1 | rhs>=3 ,flag=1;end
fname=' ';
for i=1:n,
  fnamel=filen+'.'+string(win_num(i));
  fname=fname+fnamel+' ';
  // don't break next line
  //driver('Pos');xinit(fnamel);xtape('replay',win_num(i));driver('Pos');xend();
  // xg2ps is not documented it's only used here 
  // the third argument which is optional can be set to 0 1
  // 0 for b&w and 1 for color  : the default value is to use the screen 
  // status 
  xg2ps(win_num(i),fnamel);
end
//driver('Rec');
//Blpr 'titre' filename1 filename2 ....  lpr
if rhs <= 2 then 
  prs= getenv('PRINTERS','void')
  if prs<>"void" ;k=strindex(prs,':')
	       prs=part(prs,1:k(1)-1);
	       prc= 'lpr -P'+prs;
  else
	       prc= 'lpr'
  end
else 
	prc = 'lpr -P'+printer
end 
if flag=1,host('$SCI/bin/Blpr ''  '' '+fname+ ' |' + prc);end
if rhs=1,host('rm -f '+fname);end


