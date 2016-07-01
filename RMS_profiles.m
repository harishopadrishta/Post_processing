A = importdata('profile2_D3Q27_200_350.dat');
B = importdata('mean_vel_pipe.dat');
C = importdata('profile2_D3Q27_150_300.dat');
yplus = A(:,2);
v1_D3Q27 = sqrt(A(:,4));
ur1_D3Q27 = sqrt(A(:,6));
ut1_D3Q27 = sqrt(A(:,7));
v2_D3Q27 = sqrt(C(:,4));
ur2_D3Q27 = sqrt(C(:,6));
ut2_D3Q27 = sqrt(C(:,7));
v_D3Q19 = B(:,9);
ur_D3Q19 = B(:,11);
ut_D3Q19 = B(:,12);
plot(yplus,v1_D3Q27);
hold on
plot(yplus,v2_D3Q27,'k');
hold on
plot(yplus,ur1_D3Q27,'+');
hold on
plot(yplus,ur2_D3Q27,'k+');
hold on
plot(yplus,ut1_D3Q27,'*');
hold on
plot(yplus,ut2_D3Q27,'k*');
