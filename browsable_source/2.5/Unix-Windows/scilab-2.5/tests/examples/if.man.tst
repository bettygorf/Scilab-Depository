clear;lines(0);
   i=2
   for j = 1:3, 
      if i == j then
        a(i,j) = 2; 
      elseif abs(i-j) == 1 then 
        a(i,j) = -1; 
      else a(i,j) = 0;
      end,
   end
