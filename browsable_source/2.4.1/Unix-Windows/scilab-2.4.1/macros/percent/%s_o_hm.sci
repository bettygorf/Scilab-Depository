function M=%s_o_hm(s,M)
// Copyright INRIA
//s==M
if size(s,'*')<> 1 then
  error('== : arguments have incompatible dimensions')
end
M('entries')=s==M('entries')

