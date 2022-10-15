function ok=do_exit()
r=1
if edited then
  if ~super_block then
    r=message(['Diagram has not been saved';
	'Really exit?'],['Yes';'No'])
  elseif pal_mode then
    r=message(['Palette has not been saved';
	'Really exit?'],['Yes';'No'])
  end
end
if r==1 then
  if ~super_block&~pal_mode  then
    if alreadyran then do_terminate(),end
  end
  ok=%t
  xset('window',curwin)
//  erasemenubar(datam)
//  if pixmap then xset('wshow'),end
  xbasc()
  xset('alufunction',3)
  setmenu(curwin,'3D Rot.')
  setmenu(curwin,'File',1) //clear
  setmenu(curwin,'File',2) //select
  setmenu(curwin,'File',6) //load
  setmenu(curwin,'File',7) //close
  if ~super_block then
    delmenu(curwin,'stop'),
    xset('window',curwin),xsetech([0 0 1 1])
  end
  for win=windows(size(windows,1):-1:noldwin+1,2)',xbasc(win),xdel(win);end
else
  ok=%f
end