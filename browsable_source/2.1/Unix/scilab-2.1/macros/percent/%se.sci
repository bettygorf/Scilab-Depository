function f=%se(i,j,f)
// f=%se(i,j,f) <=> f=f(i,j) = f(find(i),find(j))
//!
[lhs,rhs]=argn(0)
if rhs==2 then
  if type(i)==4 then i=find(i),end
  f=j(i)
else
  if type(i)==4 then i=find(i),end
  if type(j)==4 then j=find(j),end
  f=f(i,j)
end

//end


