files = dir('C:\Users\vho\Google Drive\UD\UD Spring 2016\Research\Results_Turbulent_Pipe_Flow\D3Q19\Flowout\uy_contours\');
B = double(importdata(files(8).name));
for i = 9: length(files)
    A = double(importdata(files(i).name));
    B = double(cat(3,B,A));
end
C = double(mean(B,3));
% D = importdata('mean_vel_pipe.dat');
x1 = C(:,1);
z1 = C(:,2);
uy1 = C(:,3) + 12.0;
n = length(x1);
r1 = D(:,1);
x1 = reshape(x1,[],sqrt(n));
z1 = reshape(z1,[],sqrt(n));
uy1 = reshape(uy1,[],sqrt(n));
% uymean1 = D(:,4);
% for i = 1:n
%     dist = sqrt(x1(i)^2 + z1(i)^2);
%     if dist == 148.5
%         urms1(i) = uy(i)*uy(i) - uymean1(100)^2;
%     elseif dist <= 148.5
%         ibin = floor(dist/1.485) + 1;
%         urms1(i) = uy1(i)*uy1(i) - uymean1(ibin)^2;
%     else
%         urms1(i) = 0.0;
%     end
% end
% urms1 = reshape(urms1,[],sqrt(n));

% figure;
% contourf(x1,z1,urms1);
% colorbar;
figure;
contourf(x1,z1,uy1);
colorbar;
% vrms = C(:,9);
% urrms = C(:,10);
% utrms = C(:,11);
% plot(rplus,vrms);
% hold on
% plot(rplus,urrms);
% hold on
% plot(rplus,utrms);
% legend('vrms','urrms','utrms');
% dlmwrite('contour_D3Q27__uy_375_500.dat',C,'delimiter','\t','precision','%.16f');
