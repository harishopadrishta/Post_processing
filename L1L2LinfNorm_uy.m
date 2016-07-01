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
x1 = A1(:,1);
z1 = A1(:,2);
unum1 = A1(:,3);
uth1 = A1(:,4);
x2 = A2(:,1);
z2 = A2(:,2);
unum2 = A2(:,3);
uth2 = A2(:,4);
x3 = A3(:,1);
z3 = A3(:,2);
unum3 = A3(:,3);
uth3 = A3(:,4);
x4 = A4(:,1);
z4 = A4(:,2);
unum4 = A4(:,3);
uth4 = A4(:,4);
x5 = A5(:,1);
z5 = A5(:,2);
unum5 = A5(:,3);
uth5 = A5(:,4);
x6 = A6(:,1);
z6 = A6(:,2);
unum6 = A6(:,3);
uth6 = A6(:,4);
x7 = A7(:,1);
z7 = A7(:,2);
unum7 = A7(:,3);
uth7 = A7(:,4);
x8 = A8(:,1);
z8 = A8(:,2);
unum8 = A8(:,3);
uth8 = A8(:,4);
x9 = A9(:,1);
z9 = A9(:,2);
unum9 = A9(:,3);
uth9 = A9(:,4);
x10 = A10(:,1);
z10 = A10(:,2);
unum10 = A10(:,3);
uth10 = A10(:,4);
n = length(x1);
m = 0;
prad = 45.0;
L1(1:10)=0;
L2(1:10)=0;
Linf(1:10) = 0;
imax(1:10) = 0;
ucl = 0.05;
xmax(1:10) = 0;
zmax(1:10) = 0;
for i = 1:n
    r1(i) = sqrt(x1(i)*x1(i) + z1(i)*z1(i));
    if r1(i) < prad
        m = m + 1;
    end
    L1(1) = L1(1) + abs(unum1(i) - uth1(i));
    L1(2) = L1(2) + abs(unum2(i) - uth2(i));
    L1(3) = L1(3) + abs(unum3(i) - uth3(i));
    L1(4) = L1(4) + abs(unum4(i) - uth4(i));
    L1(5) = L1(5) + abs(unum5(i) - uth5(i));
    L1(6) = L1(6) + abs(unum6(i) - uth6(i));
    L1(7) = L1(7) + abs(unum7(i) - uth7(i));
    L1(8) = L1(8) + abs(unum8(i) - uth8(i));
    L1(9) = L1(9) + abs(unum9(i) - uth9(i));
    L1(10) = L1(10) + abs(unum10(i) - uth10(i));
    
    L2(1) = L2(1) + (unum1(i) - uth1(i))^2;
    L2(2) = L2(2) + (unum2(i) - uth2(i))^2;
    L2(3) = L2(3) + (unum3(i) - uth3(i))^2;
    L2(4) = L2(4) + (unum4(i) - uth4(i))^2;
    L2(5) = L2(5) + (unum5(i) - uth5(i))^2;
    L2(6) = L2(6) + (unum6(i) - uth6(i))^2;
    L2(7) = L2(7) + (unum7(i) - uth7(i))^2;
    L2(8) = L2(8) + (unum8(i) - uth8(i))^2;
    L2(9) = L2(9) + (unum9(i) - uth9(i))^2;
    L2(10) = L2(10) + (unum10(i) - uth10(i))^2;
    error1 = abs((unum1(i)-uth1(i))/uth1(i));
    if(error1>Linf(1))
        Linf(1) = error1;
        imax(1) = i;
    end
    error2 = abs((unum2(i)-uth2(i))/uth2(i));
    if(error1>Linf(2))
        Linf(2) = error2;
        imax(2) = i;
    end
    error3 = abs((unum3(i)-uth3(i))/uth3(i));
    if(error3>Linf(3))
        Linf(3) = error3;
        imax(3) = i;
    end
    error4 = abs((unum4(i)-uth4(i))/uth4(i));
    if(error4>Linf(4))
        Linf(4) = error4;
        imax(4) = i;
    end
    error5 = abs((unum5(i)-uth5(i))/uth5(i));
    if(error5>Linf(5))
        Linf(5) = error5;
        imax(5) = i;
    end
    error6 = abs((unum6(i)-uth6(i))/uth6(i));
    if(error6>Linf(6))
        Linf(6) = error6;
        imax(6) = i;
    end
    error7 = abs((unum7(i)-uth7(i))/uth7(i));
    if(error7>Linf(7))
        Linf(7) = error7;
        imax(7) = i;
    end
    error8 = abs((unum8(i)-uth8(i))/uth8(i));
    if(error8>Linf(8))
        Linf(8) = error8;
        imax(8) = i;
    end
    error9 = abs((unum9(i)-uth9(i))/uth9(i));
    if(error9>Linf(9))
        Linf(9) = error9;
        imax(9) = i;
    end
    error10 = abs((unum10(i)-uth10(i))/uth10(i));
    if(error10>Linf(10))
        Linf(10) = error10;
        imax(10) = i;
    end
end

for i =1:10
    time(i) = i*1000;
    L1(i) = L1(i)/m;
    L2(i) = sqrt(L2(i)/m);
end
xmax(1) = x1(imax(1));
zmax(1) = z1(imax(1));
xmax(2) = x2(imax(2));
zmax(2) = z2(imax(2));
xmax(3) = x3(imax(3));
zmax(3) = z3(imax(3));
xmax(4) = x4(imax(4));
zmax(4) = z4(imax(4));
xmax(5) = x5(imax(5));
zmax(5) = z5(imax(5));
xmax(6) = x6(imax(6));
zmax(6) = z6(imax(6));
xmax(7) = x7(imax(7));
zmax(7) = z7(imax(7));
xmax(8) = x8(imax(8));
zmax(8) = z8(imax(8));
xmax(9) = x9(imax(9));
zmax(9) = z9(imax(9));
xmax(10) = x10(imax(10));
zmax(10) = z10(imax(10));
fid = fopen('uy_Norm_D3Q19.txt','w+');
fprintf(fid,'%e\r\n',time, L1, L2, Linf,xmax,zmax);