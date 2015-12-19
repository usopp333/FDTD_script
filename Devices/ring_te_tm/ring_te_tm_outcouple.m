selectall();
delete();
%设置全局变量
% set('global variable','pi = 3.1415926');
% set('global variable','R2=20');
% set('global variable','R1=19.3');
% set('global variable','w2=0.46');
% set('global variable','w1=0.534');
% set('global variable','wg_h=0.22');
% set('global variable','ldc0=4.5');
% set('global variable','theta_span=90');

pi = 3.1415926;
x0 = 0;
y0 = 0;
z0 = 0;
wl = 1.550;
hbox = 2;
gap = 0.1;
wg_l = 50;
R2 = 20;
R1 = R2-0.7;
% R3 = 2;
w2 = 0.46;
w1 = 0.534;
wg_h = 0.22;
ldc0 = 4.5;
%ldc0 = 5;
theta_span = 103.4;%dc在外圆环上的范围角
% te tm 在两种结构的波导中的neff
te_w2_neff = 2.310798;
te_w1_neff = 2.433812;
tm_w2_neff = 1.594099;
tm_w1_neff = 1.641671;

L_te_w2 = 2*pi*R2*te_w2_neff; %te 模式在外圆环中的光程

d_L_tetm = (L_te_w2 - tm_w2_neff*(R2*(2*pi-pi*theta_span/180+ldc0/R1)+ldc0))/tm_w1_neff;

% R4*(2*pi-(pi*theta_span/180-2*ldc0/R1))+2*pi*R3 = d_L_tetm-ldc0;
% R4+2*R3 = R1;
%d_L_R4 = d_L_tetm - 2*pi*R3 - ldc0;
R3 = (d_L_tetm-ldc0-R1*(2*pi-pi*theta_span/180+2*ldc0/R1))/(2*pi-2*(2*pi-(pi*theta_span/180-2*ldc0/R1)));
R4 = R1 - 2*R3;

addrect();
set('name','box');
set('x',x0);
set('y max',-wg_h/2);
set('y min',-wg_h/2-2);
set('x span',50);
set('z span',50);
set('material','silica');
%delete();

%addcirclering();
addarcwaveguide()
set('name','ring_R2')
set('x',x0);
set('y',y0);
set('z',z0);
set('radius',R2+w2/2);
set('radius 2',R2+w2/2)
set('width',w2);
set('y span',wg_h);
set('start angle',-90);
set('span angle',180);

%addcirclering();
addarcwaveguide()
set('name','ring_R2')
set('x',x0);
set('y',y0);
set('z',z0);
set('radius',R2+w2/2);
set('radius 2',R2+w2/2)
set('width',w2);
set('y span',wg_h);
set('start angle',90);
set('span angle',180);

addarcwaveguide();
set('name','dc1_R1');
set('x',x0);
set('y',y0);
set('z',z0);
set('radius',R1+w1/2);
set('radius 2',R1+w1/2);
set('width',w1);
set('y span',wg_h);
set('start angle',90-ldc0/R1*180/pi/2);
set('span angle',ldc0/R1*180/pi);

addarcwaveguide();
set('name','dc2_R1');
set('x',x0);
set('y',y0);
set('z',z0);
set('radius',R1+w1/2);
set('radius 2',R1+w1/2);
set('width',w1);
set('y span',wg_h);
set('start angle',-(theta_span-ldc0/R1*180/pi/2-90));
set('span angle',ldc0/R1*180/pi);


R3_z = (R1-R3)*sin(ldc0/R1/2);
R3_x = (R1-R3)*cos(ldc0/R1/2);
addarcwaveguide();
set('name','dc1_R3');
set('x',-R3_x);
set('y',y0);
set('z',R3_z);
set('radius',R3+w1/2);
set('radius 2',R3+w1/2);
set('width',w1);
set('y span',wg_h);
set('start angle',-(180-(90-ldc0/R1*180/pi/2)));
set('span angle',180);

R32_z = (R1-R3)*cos(theta_span*pi/180-ldc0/R1/2-ldc0/R1-pi/2);
R32_x = (R1-R3)*sin(theta_span*pi/180-ldc0/R1/2-ldc0/R1-pi/2);
addarcwaveguide();
set('name','dc2_R3');
set('x',R32_x);
set('y',y0);
set('z',R32_z);
set('radius',R3+w1/2);
set('radius 2',R3+w1/2);
set('width',w1);
set('y span',wg_h);
set('start angle',-(theta_span*pi/180-ldc0/R1/2-ldc0/R1-pi/2)*180/pi);
set('span angle',180);

addarcwaveguide();
set('name','dc_R4');
set('x',x0);
set('y',y0);
set('z',z0);
set('radius',R4+w1/2);
set('radius 2',R4+w1/2);
set('width',w1);
set('y span',wg_h);
set('start angle',((90-ldc0/R1*180/pi/2)));
set('span angle',360-(theta_span-2*ldc0/R1*180/pi));

addrect();
set('name','line#1');
set('x',R2+w2+gap);
set('y',y0);
set('z',z0);
set('x span',w2);
set('y span',wg_h);
set('z span',wg_l);

addrect();
set('name','line#2');
set('x',-(R2+w2+gap));
set('y',y0);
set('z',z0);
set('x span',w2);
set('y span',wg_h);
set('z span',wg_l);

addportsource();
set('name','source');
set('incident axis','z');
set('direction','forward');
set('wave shap','mode');
set('incident mode',1);
set('total mode',3);
set('wave','gaussian');
set('central wavelength',wl);
set('amplitude',1);
%set('mode tetm','te'); %2D or 2.5D
set('pulse width',0.031000);
set('pulse offset',0.093000);
set('x',R2+w2+gap);
set('y',y0);
set('z',-R2);
set('y span',1);
set('x span',2);


addfieldmonitor();
set('name','through');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('enable mode expansion','true');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x',R2+w2+gap);
set('y',y0);
set('z',R2);
set('x span',2);
set('y span',1);

addfieldmonitor();
set('name','drop');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('enable mode expansion','true');
set('incident mode',1);
set('total mode',3);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('x',-(R2+w2+gap));
set('y',y0);
set('z',-R2);
set('x span',2);
set('y span',1);

selectall();
pin();
