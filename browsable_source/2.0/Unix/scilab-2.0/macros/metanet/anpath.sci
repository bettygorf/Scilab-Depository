function p=anpath(i,j,g)
[lhs,rhs]=argn(0), if rhs==2 then g=the_g, end
if ( i<0 | i>g_nodnum(g) | j<0 | j>g_nodnum(g)) then 
  error('bad internal node number') 
end
[l,v]=dfs(i,g)
p=prevn2p(i,j,v,g)
