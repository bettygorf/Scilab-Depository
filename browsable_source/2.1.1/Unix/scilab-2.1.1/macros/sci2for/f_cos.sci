//[stk,nwrk,txt,top]=f_cos(nwrk)
//!
nam='cos'
txt=[] 
s2=stk(top)
if s2(4)<>s2(5)|(s2(4)=='1'&s2(5)=='1') then
  v=s2(1)
  it2=prod(size(v))-1
  if it2==0 then
    [stk,nwrk,txt,top]=f_gener(nam,nwrk)
  else
     error(nam+' of complex argument : not implemented')
  end
else
  error(nam+' of non square not implemented ')
end
//end


