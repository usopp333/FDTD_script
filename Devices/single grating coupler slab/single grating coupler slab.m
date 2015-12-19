x0=0;
y0=0;
z0=0;
pi=3.1415926;            
wl=1.55;

wg=11;
hg=0.34;
he=0.1;
t=0.54;
n=22;

wf=10;
daf=8;
lf=10;
sf=1;

wte=11;
wts=0.35;
lt=10;
ht=0.34;

w=0.35;
l=5;
h=0.34;

hbox=2;
lbox=n*t+lt+l+5;
wbox=wg+5;

addrect(x0-h/2-hbox/2,y0,z0);
set('name','BOX');
set('material','Silica');
set('x span',hbox);
set('y span',wbox);
set('z span',lbox);

addrect(-hg/2+(hg-he)/2,y0,(l+lt+n*t)/2-n*t/2);
set('name','grating_bottom');
set('x span',hg-he);
set('y span',wg);
set('z span',n*t);

for(i=1:n)
addrect(hg/2-he/2,y0,-(l+lt+n*t)/2+l+lt+(i-1)*t+t/4);
set('name','grating');
set('x span',he);
set('y span',wg);
set('z span',t/2);

end

addrect(x0,y0,-(l+lt+n*t)/2+l+lt+(i-1)*t+t/4+1);
set('name','slab');
set('x span',hg);
set('y span',wg);
set('z span',2);

addlineartaper(x0,y0,-(l+lt+n*t)/2+l+lt/2);
set('name','taper');
set('z rotation',90);
set('start center z',-(l+lt+n*t)/2+l);
set('start center x',x0);
set('start width',wts);
set('end center z',-(l+lt+n*t)/2+l+lt);
set('end center x',x0);
set('end width',wte);
set('y span',ht);

addrect(x0,y0,-(l+lt+n*t)/2+l/2);
set('name','strating');
set('x span',h);
set('y span',w);
set('z span',l);

%set fiber
rdaf=daf*pi/180;
xf=(lf/2+sf/sin(pi/2-rdaf))*sin(pi/2-rdaf);
zf=((l+lt+n*t)/2-n*t/2)+(lf/2+sf/sin(pi/2-rdaf))*cos(pi/2-rdaf)
addcircle(xf+h/2,y0,zf);
set('name','fiber');
set('material','Silica');
set('radius',wf/2);
set('x rotation',90);
set('y rotation',90-8);
set('y span',lf);


addportsource(x0,y0,-(l+lt+n*t)/2+l/2);
set('name','source');
set('incident axis','z');
set('direction','forward');
set('wave shap','mode');
set('incident mode',1);
set('total mode',3);
set('y span',2);
set('x span',2);
set('wave','gaussian')
set('central wavelength',wl);


selectall
pin