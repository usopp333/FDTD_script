
clear(z1);clear(x);clear(z);clear(v);
selectall
delete
in_l = 5;
in_w = 0.5;
taper_start = 0.5;
taper_end = 2;
taper_l = 2;
wg_h = 0.22;
lambda = 1.550;

di = taper_end/2;
do = 0;
l = taper_l;

b = (l-a*((taper_end/2)^2-(in_w/2)^2))/(taper_end/2-in_w/2);
c = -a*(in_w/2)^2-b*(in_w/2);
nx = 100;
x = linspace(0,taper_end/2,nx);
x_t = x(length(x):-1:1); 
x_all = linspace(0,taper_end/2,2*nx);
z1 = linspace(0,taper_end/2,nx);
z = linspace(0,taper_end/2,2*nx);
for (n = 1:nx)
    #%z(n) = di + (di - do)*((1-(l-(n-1)*l/nx)/l)^(1/2)-1);
    %z1(n) = di + (di - do)*((1-(l/nx*n)/l)^(1/2)-1);
    z1(n) = a*(taper_end/2/nx*(n-1))^2+b*(taper_end/2/nx*(n-1))+c;
end
for (n = 1:nx)
    z(n) = z1(n);
    x_all(n) = -x(n); 
end
for (n = (nx+1):2*nx)
    z(n) = z1(2*nx-(n-1));
    x_all(n) = x(2*nx-(n-1)); 
end
v(1:2*nx,1) = z' ;
v(1:2*nx,2) = x_all' ;
addpoly();
set('name','taper');
set('vertices',v);
set('y span',0.22);
pin



addrect();
set('name','input');
set('x pos',0);
set('y pos',0);
set('z pos',-in_l/2);
set('x span',in_w);
set('y span',wg_h);
set('z span',in_l+2);
pin

%addlineartaper();
%set('name','taper');
%set('start center x',0);
%set('start center z',0);
%set('start width',taper_start);
%set('end center x',0);
%set('end center z',taper_l);
%set('end width',taper_end);
%set('y pos',0);
%set('y span',wg_h);
%pin

addrect();
set('name','output');
set('x pos',0);
set('y pos',0);
set('z min',z(nx));
set('x span',taper_end);
set('y span',wg_h);
set('z max',z(nx)+in_l*4);
pin

addportsource();
set('name','source');
set('x pos',0);
set('y pos',0);
set('z pos',-in_l/2);
set('x span',1);
set('y span',1);
set('center wavelength',lambda);
set('incident mode',1);
set('total mode',2);
pin

addfieldmonitor();
set('name','monitor1');
set('x pos',0);
set('y pos',0);
set('z pos',taper_l);
set('x span',taper_end+1);
set('y span',1);
set('components','ex ey ez hx hy hz px py pz');
set('total mode',10);
set('enable mode expansion','true');
pin

addfieldmonitor();
set('name','monitor2');
set('x pos',0);
set('y pos',0);
set('z pos',taper_l+1);
set('x span',taper_end+1);
set('y span',1);
set('components','ex ey ez hx hy hz px py pz');
set('total mode',10);
set('enable mode expansion','true');
pin

addportsource();
set('name','source2');
set('direction','backward');
set('x pos',0);
set('y pos',0);
set('z pos',taper_l+2);
set('x span',taper_end+1);
set('y span',1);
set('center wavelength',lambda);
set('incident mode',1);
set('total mode',10);
pin

addfieldmonitor();
set('name','monitor3');
set('x pos',0);
set('y pos',0);
set('z pos',-1);
set('x span',1);
set('y span',1);
set('components','ex ey ez hx hy hz px py pz');
set('total mode',2);
set('enable mode expansion','true');
pin

addfieldmonitor();
set('name','monitor4');
set('x pos',0);
set('y pos',0);
set('z pos',0);
set('x span',1);
set('y span',1);
set('components','ex ey ez hx hy hz px py pz');
set('total mode',2);
set('enable mode expansion','true');
pin