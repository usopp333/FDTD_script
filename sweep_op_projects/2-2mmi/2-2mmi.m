selectall
delete
x0 = 0;
y0 = 0;
z0 = 0;


wg_w = 0.5;

wg_h = 0.22;

out_x = mmi_w/4;
set('global variable','wg_w=0.5');
set('global variable','mmi_w=2');
set('global variable','mmi_l=11.6542');

set('global variable','pi=3.1415926');
set('global variable','theta=45');
set('global variable','s_w=2');
set('global variable','s_l=10');
set('global variable','wg_r=10');
set('global variable','wg_w=0.5');
set('global variable','wg_l=3');

addarcwaveguide();
set('name','in_upr1');
set('x','mmi_w/3/2+wg_r');
set('y',0);
set('z','-mmi_l/2');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','90');
set('span angle','theta');

addarcwaveguide();
set('name','in_downr1');
set('x','-(mmi_w/3/2+wg_r)');
set('y',0);
set('z','-mmi_l/2');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','180+theta');
set('span angle','theta');

addarcwaveguide();
set('name','in_upr2');
set('x','mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)');
set('y',0);
set('z','-(mmi_l/2+2*wg_r*sin(theta*pi/180))');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','270');
set('span angle','theta');

addarcwaveguide();
set('name','in_downr2');
set('x','-(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180))');
set('y',0);
set('z','-(mmi_l/2+2*wg_r*sin(theta*pi/180))');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','theta');
set('span angle','theta');

addrect();
set('name','in_up');
set('z','-(mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2)');
set('y',0);
set('x','(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r)');
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);


addrect();
set('name','in_down');
set('z','-(mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2)');
set('y',0);
set('x','-(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r)');
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);

addrect();
set('name','MMI');
set('x pos',x0);
set('y pos',y0);
set('z pos',z0);
set('x span','mmi_w');
set('y span',wg_h);
set('z span','mmi_l');

addportsource();
set('name','source');
set('z','-(mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2)');
set('y',0);
set('x','(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r)');
set('x span',1);
set('y span',1);


addfieldmonitor();
set('name','monitor');
set('x pos',x0);
set('y pos',y0);
set('z pos',z0);
set('x span',mmi_w+0.5);
set('y span',0.5);
set('total mode',10);
set('components','ex ey ez hx hy hz px py pz');


addarcwaveguide();
set('name','out_upr1');
set('x','mmi_w/3/2+wg_r');
set('y',0);
set('z','mmi_l/2');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','theta');
set('span angle','theta');

addarcwaveguide();
set('name','out_downr1');
set('x','-(mmi_w/3/2+wg_r)');
set('y',0);
set('z','mmi_l/2');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','-90');
set('span angle','theta');

addarcwaveguide();
set('name','out_upr2');
set('x','mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)');
set('y',0);
set('z','mmi_l/2+2*wg_r*sin(theta*pi/180)');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','-90-theta');
set('span angle','theta');

addarcwaveguide();
set('name','out_downr2');
set('x','-(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180))');
set('y',0);
set('z','mmi_l/2+2*wg_r*sin(theta*pi/180)');
set('radius','wg_r+wg_w/2');
set('radius 2','wg_r+wg_w/2');
set('width',wg_w);
set('y span',wg_h);
set('start angle','90');
set('span angle','theta');

addrect();
set('name','out_up');
set('z','mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2');
set('y',0);
set('x','mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r');
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);


addrect();
set('name','out_down');
set('z','mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2');
set('y',0);
set('x','-(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r)');
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);

addfieldmonitor();
set('name','monitor_up');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('enable mode expansion','true');
set('incident mode',1);
set('total mode',3);
set('z','mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2');
set('y',0);
set('x','mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r');
set('x span',1);
set('y span',1);

addfieldmonitor();
set('name','monitor_down');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('enable mode expansion','true');
set('incident mode',1);
set('total mode',3);
set('z','mmi_l/2+2*wg_r*sin(theta*pi/180)+wg_l/2');
set('y',0);
set('x','-(mmi_w/3/2+wg_r-2*wg_r*cos(theta*pi/180)+wg_r)');
set('x span',1);
set('y span',1);

selectall();
pin();
unselectall();
