pi=3.1415926;
px=0;
py=0;
pz=0;
h=0.22;

width=0.45;

da=1.5;

wa=1.5;
wio=1.5;
lt=10;
lio=5;
na=25;
no=3;
r=5;
wl=1.55;
dwl=0.008;
neff_2d=2.281257;
lf=da*da*neff_2d/(dwl*na);

dl=na*wl/neff_2d;

rr=wio*lt/(wio-width);
rra=wa*lt/(wa-width)
daa=2*(asin(da/2/lf));
da0=daa*180/pi;
aa1=asin(wio/2/rr)*180/pi;
aa2=asin(wa/2/rra)*180/pi;
dao=2*(asin(da/lf));
dao0=dao*180/pi;

addsector();
set('name','FPR_0');
set('material','2Dsi_index2.5605');
set('z pos',pz);
set('x pos',px);
set('y pos',py);
set('y span',h);
set('radius',lf/2);
set('radius 2',lf/2);
set('start angle',90-(na+2)*da0/2);
set('span angle',(na+2)*da0);
pin

addsector();
set('name','FPR_0');
set('material','2Dsi_index2.5605');
set('z pos',pz);
set('x pos',px-lf/2);
set('y pos',py);
set('y span',h);
set('radius',lf);
set('radius 2',lf);
set('start angle',-(90+(na+2)*da0/2));
set('span angle',(na+2)*da0);
pin

addlineartaper();
set('material','2Dsi_index2.5605');
set('y rotation', 90);
set('start center x',-lf/2*cos((na+2)*daa/2));
set('start center z',pz);
set('start width',lf*sin((na+2)*daa/2));
set('end center x',lf*cos((na+2)*daa/2)-lf/2);
set('end center z',pz);
set('end width',2*lf*sin((na+2)*daa/2));
set('y pos',py);
set('y span',h);
pin
//source
addportsource();
set('name','source');
set('incident axis','x');
set('direction','forward');
set('amplitude',1);
set('wave shape','mode');
set('incident mode',1);
set('total mode',1);
set('wave','gaussian');
set('central wavelength',wl);
set('x pos',-(lf/2+lt+lio/2));
set('z pos',pz);
set('z span',2);
set('y pos',py);
set('y span',2);
pin

addrect();//in 
set('name','input_rect');
set('material','2Dsi_index2.5605');
set('x pos',-(lf/2+lt+lio/2));
set('x span',lio);
set('z pos',pz);
set('z span',width);
set('y pos',py);
set('y span',h);

addarcwaveguide();//in
set('name','input_rect');
set('material','2Dsi_index2.5605');
set('x pos',-rr-lf/2);
set('z pos',pz);
set('y pos',py);
set('y span',h);
set('radius',rr+0.2);
set('radius 2',rr+0.2);
set('width',lt+0.2);

set('start angle',-90-aa1);
set('span angle',2*aa1);


for(i=1:na)
aa=pi/2+(na-1)/2*daa-(i-1)*daa;
raa=aa-pi/2;
aa0=aa*180/pi;
zas=pz+lf*cos(aa);
xas=(-lf/2)+lf*sin(aa);

xae=(-lf/2)+(lf+lt)*sin(aa);
zae=pz+(lf+lt)*cos(aa);


rx=(-lf/2)+(rra+lf)*sin(aa);
rz=pz+(rra+lf)*cos(aa);


addarcwaveguide();
set('name','in_AWG');
set('material','2Dsi_index2.5605');
set('x pos',rx);
set('z pos',rz);
set('y pos',py);
set('y span',h);
set('radius',rra+0.2);
set('radius 2',rra+0.2);
set('width',lt+0.2);
set('start angle',180-aa0-aa2);
set('span angle',2*aa2);
pin
raaa=raa*180/pi;


if(raaa>0&&abs(raa*180/pi)>0.0001)
addarcwaveguide();
set('name','inr_AWG');
set('material','2Dsi_index2.5605');
set('x pos',xae+(r-width/2)*sin(raa));
set('z pos',zae+(r-width/2)*cos(raa));
set('y pos',py);
set('y span',h);
set('radius',r);
set('radius 2',r);
set('width',width);
set('start angle',180-raa*180/pi);
set('span angle',raa*180/pi);
pin

