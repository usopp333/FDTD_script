selectall();
delete();
clear(x_z);clear(z_s);clear(x_z_all);clear(z);clear(v);
%使用修改过的洛伦兹函数
wl = 1.550;
wg_h = 0.22;
wg_w = 0.5;
wg_l = 3;
gap = 0.2;
w = wg_w;
mmi_l = 2;

nz = 100;
z_s = linspace(0,mmi_l,nz);
z = linspace(0,2*mmi_l,2*nz);
x_z = linspace(w/2,w+gap/2,nz);
x_z_all = linspace(-w-gap/2,w+gap/2,2*nz);

z0 = 0;
x0 = w/2;
zt = mmi_l;
xt = w+gap/2;
set('global variable','b3=0.5');
set('global variable','b2=0.5');
set('global variable','b1=0.5');
set('global variable','z3=1.8');
set('global variable','z2=1');
set('global variable','z1=0.2');
set('global variable','A3=3');
set('global variable','A2=2');
set('global variable','A1=1');


f1_z0 = (A1*exp(-(z0-z1)^2/b1^2));
f2_z0 = (A2*exp(-(z0-z2)^2/b2^2));
f3_z0 = (A3*exp(-(z0-z3)^2/b3^2));
f1_zt = (A1*exp(-(zt-z1)^2/b1^2));
f2_zt = (A2*exp(-(zt-z2)^2/b2^2));
f3_zt = (A3*exp(-(zt-z3)^2/b3^2));
f_z0 = (f1_z0+f2_z0+f3_z0);
f_zt = (f1_zt+f2_zt+f3_zt);
z_0_1 = -(2*zt + ((zt^2 - (z0^2*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))*((4*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))) - 4) + (2*zt - (2*z0*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))^2)^(1/2) - (2*z0*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))/((2*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))) - 2);

z_0_2 = (((zt^2 - (z0^2*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))*((4*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))) - 4) + (2*zt - (2*z0*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))^2)^(1/2) - 2*zt + (2*z0*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))/((2*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))) - 2);

b_022 = -(z0 + (2*zt + ((zt^2 - (z0^2*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))*((4*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))) - 4) + (2*zt - (2*z0*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))^2)^(1/2) - (2*z0*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))))/((2*log(xt/(A1/exp((z1 - zt)^2/b1^2) + A2/exp((z2 - zt)^2/b2^2) + A3/exp((z3 - zt)^2/b3^2))))/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2))) - 2))^2/log(x0/(A1/exp((z0 - z1)^2/b1^2) + A2/exp((z0 - z2)^2/b2^2) + A3/exp((z0 - z3)^2/b3^2)));
	

%% x_z(z)=b0^2/((z-z0)^2+b0^2)(A1*b1^2/((z-z1)^2+b1^2)+A2*b2^2/((z-z2)^2+b2^2)+A3*b3^2/((z-z3)^2+b3^2))

for (n = 1:nz)

    x_z(n) = exp(-(z_s(n)-z_0_1)^2/b_022)*(A1*exp(-(z_s(n)-z1)^2/b1^2)+A2*exp(-(z_s(n)-z2)^2/b2^2)+A3*exp(-(z_s(n)-z3)^2/b3^2));
end
for (n = 1:nz)
    z(n) = z_s(n);
    x_z_all(n) = x_z(n);
end
for (n = nz+1:2*nz)
    z(n) = z_s(2*nz+1-n);
    x_z_all(n) = -x_z(2*nz+1-n);
end

v(1:2*nz,1) = z';
v(1:2*nz,2) = x_z_all';
addpoly();
set('vertices',v);
set('name','taper');
set('y span',wg_h);



addrect();
set('name','input');
set('z',-wg_l/2);
set('y',0);
set('x',0);
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);

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
set('z',-wg_l/4);
set('y',0);
set('x',0);
set('y span',1);
set('x span',0.6);


addrect();
set('name','out_up');
set('z',wg_l/2+mmi_l);
set('y',0);
set('x',wg_w/2+gap/2);
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);


addrect();
set('name','out_down');
set('z',wg_l/2+mmi_l);
set('y',0);
set('x',-wg_w/2-gap/2);
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);

addfieldmonitor();
set('name','momitor_up');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('enable mode expansion','true');
set('incident mode',1);
set('total mode',1);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('z',wg_l/4+mmi_l);
set('y',0);
set('x',wg_w/2+gap/2);
set('x span',0.6);
set('y span',1);

addfieldmonitor();
set('name','momitor_down');
set('spatial','2d z');
set('data moniotring','frequence');
set('components','px py pz');
set('enable mode expansion','true');
set('incident mode',1);
set('total mode',1);
set('central wavelength',wl);
set('wavelength span',0.1*wl);
set('wavelength spacing',0.001*wl);
set('z',wg_l/4+mmi_l);
set('y',0);
set('x',-wg_w/2-gap/2);
set('x span',0.6);
set('y span',1);

selectall();
pin();
unselectall();