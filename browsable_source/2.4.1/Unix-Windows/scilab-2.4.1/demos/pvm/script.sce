// Copyright INRIA
while %t  //Infinite loop
[buf,info] = pvm_recv(pvm_parent(), -1)//get new variable or instruction
  if info<0 then break,end
  
  if type(buf)==10 then //an instruction
    if execstr(buf,'errcatch') then break,end//execute it
    write(%io(2),'Instruction: '+buf+' done')
  else //a variable
    %var=buf //preserve it in %var
    disp('Variable received')
  end
end
