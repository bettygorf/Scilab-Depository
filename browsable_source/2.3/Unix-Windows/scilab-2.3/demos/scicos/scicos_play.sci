function scicos_play(fil)
funcprot(0)
x_mess=funptr('x_message')
x_dia=funptr('x_dialog')
x_mdia=funptr('x_mdialog')
c_cho=funptr('x_choose')
xcli=funptr('xclick')
xgetm=funptr('xgetmouse')

//clearfun('x_message')
clearfun('x_dialog')
clearfun('x_mdialog')
clearfun('x_choose')
clearfun('xclick')
clearfun('xgetmouse')
getf('SCI/macros/util/x_matrix.sci','c')
getf('SCI/macros/util/getvalue.sci')
getf('SCI/macros/xdess/getmenu.sci')

names=['choosefile';
'do_addnew';
'do_block';
'do_color';
'do_copy';
'do_copy_region';
'do_delete';
'do_delete_region';
'do_help';
'do_move';
'do_palettes';
'do_replace';
'do_run';
'do_tild';
'do_view';
'getlink';
'move';
'prt_align';
'scicos']

for k=1:size(names,'r')
  getf('SCI/macros/scicos/'+names(k)+'.sci')
end

lines(0)
getf('SCI/demos/scicos/dialogs.sci','c')
message=x_message
newfun('x_message',x_mess)
dialog=x_dialog
I=file('open',fil,'old')
O=file('open','/dev/null','unknown')
%IO=[I,O]
lines(0)
scicos();
file('close',I)
file('close',O)

//newfun('x_message',x_mess)
newfun('x_dialog',x_dia)
newfun('x_mdialog',x_mdia)
newfun('x_choose',c_cho)
newfun('xclick',xcli)
newfun('xgetmouse',xgetm)
