function [stk,nwrk,txt,top]=%a2for(nwrk)
//
//!
txt=[]
//write(6,'%a2for');pause
s2=stk(top);s1=stk(top-1);
[s1,te1,t1,m1,n1]=s1(1:5);
[s2,te2,t2,m2,n2]=s2(1:5);
mn1=mulf(m1,n1)
it1=prod(size(s1))-1;it2=prod(size(s2))-1
//
if m1=='1'&n1=='1'&m2=='1'&m2=='1' then
  select it1+2*it2
   case 0 then
     stk=list(s1+'+'+s2,'2',t1,m1,n1)
   case 1 then
     stk=list([s1(1)+'+'+s2(1),s1(2)],'2',t1,m1,n1)
   case 2 then
     stk=list([s1(1)+'+'+s2(1),s2(2)],'2',t1,m1,n1)
   case 3 then
     stk=list([s1(1)+'+'+s2(1),s1(2)+'+'+s2(2)],'2',t1,m1,n1)
   end
else
  select it1+2*it2
  case 0 then
    [out,nwrk,txt]=outname(nwrk,'1',m1,n1)
    txt=[txt;
	gencall(['dcopy',mn1,s1(1),'1',out,'1']);
	gencall(['dadd',mn1,out,'1',s2(1),'1'])];
    stk=list(out,'-1',t1,m1,n1)
  case 1 then
    [outr,nwrk,txt]=outname(nwrk,'1',m1,n1)
    if part(outr,1:4)<>'work' then
      outi=outr+'_i'
      outr=outr+'_r'
    else
      [outi,nwrk,txt]=outname(nwrk,t2,m2,n2)
    end
    txt=[txt;
	gencall(['dcopy',mn1,s1(1),'1',outr,'1']);
	gencall(['dadd',mn1,s2(1),'1',outr,'1']);
	gencall(['dcopy',mn1,s1(2),'1',outi,'1'])]
    stk=list([outr,outi],'-1',t1,m1,n1)
  case 2 then
    [outr,nwrk,txt]=outname(nwrk,'1',m1,n1)
    if part(outr,1:4)<>'work' then
      outi=outr+'_i'
      outr=outr+'_r'
    else
      [outi,nwrk,txt]=outname(nwrk,t2,m2,n2)
    end
    txt=[txt;
	gencall(['dcopy',mn1,s1(1),'1',outr,'1']);
	gencall(['dadd',mn1,s2(1),'1',outr,'1']);
	gencall(['dcopy',mn1,s2(2),'1',outi,'1'])]
    stk=list([outr,outi],'-1',t1,m1,n1)
  case 3 then
    [outr,nwrk,txt]=outname(nwrk,'1',m1,n1)
    if part(outr,1:4)<>'work' then
      outi=outr+'_i'
      outr=outr+'_r'
    else
      [outi,nwrk,txt]=outname(nwrk,t2,m2,n2)
    end
    txt=[txt;
	gencall(['dcopy',mn1,s1(1),'1',outr,'1']);
	gencall(['dadd',mn1,s2(1),'1',outr,'1']);
	gencall(['dcopy',mn1,s1(2),'1',outi,'1']);
	gencall(['dadd',mn1,s2(2),'1',outi,'1'])];
    stk=list([outr,outi],'-1',t1,m1,n1)
  end
end
top=top-1
