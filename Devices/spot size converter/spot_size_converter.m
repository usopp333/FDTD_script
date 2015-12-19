x0=0;
y0=0;
z0=0;
h=0.22;
w=0.45;
l=5;
wt=0.075;
%lw=10~300
lt=10;
%polymer size
hp=2;
wp=2;
lp=lt+l+5;
p_index=1.58;

wl=1.550;

hbox=2.5;
lbox=lp+5;
wbox=5;
addrect();
set('name','BOX');
set('x pos',x0);
set('z pos',z0+5);
set('y pos',-h/2-hbox/2);
set('x span',wbox);
set('y span',hbox);
set('z span',lbox);

addrect();
set('name','polymer');
set('x pos',x0);
set('y pos',hp/2-h/2);
set('z pos',z0+2.5);
set('x span',wp);
set('y span',hp);
set('z span',lp);

addlineartaper();
set('name','taper');
set('start center x',x0);
set('start center z',-(lt-(lt+l)/2));
set('start width',w);
set('end center x',x0);
set('end center z',-(lt-(lt+l)/2)+lt);
set('end width',wt);
set('y pos',y0);
set('y span',h);

addrect();
set('name','input');
set('x pos',x0);
set('y pos',y0);
set('z pos',-(lt-(lt+l)/2+l/2));
set('x span',w);
set('y span',h);
set('z span',l);

addportsource();
set('name','source');
set('incident axis','z');
set('direction','forward');
set('wave shap','mode');
set('incident mode',1);
set('total mode',3);
set('x pos',x0);
set('y pos',y0);
set('z pos',-(lt-(lt+l)/2+l/2));
set('y span',2);
set('x span',2);
set('wave','gaussian')
set('central wavelength',wl);

addfieldmonitor();
set('name','monitor 1');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x pos',x0);
set('y pos',hp/2-h/2);
set('z pos',-(lt-(lt+l)/2)+lt+2.5);
set('x span',2);
set('y span',2);