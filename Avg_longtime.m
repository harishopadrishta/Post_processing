% files = dir('/Users/HarishOpadrishta/Google Drive/UD/UD Spring 2016/Research/Results_Turbulent_Pipe_Flow/D3Q27/Turbulent_long_time/');
% 
% B = double(importdata(files(6).name));
% for i = 7: length(files)
%     A = double(importdata(files(i).name));
%     B = double(cat(3,B,A));
% end
% C = double(mean(B,3))
C = importdata('profile_D3Q27_350_500.dat');
rplus = C(:,2);
vave = C(:,3)+ 12.0;
plot(rplus,vave,'LineWidth',2);
% vrms = C(:,9);
% urrms = C(:,10);
% utrms = C(:,11);
% plot(rplus,vrms);
% hold on
% plot(rplus,urrms);
% hold on
% plot(rplus,utrms);
% legend('vrms','urrms','utrms');
% dlmwrite('profile_D3Q27_350_500.dat',C,'delimiter','\t','precision','%.16f');
