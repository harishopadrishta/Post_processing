files = dir('C:\Users\vho\Desktop\Centerline_velocity\');
    B = double(importdata(files(6).name));
    ucl = mean(B(:,3));
    vtheory = mean(B(:,4));
    time = 100;
    C = [time ucl vtheory];
for i = 2:200
    j = 5+i;
    B = double(importdata(files(j).name));
    ucl = mean(B(:,3));
    vtheory = mean(B(:,4));
    time = i*100;
    D = [time ucl vtheory];
    C = double(cat(1,C,D));
end
 dlmwrite('ucl.dat',C,'delimiter','\t','precision','%.16f');
   