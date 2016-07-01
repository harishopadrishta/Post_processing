files = dir('C:\Users\vho\Google Drive\UD\UD Spring 2016\Research\Results_Turbulent_Pipe_Flow\D3Q19\Flowout\ur_ut_contours');
B = double(importdata(files(7).name));
for i = 8: length(files)
    A = double(importdata(files(i).name));
    B = double(cat(3,B,A));
end
C = double(mean(B,3));

n = length(C);

for i = 1:n
    x1(i) = C(i,1);
    z1(i) = C(i,2);
    ur(i) = C(i,10);
    ut(i) = C(i,13);
    r(i) = sqrt(x1(i)^2 + z1(i)^2);
    if r(i) > 148.5
        ux1(i) = 0;
        uz1(i) = 0;
    elseif r(i) == 0
            ux1(i) = ux1(i-1);
            uz1(i) = uz1(i-1);
    else
        ctheta = x1(i)/r(i);
        stheta = z1(i)/r(i);
        ux1(i) = ur(i)*ctheta - ut(i)*stheta;
        uz1(i) = ur(i)*stheta + ut(i)*ctheta;
    end
end
M = numel(x1);
index = 1:9:M;
x1 = reshape(x1,[],sqrt(n)/3);
z1 = reshape(z1,[],sqrt(n)/3);

ux1 = reshape(ux1,[],sqrt(n)/3);
uz1 = reshape(uz1,[],sqrt(n)/3);
scalefactor = 50;
figure;
quiver(x1(index),z1(index),ux1(index)*scalefactor,uz1(index)*scalefactor,'AutoScale','off');
 dlmwrite('ur_D3Q19_500_600.dat',C,'delimiter','\t','precision','%.16f');