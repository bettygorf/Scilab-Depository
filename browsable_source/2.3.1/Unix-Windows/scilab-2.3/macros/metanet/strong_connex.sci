function [nc,ncomp]=strong_connex(g)
[lhs,rhs]=argn(0)
if rhs<>1 then error(39), end
// g
check_graph(g)
// compute lp and ls
ma=prod(size(g('tail')))
n=g('node_number')
if g('directed') == 1 then
  [lp,la,ls]=m6ta2lpd(g('tail'),g('head'),n+1,n)
else
  [lp,la,ls]=m6ta2lpu(g('tail'),g('head'),n+1,n,2*ma)
end
// compute connexity
[nc,ncomp]=m6compfc(lp,ls,n)
