clear;lines(0);
t=[0:0.1:5*%pi]';
param3d1([sin(t),sin(2*t)],[cos(t),cos(2*t)],..
	 list([t/10,sin(t)],[3,2]),35,45,"X@Y@Z",[2,3])
