format long E;
A = importdata('uy_Norm_D3Q27.txt');
B = importdata('uy_Norm_D3Q19.txt');
time = A(1:10);
L1_D3Q27 = A(11:20);
L2_D3Q27 = A(21:30);
L1_D3Q19 = B(11:20);
L2_D3Q19 = B(21:30);
plot(time,L1_D3Q27,'-o','LineWidth',2);
% hold on
% plot(time,L2_D3Q27,'-o','LineWidth',2);
hold on 
plot(time,L1_D3Q19,'g-o','LineWidth',2);
% hold on
% plot(time, L2_D3Q19,'g-o','LineWidth',2);
xlabel('Time');
ylabel('L1 Norm');
legend('L1-Norm D3Q27','L1-Norm D3Q19');