else if(raaa<0&&abs(raa*180/pi)>0.0001)
addarcwaveguide();
set('name','inr_AWG'); 
set('material','2Dsi_index2.5605');
set('x pos',xae+(r-width/2)*abs(sin(raa)));
set('z pos',zae-(r-width/2)*cos(raa));
set('y pos',py);
set('y span',h);
set('radius',r);
set('radius 2',r);
set('width',width);
set('start angle',0);
set('span angle',abs(raa*180/pi));
pin
end
end
end

addarcwaveguide();
set('name','r_AWG'); 
set('material','2Dsi_index2.5605');
set('x pos',xae+(r-width/2)*abs(sin(raa)));
set('z pos',zae-(r-width/2)*cos(raa)+2*r-width);
set('y pos',py);
set('y span',h);
set('radius',r);
set('radius 2',r);
set('width',width);
set('start angle',-180);
set('span angle',180);
pin

//right 
cz=zae-(r-width/2)*cos(raa)+2*r-width;

addsector();
set('name','FPR_1');
set('material','2Dsi_index2.5605');
set('z pos',2*cz+pz);
set('x pos',px);
set('y pos',py);
set('y span',h);
set('radius',lf/2);
set('radius 2',lf/2);
set('start angle',90-(na+2)*da0/2);
set('span angle',(na+2)*da0);
pin

addsector();
set('name','FPR_1');
set('material','2Dsi_index2.5605');
set('z pos',2*cz+pz);
set('x pos',px-lf/2);
set('y pos',py);
set('y span',h);
set('radius',lf);
set('radius 2',lf);
set('start angle',-(90+(na+2)*da0/2));
set('span angle',(na+2)*da0);
pin

addlineartaper();
set('start center x',(lf*cos((na+2)*daa/2)-lf/2-lf/2*cos((na+2)*daa/2))/2);
set('start center z',2*cz-pz-(lf*cos((na+2)*daa/2)-lf/2+lf/2*cos((na+2)*daa/2))/2);
set('start width',lf*sin((na+2)*daa/2));
set('end center x',(lf*cos((na+2)*daa/2)-lf/2-lf/2*cos((na+2)*daa/2))/2);
set('end center z',2*cz+pz+(lf*cos((na+2)*daa/2)-lf/2+lf/2*cos((na+2)*daa/2))/2);
set('end width',2*lf*sin((na+2)*daa/2));
set('y pos',py);
set('y span',h);
set('y rotation', 90) ;
set('material','2Dsi_index2.5605');
pin



for(i=1:na)
aa=pi/2+(na-1)/2*daa-(i-1)*daa;
raa=aa-pi/2;
aa0=aa*180/pi;
zas=pz+lf*cos(aa);
xas=(-lf/2)+lf*sin(aa);

xae=(-lf/2)+(lf+lt)*sin(aa);
zae=pz+(lf+lt)*cos(aa);

rx=(-lf/2)+(rra+lf)*sin(aa);
rz=pz+(rra+lf)*cos(aa);


addarcwaveguide();
set('name','out_AWG');
set('material','2Dsi_index2.5605');
set('x pos',rx);
set('z pos',2*cz+rz);
set('y pos',py);
set('y span',h);
set('radius',rra+0.2);
set('radius 2',rra+0.2);
set('width',lt+0.2);
set('start angle',180-aa0-aa2);
set('span angle',2*aa2);
pin

raaa=raa*180/pi;


if(raaa>0&&abs(raa*180/pi)>0.0001)
addarcwaveguide();
set('name','outr_AWG');
set('material','2Dsi_index2.5605');
set('x pos',xae+(r-width/2)*sin(raa));
set('z pos',2*cz+zae+(r-width/2)*cos(raa));
set('y pos',py);
set('y span',h);
set('radius',r);
set('radius 2',r);
set('width',width);
set('start angle',180-raa*180/pi);
set('span angle',raa*180/pi);
pin
else if(raaa<0&&abs(raa*180/pi)>0.0001)
addarcwaveguide();
set('name','outr_AWG'); 
set('material','2Dsi_index2.5605');
set('x pos',xae+(r-width/2)*abs(sin(raa)));
set('z pos',2*cz+zae-(r-width/2)*cos(raa));
set('y pos',py);
set('y span',h);
set('radius',r);
set('radius 2',r);
set('width',width);
set('start angle',0);
set('span angle',abs(raa*180/pi));
pin
end
end
end

