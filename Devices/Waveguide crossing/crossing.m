lt=0.73;
lm=3.920;
wm=1.2;
wg=0.5;
h=0.22;
l=2;
wl=1.550;
x0=0;
y0=0;
z0=0;
lb=(2*2*lt+2*l+lm);
wb=lb;
hb=2;

%set waveguide crossing
addrect();
set('name','MMI_level');
set('x pos',x0);
set('y pos',y0);
set('z pos',z0);
set('x span',wm);
set('z span',lm);
set('y span',h);

addrect();
set('name','MMI_vertical');
set('x pos',x0);
set('y pos',y0);
set('z pos',z0);
set('x span',lm);
set('z span',wm);
set('y span',h);

%set taper
addlineartaper();
set('name','level_taper_l');
set('start center x',x0);
set('start center z',-(lt+lm/2));
set('start width',wg);
set('end center x',x0);
set('end center z',-lm/2);
set('end width',wm);
set('y pos',y0);
set('y span',h);

addlineartaper();
set('name','level_taper_r');
set('start center x',x0);
set('start center z',(lt+lm/2));
set('start width',wg);
set('end center x',x0);
set('end center z',lm/2);
set('end width',wm);
set('y pos',y0);
set('y span',h);

addlineartaper();
set('name','vertical_taper_u');
set('y rotation',90);
set('start center x',(lt+lm/2));
set('start center z',z0);
set('start width',wg);
set('end center x',lm/2);
set('end center z',z0);
set('end width',wm);
set('y pos',y0);
set('y span',h);

addlineartaper();
set('name','vertical_taper_d');
set('y rotation',-90);
set('start center x',-(lt+lm/2));
set('start center z',z0);
set('start width',wg);
set('end center x',-lm/2);
set('end center z',z0);
set('end width',wm);
set('y pos',y0);
set('y span',h);

%set io
addrect();
set('name','level_in');
set('x pos',x0);
set('y pos',y0);
set('z pos',-(lt+lm/2+l/2));
set('x span',wg);
set('y span',h);
set('z span',l);

addrect();
set('name','level_out');
set('x pos',x0);
set('y pos',y0);
set('z pos',(lt+lm/2+l/2));
set('x span',wg);
set('y span',h);
set('z span',l);

addrect();
set('name','vertical_in');
set('x pos',(lt+lm/2+l/2));
set('y pos',y0);
set('z pos',z0);
set('x span',l);
set('y span',h);
set('z span',wg);

addrect();
set('name','vertical_out');
set('x pos',-(lt+lm/2+l/2));
set('y pos',y0);
set('z pos',z0);
set('x span',l);
set('y span',h);
set('z span',wg);

%set bottom
addrect();
set('name','bottom');
set('x pos',x0);
set('y pos',-hb/2-h/2);
set('z pos',z0);
set('x span',wb);
set('y span',hb);
set('z span',lb);

%set source
addportsource();
set('name','source_level');
set('incident axis','z');
set('direction','forward');
set('wave shap','mode');
set('incident mode',1);
set('total mode',3);
set('x pos',x0);
set('y pos',y0);
set('z pos',-(lt+lm/2+l/2));
set('y span',2);
set('x span',2);
set('wave','gaussian')
set('central wavelength',wl);

addportsource();
set('name','source_vertical');
set('incident axis','x');
set('direction','backward');
set('wave shap','mode');
set('incident mode',1);
set('total mode',3);
set('x pos',(lt+lm/2+l/2));
set('y pos',y0);
set('z pos',z0);
set('y span',2);
set('x span',2);
set('wave','gaussian')
set('central wavelength',wl);

%set monitor
addfieldmonitor();
set('name','out_level');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x pos',x0);
set('y pos',y0);
set('z pos',(lt+lm/2+l/2));
set('x span',1);
set('y span',1);

addfieldmonitor();
set('name','out_vertical');
set('spatial','2d x');
set('data moniotring','frequence');
set('components','px py pz');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x pos',-(lt+lm/2+l/2));
set('y pos',y0);
set('z pos',z0);
set('y span',1);
set('z span',1);

addfieldmonitor();
set('name','bottom');
set('spatial','2d y');
set('data moniotring','frequence');
set('components','ex ey ez hx hy hz');
set('incident mode',1);
set('total mode',1);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x pos',x0);
set('y pos',y0);
set('z pos',z0);
set('x span',lm+lt+l/2);
set('z span',lm+lt+l/2);