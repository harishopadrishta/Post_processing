A1 = importdata('uy_contour0001000.dat');
A2 = importdata('uy_contour0002000.dat');
A3 = importdata('uy_contour0003000.dat');
A4 = importdata('uy_contour0004000.dat');
A5 = importdata('uy_contour0005000.dat');
A6 = importdata('uy_contour0006000.dat');
A7 = importdata('uy_contour0007000.dat');
A8 = importdata('uy_contour0008000.dat');
A9 = importdata('uy_contour0009000.dat');
A10 = importdata('uy_contour0010000.dat');

j = 5;

x1 = A1(j*10000 + 1:(j+1)*10000,1);
z1 = A1(j*10000 + 1:(j+1)*10000,2);
vnum1 = A1(j*10000+1:(j+1)*10000,3);
vth1 = A1(j*10000+1:(j+1)*10000,4);

x2 = A2(j*10000 + 1:(j+1)*10000,1);
z2 = A2(j*10000 + 1:(j+1)*10000,2);
vnum2 = A2(j*10000+1:(j+1)*10000,3);
vth2 = A2(j*10000+1:(j+1)*10000,4);

x3 = A3(j*10000 + 1:(j+1)*10000,1);
z3 = A3(j*10000 + 1:(j+1)*10000,2);
vnum3 = A3(j*10000+1:(j+1)*10000,3);
vth3 = A3(j*10000+1:(j+1)*10000,4);

x4 = A4(j*10000 + 1:(j+1)*10000,1);
z4 = A4(j*10000 + 1:(j+1)*10000,2);
vnum4 = A4(j*10000+1:(j+1)*10000,3);
vth4 = A4(j*10000+1:(j+1)*10000,4);

x5 = A5(j*10000 + 1:(j+1)*10000,1);
z5 = A5(j*10000 + 1:(j+1)*10000,2);
vnum5 = A5(j*10000+1:(j+1)*10000,3);
vth5 = A5(j*10000+1:(j+1)*10000,4);

x6 = A6(j*10000 + 1:(j+1)*10000,1);
z6 = A6(j*10000 + 1:(j+1)*10000,2);
vnum6 = A6(j*10000+1:(j+1)*10000,3);
vth6 = A6(j*10000+1:(j+1)*10000,4);

x7 = A7(j*10000 + 1:(j+1)*10000,1);
z7 = A7(j*10000 + 1:(j+1)*10000,2);
vnum7 = A7(j*10000+1:(j+1)*10000,3);
vth7 = A7(j*10000+1:(j+1)*10000,4);

x8 = A8(j*10000 + 1:(j+1)*10000,1);
z8 = A8(j*10000 + 1:(j+1)*10000,2);
vnum8 = A8(j*10000+1:(j+1)*10000,3);
vth8 = A8(j*10000+1:(j+1)*10000,4);

x9 = A9(j*10000 + 1:(j+1)*10000,1);
z9 = A9(j*10000 + 1:(j+1)*10000,2);
vnum9 = A9(j*10000+1:(j+1)*10000,3);
vth9 = A9(j*10000+1:(j+1)*10000,4);

x10 = A10(j*10000 + 1:(j+1)*10000,1);
z10 = A10(j*10000 + 1:(j+1)*10000,2);
vnum10 = A10(j*10000+1:(j+1)*10000,3);
vth10 = A10(j*10000+1:(j+1)*10000,4);

vcl = 0.05;

for i = 1:10000
    Linf1(i) = abs((vnum1(i) - vth1(i))/(vth1(i)));
    Linf2(i) = abs((vnum2(i) - vth2(i))/(vth2(i)));
    Linf3(i) = abs((vnum3(i) - vth3(i))/(vth3(i)));
    Linf4(i) = abs((vnum4(i) - vth4(i))/(vth4(i)));
    Linf5(i) = abs((vnum5(i) - vth5(i))/(vth5(i)));
    Linf6(i) = abs((vnum6(i) - vth6(i))/(vth6(i)));
    Linf7(i) = abs((vnum7(i) - vth7(i))/(vth7(i)));
    Linf8(i) = abs((vnum8(i) - vth8(i))/(vth8(i)));
    Linf9(i) = abs((vnum9(i) - vth9(i))/(vth9(i)));
    Linf10(i) = abs((vnum10(i) - vth10(i))/(vth10(i)));
    
%     Linf1(i) = abs((vnum1(i) - vth1(i))/vcl);
%     Linf2(i) = abs((vnum2(i) - vth2(i))/vcl);
%     Linf3(i) = abs((vnum3(i) - vth3(i))/vcl);
%     Linf4(i) = abs((vnum4(i) - vth4(i))/vcl);
%     Linf5(i) = abs((vnum5(i) - vth5(i))/vcl);
%     Linf6(i) = abs((vnum6(i) - vth6(i))/vcl);
%     Linf7(i) = abs((vnum7(i) - vth7(i))/vcl);
%     Linf8(i) = abs((vnum8(i) - vth8(i))/vcl);
%     Linf9(i) = abs((vnum9(i) - vth9(i))/vcl);
%     Linf10(i) = abs((vnum10(i) - vth10(i))/vcl);
end
x = reshape(x1,[],100);
z = reshape(z1,[],100);

vnum1 = reshape(vnum1,[],100);
Linf1 = reshape(Linf1,[],100);
vnum2 = reshape(vnum2,[],100);
Linf2 = reshape(Linf2,[],100);
vnum3 = reshape(vnum3,[],100);
Linf3 = reshape(Linf3,[],100);
vnum4 = reshape(vnum4,[],100);
Linf4 = reshape(Linf4,[],100);
vnum5 = reshape(vnum5,[],100);
Linf5 = reshape(Linf5,[],100);
vnum6 = reshape(vnum6,[],100);
Linf6 = reshape(Linf6,[],100);
vnum7 = reshape(vnum7,[],100);
Linf7 = reshape(Linf7,[],100);
vnum8 = reshape(vnum8,[],100);
Linf8 = reshape(Linf8,[],100);
vnum9 = reshape(vnum9,[],100);
Linf9 = reshape(Linf9,[],100);
vnum10 = reshape(vnum10,[],100);
Linf10 = reshape(Linf10,[],100);

% contour(x,z,Linf1,1000);
% colorbar;
% M(1) = getframe;
% contour(x,z,Linf2,1000);
% colorbar;
% M(2) = getframe;
% contour(x,z,Linf3,1000);
% colorbar;
% M(3) = getframe;
% contour(x,z,Linf4,1000);
% colorbar;
% M(4) = getframe;
% contour(x,z,Linf5,1000);
% colorbar;
% M(5) = getframe;
% contour(x,z,Linf6,1000);
% colorbar;
% M(6) = getframe;
% contour(x,z,Linf7,1000);
% colorbar;
% M(7) = getframe;
% contour(x,z,Linf8,1000);
% colorbar;
% M(8) = getframe;
% contour(x,z,Linf9,1000);
% colorbar;
% M(9) = getframe;
figure;
s1=subplot(1,4,1);
contour(x,z,Linf10,10000);
s2=subplot(1,4,2);
contour(x,z,Linf10,10000);
s3=subplot(1,4,3);
contour(x,z,Linf10,10000);
s4=subplot(1,4,4);
contour(x,z,Linf10,10000);
s4pos = get(s4,'position');
colorbar;
set(s4,'position',s4pos);

% M(10) = getframe;

% movie2avi(M,'relative_error_evolution.avi','fps',1,'compression','None');

% movie2avi(M,'error_evolution.avi','fps',1,'compression','None');