//output tapers and rects
for(i=1:no)
//daoo=pi-(no-1)*dao+(i-1)*dao;
//daooa=(pi-(daoo+pi/2)/2);
//daoa=abs(daooa-pi/2);
//daoaa=daoa*180/pi;
daoa=abs((no-1)*dao/2-(i-1)*dao);
daoaa=daoa*180/pi;
zt=(rr+lf*cos(daoa/2))*sin(daoa/2);
xt=abs((rr+lf*cos(daoa/2))*cos(daoa/2));
zr=(lt+lf*cos(daoa/2))*sin(daoa/2);
xr=abs((lt+lf*cos(daoa/2))*cos(daoa/2));
no1=(no+1)/2;
if(i<no1)
addarcwaveguide();
set('name','output_taper');
set('material','2Dsi_index2.5605');
set('x pos',-xt+lf/2);
set('z pos',2*cz-zt);
set('y pos',py);
set('y span',h);
set('radius',rr+1.5);
set('radius 2',rr+1.5);
set('width',lt+1.5);
set('start angle',-(90-daoaa/2+aa1));
set('span angle',2*aa1);
pin
addrect(); 
set('name','output_rect');
set('material','2Dsi_index2.5605');
set('x pos',-xr+lf/2-lio/2);
set('x span',lio+0.2);
set('z pos',2*cz-zr);
set('z span',width);
set('y pos',py);
set('y span',h);
pin
//monitor
addfieldmonitor();
set('name','monitor');
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('spatial','2d x');
set('data monitoring','frequency');
set('components','ex ey ez hx hy hz px py pz');
set('x pos',-xr+lf/2-lio/2);
set('x span',2);
set('z pos',2*cz-zr);
set('z span',2);
set('y pos',py);
set('y span',2); 
pin

addarcwaveguide();
set('name','output_taper');
set('material','2Dsi_index2.5605');
set('x pos',-xt+lf/2);
set('z pos',2*cz+zt);
set('y pos',py);
set('y span',h);
set('radius',rr+1.5);
set('radius 2',rr+1.5);
set('width',lt+1.5);
set('start angle',-(90+daoaa/2)-aa1);
set('span angle',2*aa1);
pin
addrect(); 
set('name','output_rect');
set('material','2Dsi_index2.5605');
set('x pos',-xr+lf/2-lio/2);
set('x span',lio+0.2);
set('z pos',2*cz+zr);
set('z span',width);
set('y pos',py);
set('y span',h);
pin
//monitor
addfieldmonitor();
set('name','monitor');
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('spatial','2d x');
set('data monitoring','frequency');
set('components','ex ey ez hx hy hz px py pz');
set('x pos',-xr+lf/2-lio/2);
set('x span',2);
set('z pos',2*cz+zr);
set('z span',2);
set('y pos',py);
set('y span',2); 
pin

else if(i==no1)
addrect();//in 
set('name','output_rect');
set('material','2Dsi_index2.5605');
set('x pos',-(lf/2+lt+lio/2));
set('x span',lio);
set('z pos',2*cz+pz);
set('z span',width);
set('y pos',py);
set('y span',h);
pin

addarcwaveguide();//in
set('name','output_r');
set('material','2Dsi_index2.5605');
set('x pos',-rr-lf/2);
set('z pos',2*cz+pz);
set('y pos',py);
set('y span',h);
set('radius',rr+0.2);
set('radius 2',rr+0.2);
set('width',lt+0.2);
set('start angle',-90-aa1);
set('span angle',2*aa1);
pin

addfieldmonitor();
set('name','monitor');
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('spatial','2d x');
set('data monitoring','frequency');
set('components','ex ey ez hx hy hz px py pz');
set('x pos',-(lf/2+lt+lio/2));
set('x span',2);
set('z pos',2*cz+pz);
set('z span',2);
set('y pos',py);
set('y span',2);
pin 


end

end
end

//awgs
l2=0;
l3=0;
ll0=0;
aa0=(pi-(na-1)*daa)/2;
raa0=abs(aa0-pi/2);
ll0=pi*r+l2*2+l3+r*raa0*2;

