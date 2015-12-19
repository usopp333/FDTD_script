selectall();
delete();
clear(x_z);clear(z1);clear(x_z_all);clear(z);clear(v);
set('global variable','a=-0.4574');
set('global variable','b=2.8552');
set('global variable','c=-6.3248');
set('global variable','d=5.5619');
set('global variable','e=-1.3210');
wl = 1.550;
wg_h = 0.22;
wg_w = 0.5;
wg_l = 3;
gap = 0.2;
w = wg_w;
mmi_l = 2;

%设置函数的类型为a*x^6+b*x^5+c*x^4+d*x^3+e*x^2+f*x+g

nz = 100;
z_s = linspace(0,mmi_l,nz);
z = linspace(0,2*mmi_l,2*nz);
x_z = linspace(w/2,w+gap/2,nz);
x_z_all = linspace(-w-gap/2,w+gap/2,2*nz);
% w1 = [0.5,0.5,0.6,0.7,0.9,1.26,1.4,1.4,1.4,1.4,1.31,1.2,1.2];
% z1 = linspace(0,2,length(w1));
% 
% for (n = 1:length(w1))
%     z(n) = z1(n);
%     w(n) = w1(n)/2;
% end
% for (n = length(w1)+1:2*length(w1))
%     z(n) = z1(2*length(w1)+1-n);
%     w(n) = -w1(2*length(w1)+1-n)/2;
% end
% z(n+1) = z(1);
% w(n+1) = w(1);
% v(1:2*length(w1)+1,1) = z';
% v(1:2*length(w1)+1,2) = w';
%% 使用函数 a/((z-z1)^2+b)....进行曲线的拟合
set('global variable','a1=-0.2');
z1 = mmi_l/6;
z2 = mmi_l/2;
z3 = mmi_l;
a3 = (w+gap/2-w/2*(z2^2+1)/((mmi_l-z2)^2+1)-a1*(1/((mmi_l-z1)^2+1)-(z2^2+1)/(z1^2+1)/((mmi_l-z2)^2+1)))/(1/((mmi_l-z3)^2+1)-(z2^2+1)/(z3^2+1)/((mmi_l-z2)^2+1));
a2 = (w/2-a3/(z3^2+1)-a1/(z1^2+1))*(z2^2+1);
%% 使用多项式函数进行曲线的拟合

g = w/2;
f = (w+gap/2-a*(mmi_l)^6-b*(mmi_l)^5-c*(mmi_l)^4-d*(mmi_l)^3-e*(mmi_l)^2-g)/mmi_l;
for (n = 1:nz)
    % 使用多项式函数进行曲线的拟合
    %x_z(n) = a*z_s(n)^6+b*z_s(n)^5+c*z_s(n)^4+d*z_s(n)^3+e*z_s(n)^2+f*z_s(n)+g;
    % 使用函数 a/((z-z1)^2+b)....进行曲线的拟合
    x_z(n) = a1/((z_s(n)-z1)^2+1)+a2/((z_s(n)-z2)^2+1)+a3/((z_s(n)-z3)^2+1);
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
set('z',wg_l/2+2);
set('y',0);
set('x',wg_w/2+gap/2);
set('z span',wg_l);
set('y span',wg_h);
set('x span',wg_w);


addrect();
set('name','out_up');
set('z',wg_l/2+2);
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
set('z',wg_l/4+2);
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
set('z',wg_l/4+2);
set('y',0);
set('x',-wg_w/2-gap/2);
set('x span',0.6);
set('y span',1);

selectall();
pin();
unselectall();