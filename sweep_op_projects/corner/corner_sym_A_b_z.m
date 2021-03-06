deleteall();
clear(x_z);clear(z_s);clear(x_z_all);clear(z);clear(v);clear(v_add);
%使用修改过的洛伦兹函数
set('global variable','pi=3.1415926');
set('global variable','theta=45');

set('global variable','wg_w=0.5');
set('global variable','gap=0.2');
set('global variable','wg_l=3');
set('global variable','wg_h=0.22');

%set('global variable','b3=0.5');
%set('global variable','b2=0.5');
set('global variable','b1=1');
%set('global variable','z3=1');
%set('global variable','z2=0.5');
%set('global variable','z1=0.2');
%set('global variable','A3=3');
set('global variable','A2=-4');
set('global variable','A1=5');

A3 = A1;
b3 = b1;

%set('global variable','b3_d=0.2');
%set('global variable','b2_d=0.4');
set('global variable','b1_d=1');
%set('global variable','z3_d=0.9');
%set('global variable','z2_d=0.7');
%set('global variable','z1_d=0.3');
%set('global variable','A3_d=3');
set('global variable','A2_d=-4');
set('global variable','A1_d=5');
A3_d = A1_d;
b3_d = b1_d;


set('global variable','a=1');
set('global variable','b=0.8');

wl = 1.550;
%wg_h = 0.22;
%wg_w = 0.5;
%wg_l = 3;

%theta = 45; %拐角处的corner的角度
%a = 0.72;   %	corner拐角处的垂直长度



z0 = 0;
x0 = 1;
zt = a/sin(theta*pi/180);
xt = 1;
nz = 100;
z_s = linspace(z0,zt,nz);
z = linspace(z0,2*zt,nz+2);
x_z = linspace(0,xt,nz);
x_z_all = linspace(-xt,xt,nz+2);
z_r = 0.01;	
z1 = z0+z_r;
z3 = zt-z_r;
z2 = (zt-z0)/2;

b2_2 = (z0-z2)^2/((A2/(x0-A1*b1^2/((z0-z3)^2+b1^2)-A1*b1^2/((z0-z1)^2+b1^2)))-1);
%% x_z(z)=b0^2/((z-z0)^2+b0^2)(A1*b1^2/((z-z1)^2+b1^2)+A2*b2^2/((z-z2)^2+b2^2)+A3*b3^2/((z-z3)^2+b3^2))

for (n = 1:nz)

    x_z(n) = (A1*b1^2/((z_s(n)-z1)^2+b1^2)+A2*b2_2/((z_s(n)-z2)^2+b2_2)+A3*b3^2/((z_s(n)-z3)^2+b3^2));
end
for (n = 1:nz)
    z(n) = z_s(n);
    x_z_all(n) = real(x_z(n)-1);
end

z(n+1) = z(n)-wg_w/2*sin(theta*pi/180);
z(n+2) = z(1)+wg_w/2*sin(theta*pi/180);

x_z_all(n+1) = -wg_w/2*sin(theta*pi/180);
x_z_all(n+2) = -wg_w/2*sin(theta*pi/180);

v(1:(nz+2),1) = z';
v(1:(nz+2),2) = x_z_all';
addpoly();

set('vertices',v);
set('name','corner_up');
set('y span',wg_h);
set('y rotation','-theta');

clear(x_z);clear(z_s);clear(x_z_all);clear(z);clear(v);
z0 = (a-wg_w);
x0 = -b-wg_w;
zt = z0+(b)/sin(theta*pi/180);
xt = -b-wg_w;
nz = 100;
z_s = linspace(z0,zt,nz);
z = linspace(z0,2*zt,nz+2);
x_z = linspace(0,xt,nz);
x_z_all = linspace(-xt,xt,nz+2);

z1_d = z0+0.01;
z2_d = (zt+z0)/2;
z3_d = zt-0.01;

b2_2 = (z0-z2_d)^2/((A2_d/(x0-A1_d*b1_d^2/((z0-z3_d)^2+b1_d^2)-A1_d*b1_d^2/((z0-z1_d)^2+b1_d^2)))-1);

for (n = 1:nz)

     x_z(n) = (A1_d*b1_d^2/((z_s(n)-z1_d)^2+b1_d^2)+A2_d*b2_2/((z_s(n)-z2_d)^2+b2_2)+A3_d*b3_d^2/((z_s(n)-z3_d)^2+b3_d^2));
end
for (n = 1:nz)
    z(n) = z_s(n)-z0;
    %z(n) = z_s(n);
    x_z_all(n) = real(x_z(n)-x0);
    %x_z_all(n) = real(x_z(n));
end

z(n+1) = z(n)+wg_w/2*sin(theta*pi/180);
z(n+2) = z(1)-wg_w/2*sin(theta*pi/180);

x_z_all(n+1) = x_z_all(n)-wg_w*sin(theta*pi/180)/2;
x_z_all(n+2) = x_z_all(n)-wg_w*sin(theta*pi/180)/2;

v(1:(nz+2),1) = z';
v(1:(nz+2),2) = x_z_all';
addpoly();
set('vertices',v);
set('x','-b-wg_w');
set('z','a-wg_w');
set('name','corner_down');
set('y span',wg_h);
set('y rotation','90+theta');

z_add = [-b+(a-wg_w),0,a-wg_w+wg_w/2,a-wg_w+wg_w/2];
x_add = [-wg_w/2,-wg_w/2,-a,-a-(b-(a-wg_w))];
v_add(1:4,1) = z_add';
v_add(1:4,2) = x_add';
addpoly();
set('name','corner_add');
set('vertices',v_add);
set('y span',wg_h);


addrect();
set('name','level_a');
set('x','-wg_w/4');
set('y',0);
set('z','-wg_l/2');
set('x span','wg_w/2');
set('y span',wg_h);
set('z span','wg_l');

addrect();
set('name','level_b');
set('x','-3*wg_w/4');
set('y',0);
set('z','-(wg_l-(b-(a-wg_w)))/2-(b-a+wg_w)');
set('x span','wg_w/2');
set('y span',wg_h);
set('z span','wg_l-(b-(a-wg_w))');

addportsource();
set('name','source');
set('x','-wg_w/2');
set('y',0);
set('z','-(wg_l-(b-(a-wg_w)))/2-(b-a+wg_w)');
set('x span',2);
set('y span',1);
set('total mode',3);

addrect();
set('name','vertical_a');
set('x','-a-wg_l/2');
set('y',0);
set('z','a-wg_w/4');
set('x span','wg_l');
set('y span',wg_h);
set('z span','wg_w/2');

addrect();
set('name','vertical_b');
set('x','-(wg_l-(b-(a-wg_w)))/2-wg_w-b');
set('y',0);
set('z','a-3*wg_w/4');
set('x span','wg_l-(b-(a-wg_w))');
set('y span',wg_h);
set('z span','wg_w/2');

addfieldmonitor();
set('name','monitor');
set('spatial','2d x');
set('x','-(wg_l-(b-(a-wg_w)))/2-wg_w-b');
set('y',0);
set('z','a-wg_w/2');
set('z span',2);
set('y span',1);
set('total mode',3);
set('enable mode expansion','true');

selectall();
pin();
unselectall();

