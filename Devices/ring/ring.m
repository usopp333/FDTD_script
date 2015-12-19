x0=0;
y0=0;
z0=0;

lbox=22;
wbox=16;
hbox=4;

xi=3.6;
li=25;
wi=0.4;
hi=0.18;

r=3.3;
rw=0.4;
ryp=0.18;

wl=1.55;
zp=4;

addrect(x0,-hbox/2-hi/2,z0);
set('name','BOX');
set('material','silica');
set('x span',wbox);
set('y span',hbox);
set('z span',lbox);


addcirclering(x0,y0,z0);
set('name','ring');
set('radius',r);
set('radius 2',r);
set('width',rw);
set('y span',ryp);

addrect(-xi,y0,z0);
set('name','linear#2');
set('x span',wi);
set('y span',hi);
set('z span',li);

addrect(xi,y0,z0);
set('name','linear#1');
set('x span',wi);
set('y span',hi);
set('z span',li);


addportsource(xi,y0,-zp);
set('name','source');
set('incident axis','z');
set('direction','forward');
set('wave shap','mode');
set('incident mode',1);
set('total mode',3);
set('y span',1.5);
set('x span',1.5);
set('wave','gaussian');
set('central wavelength',wl);

addfieldmonitor(-xi,y0,-zp);
set('name','drop');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','pz');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x span',1.5);
set('y span',1.5);

addfieldmonitor(xi,y0,zp);
set('name','through');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','pz');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x span',1.5);
set('y span',1.5);

addfieldmonitor(-xi,y0,zp);
set('name','through');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','pz');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x span',1.5);
set('y span',1.5);

selectall
pin