m1=((na-1)/2);
for(i=1:m1) 
aa=(pi-(na-1)*daa)/2+i*daa;
raa=abs(aa-pi/2);
xae=(-lf/2)+(lf+lt)*sin(aa);
zae=pz+(lf+lt)*cos(aa);
raaa=aa*180/3.1415826;

ll0=ll0+dl;
//ll0=pi*r+l2*2+l3+r*raa*2;
rcx=xae+(r-width/2)*abs(sin(raa));
rcz=zae-(r-width/2)*cos(raa)+r-width/2;
l3=2*(cz-rcz-r);
l2=(ll0-l3-pi*r-r*raa*2)/2;

//lief AWG_rect

addrect();
set('name','AWG_l2');
set('material','2Dsi_index2.5605');
set('z pos',rcz);
set('z span',width);
set('x pos',rcx+l2/2);
set('x span',l2);
set('y pos',py);
set('y span',h);
pin
//right AWG_rect
addrect();
set('name','AWG_l2');
set('material','2Dsi_index2.5605');
set('z pos',2*cz-rcz);
set('z span',width);
set('x pos',rcx+l2/2);
set('x span',l2);
set('y pos',py);
set('y span',h);
pin
//life AWG_r
addarcwaveguide();
set('name','AWG_r');
set('material','2Dsi_index2.5605');
set('z pos',rcz+r);
set('x pos',rcx+l2);
set('y pos',py);
set('y span',h);
set('radius',r+width/2);
set('radius 2',r+width/2);
set('width',width);
set('start angle',-180);
set('span angle',90);
pin
//right AWG_r
addarcwaveguide();
set('name','AWG_r');
set('material','2Dsi_index2.5605');
set('z pos',2*cz-rcz-r);
set('x pos',rcx+l2);
set('y pos',py);
set('y span',h);
set('radius',r+width/2);
set('radius 2',r+width/2);
set('width',width);
set('start angle',-90);
set('span angle',90);
pin
addrect();
set('name','AWG_l3');
set('material','2Dsi_index2.5605');
set('z pos',cz);
set('z span',l3);
set('x pos',rcx+l2+r);
set('x span',width);
set('y pos',py);
set('y span',h);
pin
end

m2=((na-1)/2+1);
m3=(na-1);
for(i=m2:m3) 
aa=(pi-(na-1)*daa)/2+i*daa;
raa=abs(aa-pi/2);
xae=(-lf/2)+(lf+lt)*abs(sin(aa));
zae=pz+(lf+lt)*cos(aa);
raaa=aa*180/3.1415826;

ll0=ll0+dl;
//ll0=pi*r+l2*2+l3+r*raa*2;
rcx=xae+(r-width/2)*abs(sin(raa));
rcz=zae+(r-width/2)*cos(raa)-r+width/2;
l3=2*(cz-rcz-r);
l2=(ll0-l3-pi*r-r*raa*2)/2;

//lief AWG_rect

addrect();
set('name','AWG_l2');
set('material','2Dsi_index2.5605');
set('z pos',rcz);
set('z span',width);
set('x pos',rcx+l2/2);
set('x span',l2);
set('y pos',py);
set('y span',h);
pin
//right AWG_rect
addrect();
set('name','AWG_l2');
set('material','2Dsi_index2.5605');
set('z pos',2*cz-rcz);
set('z span',width);
set('x pos',rcx+l2/2);
set('x span',l2);
set('y pos',py);
set('y span',h);
pin
//life AWG_r
addarcwaveguide();
set('name','AWG_r');
set('material','2Dsi_index2.5605');
set('z pos',rcz+r);
set('x pos',rcx+l2);
set('y pos',py);
set('y span',h);
set('radius',r+width/2);
set('radius 2',r+width/2);
set('width',width);
set('start angle',-180);
set('span angle',90);
pin
//right AWG_r
addarcwaveguide();
set('name','AWG_r');
set('material','2Dsi_index2.5605');
set('z pos',2*cz-rcz-r);
set('x pos',rcx+l2);
set('y pos',py);
set('y span',h);
set('radius',r+width/2);
set('radius 2',r+width/2);
set('width',width);
set('start angle',-90);
set('span angle',90);
pin
addrect();
set('name','AWG_l3');
set('material','2Dsi_index2.5605');
set('z pos',cz);
set('z span',l3);
set('x pos',rcx+l2+r);
set('x span',width);
set('y pos',py);
set('y span',h);
pin
end





