% B1 = importdata('ux_contour0002000.dat');
% B2 = importdata('ux_contour0004000.dat');
% B3 = importdata('ux_contour0006000.dat');
% B4 = importdata('ux_contour0008000.dat');
B5 = importdata('ux_contour0010000.dat');

% C1 = importdata('uz_contour0002000.dat');
% C2 = importdata('uz_contour0004000.dat');
% C3 = importdata('uz_contour0006000.dat');
% C4 = importdata('uz_contour0008000.dat');
C5 = importdata('uz_contour0010000.dat');
j = 5;

% x2 = B1(j*10000 + 1:(j+1)*10000,1);
% z2 = B1(j*10000 + 1:(j+1)*10000,2);
% ux2 = B1(j*10000 + 1:(j+1)*10000,3);
% uz2 = C1(j*10000 + 1:(j+1)*10000,3);
% 
% x4 = B2(j*10000 + 1:(j+1)*10000,1);
% z4 = B2(j*10000 + 1:(j+1)*10000,2);
% ux4 = B2(j*10000 + 1:(j+1)*10000,3);
% uz4 = C2(j*10000 + 1:(j+1)*10000,3);
% 
% x6 = B3(j*10000 + 1:(j+1)*10000,1);
% z6 = B3(j*10000 + 1:(j+1)*10000,2);
% ux6 = B3(j*10000 + 1:(j+1)*10000,3);
% uz6 = C3(j*10000 + 1:(j+1)*10000,3);
% 
% x8 = B4(j*10000 + 1:(j+1)*10000,1);
% z8 = B4(j*10000 + 1:(j+1)*10000,2);
% ux8 = B4(j*10000 + 1:(j+1)*10000,3);
% uz8 = C4(j*10000 + 1:(j+1)*10000,3);

x10 = B5(j*95*95 + 1:(j+1)*95*95,1);
z10 = B5(j*95*95 + 1:(j+1)*95*95,2);
ux10 = B5(j*95*95 + 1:(j+1)*95*95,3);
uz10 = C5(j*95*95 + 1:(j+1)*95*95,3);
C = [x10 z10 ux10 uz10];
% M = numel(x10);
% % 
% index = 1:25:M;

% x2 = reshape(x2(index),[],25);
% z2 = reshape(z2(index),[],25);
% ux2 = reshape(ux2(index),[],25);
% uz2 = reshape(uz2(index),[],25);
% 
% x4 = reshape(x4(index),[],25);
% z4 = reshape(z4(index),[],25);
% ux4 = reshape(ux4(index),[],25);
% uz4 = reshape(uz4(index),[],25);
% 
% x6 = reshape(x6(index),[],25);
% z6 = reshape(z6(index),[],25);
% ux6 = reshape(ux6(index),[],25);
% uz6 = reshape(uz6(index),[],25);
% 
% x8 = reshape(x8(index),[],25);
% z8 = reshape(z8(index),[],25);
% ux8 = reshape(ux8(index),[],25);
% uz8 = reshape(uz8(index),[],25);

x10 = reshape(x10,[],95);
z10 = reshape(z10,[],95);
ux10 = reshape(ux10,[],95);
uz10 = reshape(uz10,[],95);

% subplot(1,4,1);
% quiver(x2,z2,ux2,uz2,5);
% subplot(1,4,2);
% quiver(x2,z2,ux2,uz2,5);
% subplot(1,4,3);
% quiver(x2,z2,ux2,uz2,5);
% subplot(1,4,4);
scalefactor = 5000;
figure;
quiver(x10,z10,ux10*scalefactor,uz10*scalefactor,'AutoScale', 'off');
% subplot(1,5,5);
% quiver(x10,z10,ux10,uz10,5);
%  dlmwrite('vector_D3Q27.dat',C,'delimiter','\t','precision','%.16f');

